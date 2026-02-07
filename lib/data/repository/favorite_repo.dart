import 'package:dartz/dartz.dart';
import 'package:ecommerce/index.dart';

class FavoriteRepo {
  static FavoriteRepo get to => Get.find();
  ApiClient api = ApiClient.to;

  Future<dynamic> getFavo({required String userId}) async {
    Either<RequestStatus, Map> requset =
        await api.postData(ApiLinks.favoView, {"user_id": userId});
    return requset.fold((l) => l, (r) => r);
  }

  Future<dynamic> addFavo(
      {required String usersId, required String itemsId}) async {
    Either<RequestStatus, Map> requset = await api
        .postData(ApiLinks.addFavo, {"usersid": usersId, "itemsid": itemsId});
    return requset.fold((l) => l, (r) => r);
  }

  Future<dynamic> removeFavo(
      {required String usersId, required String itemsId}) async {
    Either<RequestStatus, Map> requset = await api.postData(
        ApiLinks.removeFavo, {"usersid": usersId, "itemsid": itemsId});
    return requset.fold((l) => l, (r) => r);
  }

  Future<dynamic> deleteFromFavo({required String favId}) async {
    Either<RequestStatus, Map> requset =
        await api.postData(ApiLinks.deleteFavo, {"favorite_id": favId});
    return requset.fold((l) => l, (r) => r);
  }
}
