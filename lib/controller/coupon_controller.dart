import 'dart:developer';

import '/index.dart';

abstract class CouponController extends GetxController {
  void isCheckeds(bool val);
  Future<void> getCouponsView();
  Future<void> getCoupon({String? couponName});
}

class CouponControllerImp extends CouponController {
  CouponControllerImp get to => Get.find();

  CouponRepo repo = Get.find();
  DatabaseHelper database = Get.find();
  // loading
  RequestStatus _requestStatus = RequestStatus.none;
  RequestStatus get requestStatus => _requestStatus;
  DateTime? now;
  @override
  void onInit() {
    getCouponsView();
    now = DateTime.now();
    super.onInit();
  }

  TextEditingController? _search;
  TextEditingController? get search => _search;
  initData() {
    _search = TextEditingController();
  }

  bool _isChecked = false;
  bool get isChecked => _isChecked;

  @override
  void isCheckeds(bool val) {
    _isChecked = val;
    update();
  }

  final List<CouponModel> _listCoupons = [];
  List<CouponModel> get listCoupons => _listCoupons;
  @override
  Future<void> getCouponsView() async {
    _requestStatus = RequestStatus.loading;
    update();
    var response = await repo.getCoupons();
    _requestStatus = handlingRespose(response);
    if (_requestStatus == RequestStatus.success) {
      if (response["status"] == "success") {
        _requestStatus = RequestStatus.success;
        List result = response["data"];
        _listCoupons.addAll(result.map((e) => CouponModel.fromJson(e)));
      } else {
        _requestStatus = RequestStatus.noData;
        snackBarMessage(title: "warning", msg: response["data"]);
      }
      update();
    } else if (_requestStatus == RequestStatus.offLineFailure ||
        _requestStatus == RequestStatus.serverFailure ||
        _requestStatus == RequestStatus.serverException) {
      snackBarMessage(title: "warning", msg: "can't get data");
      update();
    } else {}
  }

  CouponModel? _couponModel;
  CouponModel? get couponModel => _couponModel;
  @override
  Future<void> getCoupon({String? couponName}) async {
    log(search!.text);
    if (!search.isBlank!) {
      _requestStatus = RequestStatus.loading;
      update();
      var response = await repo.getCouponName(couponName ?? search!.text);
      _requestStatus = handlingRespose(response);

      if (_requestStatus == RequestStatus.success) {
        if (response["status"] == "success") {
          _requestStatus = RequestStatus.success;
          _couponModel = CouponModel.fromJson(response["data"]);
          snackBarSuccess(
              msg: "you got ${response["data"]['coupon_discount']}");
          Get.offNamed(RouteHelper.getCart());
          update();
        } else {
          _requestStatus = RequestStatus.success;
          snackBarMessage(title: "warning", msg: response["data"]);
          update();
        }
      } else if (_requestStatus == RequestStatus.offLineFailure ||
          _requestStatus == RequestStatus.serverFailure ||
          _requestStatus == RequestStatus.serverException) {
        snackBarMessage(title: "warning", msg: "can't get data");
        update();
      } else {}
    }
    update();
  }

  @override
  void dispose() {
    _search!.dispose();
    super.dispose();
  }
}
