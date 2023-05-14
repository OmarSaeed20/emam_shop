import 'package:dartz/dartz.dart';
import 'package:ecommerce/index.dart';

class ItemsRepo {
  static ItemsRepo get to => Get.find();
  ApiClient api = ApiClient.to;

  Future<dynamic> getItems({required String id}) async {
    Either<RequestStatus, Map> requset =
        await api.postData(ApiLinks.items, {"id": id.toString()});
    return requset.fold((l) => l, (r) => r);
  }
}
