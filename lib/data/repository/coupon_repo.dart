import 'package:dartz/dartz.dart';
import 'package:ecommerce/index.dart';

class CouponRepo {
  static CouponRepo get to => Get.find();
  ApiClient api = ApiClient.to;

  Future<dynamic> getCoupons() async {
    Either<RequestStatus, Map> requset = await api.getData(ApiLinks.couponView);
    return requset.fold((l) => l, (r) => r);
  }

  Future<dynamic> getCouponName(String couponName) async {
    Either<RequestStatus, Map> requset =
        await api.postData(ApiLinks.couponName, {"coupon_name": couponName});
    return requset.fold((l) => l, (r) => r);
  }
}
