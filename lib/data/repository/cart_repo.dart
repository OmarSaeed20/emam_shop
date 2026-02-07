import 'package:dartz/dartz.dart';
import 'package:ecommerce/index.dart';

class CartRepo {
  static CartRepo get to => Get.find();
  ApiClient api = ApiClient.to;

  Future<dynamic> getCartView({required String userId}) async {
    Either<RequestStatus, Map> requset =
        await api.postData(ApiLinks.cartview, {"usersid": userId});
    return requset.fold((l) => l, (r) => r);
  }

  Future<dynamic> getCountItems(
      {required String userId, required String itemsId}) async {
    Either<RequestStatus, Map> requset = await api.postData(
      ApiLinks.carCountItems,
      {"usersid": userId, "itemsid": itemsId},
    );
    return requset.fold((l) => l, (r) => r);
  }

  Future<dynamic> addCart(
      {required String usersId, required String itemsId}) async {
    Either<RequestStatus, Map> requset = await api
        .postData(ApiLinks.cartAdd, {"usersid": usersId, "itemsid": itemsId});
    return requset.fold((l) => l, (r) => r);
  }

  Future<dynamic> removeCart(
      {required String usersId, required String itemsId}) async {
    Either<RequestStatus, Map> requset = await api.postData(
        ApiLinks.cartDelete, {"usersid": usersId, "itemsid": itemsId});
    return requset.fold((l) => l, (r) => r);
  }

  Future<dynamic> checkout({required Map map}) async {
    Either<RequestStatus, Map> requset =
        await api.postData(ApiLinks.checkout, map);
    return requset.fold((l) => l, (r) => r);
  }

  Future<dynamic> getOrdersView({required String userId}) async {
    Either<RequestStatus, Map> requset =
        await api.postData(ApiLinks.ordersPending, {"user_id": userId});
    return requset.fold((l) => l, (r) => r);
  }
}
