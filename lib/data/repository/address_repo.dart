import 'package:dartz/dartz.dart';
import 'package:ecommerce/index.dart';

class AddressRepo {
  static AddressRepo get to => Get.find();
  ApiClient api = Get.find();

  Future<dynamic> getAddressView({required String userId}) async {
    Either<RequestStatus, Map> requset =
        await api.postData(ApiLinks.addressView, {"usersid": userId});
    return requset.fold((l) => l, (r) => r);
  }

  Future<dynamic> addAddress({required Map body}) async {
    Either<RequestStatus, Map> requset =
        await api.postData(ApiLinks.addressAdd, body);
    return requset.fold((l) => l, (r) => r);
  }

  Future<dynamic> editAddress({required Map body}) async {
    Either<RequestStatus, Map> requset =
        await api.postData(ApiLinks.addressEdit, body);
    return requset.fold((l) => l, (r) => r);
  }

  Future<dynamic> deleteAddress({required String addressId}) async {
    Either<RequestStatus, Map> requset =
        await api.postData(ApiLinks.addressRemove, {"addressid": addressId});
    return requset.fold((l) => l, (r) => r);
  }
}
