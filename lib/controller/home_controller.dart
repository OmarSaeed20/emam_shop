// import 'dart:developer';

import 'dart:developer';

import 'package:ecommerce/data/model/categories_model.dart';

import '/index.dart';

abstract class HomeController extends GetxController {
  Future<dynamic> getHomeData();
}

class HomeControllerImp extends HomeController {
  HomeRepo repo = Get.find();

  RequestStatus requestStatus = RequestStatus.none;

  @override
  void onInit() {
    getHomeData();
    super.onInit();
  }

  List _categories = [];
  List get categories => _categories;
  /* List<CategoriesModel>? _categories = [];
  List<CategoriesModel>? get categories => _categories; */
  @override
  Future<dynamic> getHomeData() async {
    requestStatus = RequestStatus.loading;
    update();
    var response = await repo.getHome();
    requestStatus = handlingRespose(response);

    if (requestStatus == RequestStatus.success) {
      if (response["status"] == "success") {
        /* _userdata = UserModel.fromJson(response["data"][0]);
        log(_userdata.toString());
         */
        _categories.addAll(response["categories"]);
        log(_categories.toString());
        update();
      } else {
        requestStatus = RequestStatus.noData;
      }
    }
    update();
  }
}
