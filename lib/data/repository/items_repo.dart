import 'package:dartz/dartz.dart';
import 'package:ecommerce/index.dart';

class ItemsRepo {
  static ItemsRepo get to => Get.find();
  ApiClient api = ApiClient.to;

  Future<dynamic> getItems(
      {required String categoryid, required String usersid}) async {
    Either<RequestStatus, Map> requset = await api.postData(
        ApiLinks.items, {"categoryid": categoryid, "usersid": usersid});
    return requset.fold((l) => l, (r) => r);
  }

  Future<dynamic> getItemsSearch({required String search}) async {
    Either<RequestStatus, Map> requset =
        await api.postData(ApiLinks.itemsSearch, {"search": search});
    return requset.fold((l) => l, (r) => r);
  }
}
