import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../index.dart';

abstract class MyOrderController extends GetxController {
  Future<Either<RequestStatus, void>> getPendingOrder1();
  Future<Either<RequestStatus, void>> getOrderDetails(String orderId);
}

class MyOrderControllerImp extends MyOrderController {
  static MyOrderControllerImp get to => Get.find();
  MyOrderRepo repo = Get.find<MyOrderRepo>();

  final DatabaseHelper database = Get.find();
  Completer<GoogleMapController>? completer;
  late String userId;
  late String userName;
  late String userEmail;
  late String userPhone;

  RequestStatus _requestStatus = RequestStatus.none;
  RequestStatus get requestStatus => _requestStatus;

  init() {
    userId = database.getString(EndPoint.userId);
    userName = database.getString(EndPoint.userName);
    userEmail = database.getString(EndPoint.userEmail);
    userPhone = database.getString(EndPoint.userPhone);
  }

  @override
  void onInit() {
    init();
    getPendingOrder1()
        .then((value) => debugPrint('then requestStatus : $requestStatus'));
    super.onInit();
  }

  final List<OrdersModel> _myOrders = [];
  List<OrdersModel> get myOrders => _myOrders;
  @override
  getPendingOrder1() async {
    _requestStatus = RequestStatus.loading;

    update();
    var response = await repo.getOrderPending(userId);
    _requestStatus = handlingRespose(response);

    if (_requestStatus == RequestStatus.success) {
      if (response["status"] == "success") {
        _myOrders.clear();
        List result = response["data"];
        update();
        return right(
            _myOrders.addAll(result.map((e) => OrdersModel.fromJson(e))));
      } else {
        debugPrint('no : $_requestStatus');
        snackBarMessage(title: "warning", msg: response["data"]);
        update();
        return const Left(RequestStatus.noData);
      }
    } else {
      debugPrint("<Left  -->serverException>");
      update();
      return const Left(RequestStatus.serverException);
    }
  }

  String printOrderType(String val) {
    if (val == "0") {
      return "delivery";
    } else if (val == "1") {
      return "recive";
    } else {
      return "none";
    }
  }

  String printPayment(String val) {
    if (val == "0") {
      return "cash";
    } else if (val == "1") {
      return "payment Card";
    } else {
      return "none";
    }
  }

  String printOrderStatus(String val) {
    if (val == "0") {
      return "waiting for approval";
    } else if (val == "1") {
      return "prepare";
    } else if (val == "2") {
      return "delivery";
    } else if (val == "3") {
      return "recived";
    } else {
      return "none";
    }
  }

  OrdersModel? orderData;
  double? lat;
  double? long;
  goToDetailsScreen(OrdersModel model) {
    debugPrint(">>>>>>>>>>>>> $model");
    orderData = model;
    getOrderDetails(model.id!).then((value) {
      completer = Completer<GoogleMapController>();
      lat = double.parse(model.addressLat!);
      long = double.parse(model.addressLong!);
      Get.toNamed(RouteHelper.getOrdersDetailes());
    });
  }

  final List<OrderDetailsModel> _orderDetails = [];
  List<OrderDetailsModel> get orderDetails => _orderDetails;
  @override
  getOrderDetails(orderId) async {
    _requestStatus = RequestStatus.loading;
    update();
    var response = await repo.getOrderDetails(orderId);
    _requestStatus = handlingRespose(response);
    if (_requestStatus == RequestStatus.success) {
      if (response["status"] == "success") {
        _orderDetails.clear();
        List result = response["data"];
        debugPrint('_orderDetails?>>>>>>>>>> : $result');
        update();
        return right(_orderDetails
            .addAll(result.map((e) => OrderDetailsModel.fromJson(e))));
      } else {
        debugPrint('no : $_requestStatus');
        snackBarMessage(title: "warning", msg: response["data"]);
        update();
        return const Left(RequestStatus.noData);
      }
    } else {
      debugPrint("<Left  -->serverException>");
      update();
      return const Left(RequestStatus.serverException);
    }
  }

  List<Marker> marker = <Marker>[];
  allMarker() {
    marker.add(
      Marker(markerId: const MarkerId("1"), position: LatLng(lat!, long!)),
    );

    update();
  }
}
