import 'package:dartz/dartz.dart';
import 'package:ecommerce/index.dart';

class HomeRepo {
  static HomeRepo get to => Get.find();
  ApiClient api = ApiClient.to;

  Future<dynamic> getCategoriesView() async {
    Either<RequestStatus, Map> requset = await api.getData(ApiLinks.categoriesView);
    return requset.fold((l) => l, (r) => r);
  }
  
  Future<dynamic> getHome() async {
    Either<RequestStatus, Map> requset = await api.getData(ApiLinks.home);
    return requset.fold((l) => l, (r) => r);
  }

  Future<dynamic> getCategoriesSearch({required String search}) async {
    Either<RequestStatus, Map> requset =
        await api.postData(ApiLinks.categoriesSearch, {"search": search});
    return requset.fold((l) => l, (r) => r);
  }
}
