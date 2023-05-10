// import 'dart:developer';

import 'dart:developer';

import '/index.dart';

abstract class HomeController extends GetxController {
  Future<dynamic> getHomeData();
  void goToCategorieItem(int index);
}

class HomeControllerImp extends HomeController {
  HomeRepo repo = Get.find();

  RequestStatus requestStatus = RequestStatus.none;

  @override
  void onInit() {
    getHomeData();
    super.onInit();
  }

  List<ItemsModel>? _items = [];
  List<ItemsModel>? get items => _items;
  List<CategoriesModel>? _categories = [];
  List<CategoriesModel>? get categories => _categories;
  @override
  Future<dynamic> getHomeData() async {
    requestStatus = RequestStatus.loading;
    _categories = [];
    _items = [];
    update();
    var response = await repo.getHome();
    requestStatus = handlingRespose(response);

    if (requestStatus == RequestStatus.success) {
      if (response["status"] == "success") {
        for (var i in response["categories"]) {
          _categories!.add(CategoriesModel.fromJson(i));
        }
        for (var i in response["items"]) {
          items!.add(ItemsModel.fromJson(i));
        }
        update();
      } else {
        log('error in =>> get home [RequestStatus.noData]');
        requestStatus = RequestStatus.noData;
      }
    }
    update();
  }

  @override
  void goToCategorieItem(int index) {
    final model = _categories![index];
    Get.toNamed(RouteHelper.getCategorieItemPage(), arguments: model);
  }
}
