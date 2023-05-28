import 'dart:developer';

import '/index.dart';

abstract class HomeController extends GetxController {
  Future<dynamic> getHomeData();
  Future<dynamic> getCategoriesSearch(String search);
  
  void goToAllCategories();
  void goToItemScreen(int index, String cateId);
}

class HomeControllerImp extends HomeController {
  static HomeControllerImp get to => Get.find();
  HomeRepo repo = Get.find();
  DatabaseHelper database = Get.find();
  String? lang;
  CartControllerImp cartController = Get.find();

  RequestStatus _requestStatus = RequestStatus.none;
  RequestStatus get requestStatus => _requestStatus;

  @override
  void onInit() {
    lang = database.getString(EndPoint.lang);
    getHomeData();
    super.onInit();
  }

  List<ItemsModel> _items = [];
  List<ItemsModel> get allItems => _items;
  List<CategoriesModel>? _categories = [];
  List<CategoriesModel>? get categories => _categories;
  @override
  Future<dynamic> getHomeData() async {
    _requestStatus = RequestStatus.loading;
    _categories = [];
    _items = [];
    update();
    var response = await repo.getHome();
    _requestStatus = handlingRespose(response);

    if (requestStatus == RequestStatus.success) {
      if (response["status"] == "success") {
        for (var i in response["categories"]["data"]) {
          _categories!.add(CategoriesModel.fromJson(i));
          // setCategoriesMap();
        }
        for (var i in response["items"]["data"]) {
          _items.add(ItemsModel.fromJson(i));
          // setItemsMap();
        }
        update();
      } else {
        log('error in =>> get home [RequestStatus.noData]');
        _requestStatus = RequestStatus.noData;
      }
    }
    update();
  }

  @override
  Future<dynamic> getCategoriesSearch(search) async {
    _requestStatus = RequestStatus.loading;

    update();
    var response = await repo.getCategoriesSearch(search: search.trim());
    _requestStatus = handlingRespose(response);
    if (_requestStatus == RequestStatus.success) {
      if (response["status"] == "success") {
        _categories!.clear();
        List result = response["data"];
        _categories!.addAll(result.map((e) => CategoriesModel.fromJson(e)));
        update();
        log("$categories");
      } else {
        _requestStatus = RequestStatus.noData;
        log('  get_categoriesearch =>>RequestStatus.noData');
        update();
      }
      update();
    } else if (_requestStatus == RequestStatus.serverFailure ||
        _requestStatus == RequestStatus.serverException) {
      snackBarMessage(title: "warning", msg: "Please try again");
      update();
    } else if (_requestStatus == RequestStatus.offLineFailure) {
      _requestStatus == RequestStatus.offLineFailure;
    } else {}
  }

  Future<dynamic> getCategories() async {
    _requestStatus = RequestStatus.loading;
    _categories!.clear();
    update();
    var response = await repo.getCategoriesView();
    _requestStatus = handlingRespose(response);
    if (_requestStatus == RequestStatus.success) {
      if (response["status"] == "success") {
        List result = response["data"];
        _categories!.addAll(result.map((e) => CategoriesModel.fromJson(e)));
        update();
        log("$categories");
      } else {
        _requestStatus = RequestStatus.noData;
        log('  get_categorie  =>>RequestStatus.noData');
        update();
      }
      update();
    } else if (_requestStatus == RequestStatus.serverFailure ||
        _requestStatus == RequestStatus.serverException) {
      snackBarMessage(title: "warning", msg: "Please try again");
      update();
    } else if (_requestStatus == RequestStatus.offLineFailure) {
      _requestStatus == RequestStatus.offLineFailure;
    } else {}
  }

  CategoriesModel? getCategoryByIdLinear2(int id) {
    // Use linear search to find a category by its ID
    for (var i = 0; i < categories!.length; i++) {
      categories!.sort();
      if (int.parse(categories![i].id!) == id) {
        return categories![i];
      }
    }
    return null;
  }

  CategoriesModel? getCategoryByIdLinear(int id) {
    // Use linear search to find a category by its ID
    return categories!.firstWhere(
      (category) => int.parse(category.id!) == id,
      orElse: () => const CategoriesModel(),
    );
  }

  CategoriesModel? getCategoryByIdBinary(int id) {
    // Use binary search to find a category by its ID
    var start = 0;
    var end = categories!.length - 1;
    while (start <= end) {
      var mid = (start + end) ~/ 2;
      if (int.parse(categories![mid].id!) == id) {
        return categories![mid];
      } else if (int.parse(categories![mid].id!) < id) {
        start = mid + 1;
      } else {
        end = mid - 1;
      }
    }
    return null;
  }

  CategoriesModel? getCategoryByNameBinary(String name) {
    // Use binary search to find a category by its name
    log('start');
    var left = 0;
    var right = categories!.length - 1;
    while (left <= right) {
      var mid = (left + right) ~/ 2;
      if (categories![mid].name == name) {
        log('categories![mid]');
        return categories![mid];
      } else if (categories![mid].name!.compareTo(name) < 0) {
        log('left');
        left = mid + 1;
      } else {
        log('right');
        right = mid - 1;
      }
    }
    return null;
  }

  @override
  void goToAllCategories() {
    Get.toNamed(
      RouteHelper.getAllCategories(),
      arguments: {"categories": categories},
    );
  }

  /* bool favoriteHome = false;
  IconData favoriteHomeIcon = CupertinoIcons.heart;
  void onfavoritHomeeUpdat() {
    debugPrint("$favoriteHome");
    favoriteHome = !favoriteHome;
    favoriteHomeIcon =
        favoriteHome ? CupertinoIcons.heart_fill : CupertinoIcons.heart;
    update();
  } */

/* 

<!-- SELECT itmes1view.* ,1 as favorite FROM itmes1view
INNER JOIN favorite ON favorite.favorite_itemsid = itmes1view.items_id AND favorite.favorite_usersid = 40
UNION ALL
SELECT * , 0 as favorite FROM itmes1view 
WHERE items_id NOT IN ( SELECT itmes1view.items_id FROM itmes1view
INNER JOIN favorite ON favorite.favorite_itemsid = itmes1view.items_id AND favorite.favorite_usersid = 40 ) -->
 */
//////////////////////////// item Screen  ////////////////////
  ItemsControllerImp itemsControl = Get.find();
  @override
  void goToItemScreen(index, cateId) {
    var cateModel = _categories![index];
    itemsControl.getItemsData(cateId);
    Get.toNamed(
      RouteHelper.getItemsScreen(),
      arguments: {"cateModel": cateModel, "cateId": cateId},
    );
  }

  void goToProductDeScreen(ItemsModel model, catId) {
    itemsControl
        .getItemsData(catId)
        .then((value) => itemsControl.goToProductDetaile(model
            /* model.id == itemsControl.itemsModePro!.id
                  ? itemsControl.itemsModePro!
                  : model, */
            ));
  }

  void goToCart() {
    cartController.getCart();

    Get.toNamed(RouteHelper.getCart());
  }
}
