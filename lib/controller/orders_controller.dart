import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../index.dart';

abstract class MyOrderController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Future<Either<RequestStatus, void>> getPendingOrder1();
  Future<void> onTapRemoveOrder(ordersId);
  Future<Either<RequestStatus, void>> getOrderDetails(String orderId);
  Future<Either<RequestStatus, void>> getArchiveOrders();
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

    _tabController = TabController(length: 2, vsync: this);

    getPendingOrder1()
        .then((value) => debugPrint('then requestStatus : $requestStatus'));
    update();
    getArchiveOrders().then(
        (value) => debugPrint('then archiRequestStatus : $archiRequestStatus'));
    update();

    super.onInit();
  }

  TabController? _tabController;
  TabController? get tabController => _tabController;
  @override
  void onClose() {
    tabController!.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    init();

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

  @override
  onTapRemoveOrder(ordersId) async {
    _requestStatus = RequestStatus.loading;
    update();
    final response = await repo.removeOrder(ordersId);
    _requestStatus = handlingRespose(response);
    if (_requestStatus == RequestStatus.success) {
      if (response['status'] == 'success') {
        getPendingOrder1();
      } else {
        _requestStatus = RequestStatus.noData;
        debugPrint(' (failure) ---> ${response["message"]}');
      }
    }
    update();
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
      return "order processing";
    } else if (val == "2") {
      return "ready to picked up by delivery man";
    } else if (val == "3") {
      return "on the way";
    } else if (val == "4") {
      return "receved"; // archive
    } else {
      return "none";
    }
  }

  List<OrderStatus> orderStatus = [
    OrderStatus("waiting for approval", AppImages.status0),
    OrderStatus("order processing", AppImages.status1),
    OrderStatus("ready to picked up by delivery man", AppImages.status4),
    OrderStatus("on the way", AppImages.status3),
    OrderStatus("receved", AppImages.status44),
  ];
  OrdersModel? orderData;
  double? lat;
  double? long;
  goToDetailsScreen(OrdersModel model) {
    debugPrint(">>>>>>>>>>>>> $model");
    orderData = model;
    getOrderDetails(model.id!).then((value) {
      if (model.ordersAddressid != "0") {
        completer = Completer<GoogleMapController>();
        lat = double.parse(model.addressLat!);
        long = double.parse(model.addressLong!);
      }
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
        _requestStatus = RequestStatus.noData;
        update();
        return const Left(RequestStatus.noData);
      }
    } else {
      debugPrint("<Left  --> serverException>");
      update();
      return const Left(RequestStatus.serverException);
    }
  }

  List<Marker> marker = <Marker>[];
  allMarker() {
    marker.clear();
    marker.add(
      Marker(markerId: const MarkerId("1"), position: LatLng(lat!, long!)),
    );
    update();
  }

  final List<OrdersModel> _archiveOrders = [];
  List<OrdersModel> get archiveOrders => _archiveOrders;
  RequestStatus archiRequestStatus = RequestStatus.loading;
  @override
  getArchiveOrders() async {
    archiRequestStatus = RequestStatus.loading;
    update();
    var response = await repo.getArchiveOrders(userId);
    archiRequestStatus = handlingRespose(response);
    if (archiRequestStatus == RequestStatus.success) {
      if (response["status"] == "success") {
        _archiveOrders.clear();
        List result = response["data"];
        debugPrint('Archive?>>>>>>>>>> : $result');
        update();
        return right(
            _archiveOrders.addAll(result.map((e) => OrdersModel.fromJson(e))));
      } else {
        archiRequestStatus = RequestStatus.noData;
        update();
        return const Left(RequestStatus.noData);
      }
    } else {
      debugPrint("Archive<Left  -->serverException>");
      update();
      return const Left(RequestStatus.serverException);
    }
  }
}

class OrderStatus {
  final String title;
  final String img;

  OrderStatus(this.title, this.img);
}
