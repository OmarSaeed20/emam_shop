import 'package:dartz/dartz.dart';
import 'package:ecommerce/index.dart';

class HomeRepo {
  static HomeRepo get to => Get.find();
  ApiClient api = ApiClient.to;

  Future<dynamic> getHome() async {
    Either<RequestStatus, Map> requset = await api.getData(ApiLinks.home);
    return requset.fold((l) => l, (r) => r);
  }

  Future<dynamic> getItems(
      {required String categoryid, required String usersid}) async {
    Either<RequestStatus, Map> requset = await api.postData(
        ApiLinks.items, {"categoryid": categoryid, "usersid": usersid});
    return requset.fold((l) => l, (r) => r);
  }
}
