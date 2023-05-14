import 'dart:developer';

import '/index.dart';

abstract class HomeController extends GetxController {
  Future<dynamic> getHomeData();
  void goToAllCategories();
  void goToItemScreen(int index, String id);
  void goToProductDetaile(ItemsModel itemsModel);
  Future<dynamic> getItemsData(String categoryid);
/*   void setCategoriesMap();
  void setItemsMap(); */
}

class HomeControllerImp extends HomeController {
  static HomeControllerImp get to => Get.find();
  HomeRepo repo = Get.find();
  String? lang;

  RequestStatus _requestStatus = RequestStatus.none;
  RequestStatus get requestStatus => _requestStatus;

  @override
  void onInit() {
    lang = DatabaseHelper.to.getString(EndPoint.lang);
    getHomeData();
    super.onInit();
  }

  List<ItemsModel> _items = [];
  List<ItemsModel> get items => _items;
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
        for (var i in response["categories"]) {
          _categories!.add(CategoriesModel.fromJson(i));
          // setCategoriesMap();
        }
        for (var i in response["items"]) {
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
  void goToAllCategories() {
    Get.toNamed(
      RouteHelper.getAllCategories(),
      arguments: {
        "categories": categories,
        // "items": items,
      },
    );
  }

  @override
  void goToItemScreen(index, id) {
    var categoriesModel = _categories![index];
    getItemsData(id);
    Get.toNamed(
      RouteHelper.getCategorieItemPage(),
      arguments: {
        "categoriesModel": categoriesModel,
        // "categoriesId": id,
      },
    );
  }

  List<ItemsModel> _itemsScreenList = [];
  List<ItemsModel> get itemsScreenList => _itemsScreenList;
  @override
  Future<dynamic> getItemsData(categoryid) async {
    _requestStatus = RequestStatus.loading;
    _itemsScreenList = [];
    update();
    var response = await repo.getItems(id: categoryid);
    _requestStatus = handlingRespose(response);
    if (_requestStatus == RequestStatus.success) {
      if (response["status"] == "success") {
        for (var element in response["data"]) {
          _itemsScreenList.add(ItemsModel.fromJson(element));
          update();
          log("$_itemsScreenList");
        }
      } else {
        _requestStatus = RequestStatus.noData;
        log('message getItemsData =>>RequestStatus.noData');
        update();
      }
      update();
    } else if (_requestStatus == RequestStatus.serverFailure ||
        _requestStatus == RequestStatus.serverException) {
      // _requestStatus == RequestStatus.offLineFailure;
      snackBarMessage(title: "warning", msg: "Please try again");
      update();
    } else if (_requestStatus == RequestStatus.offLineFailure) {
      _requestStatus == RequestStatus.offLineFailure;
    } else {}
  }

  ItemsModel? _itemsModePro;
  ItemsModel? get itemsModePro => _itemsModePro;
  @override
  void goToProductDetaile(itemsModel) {
    _itemsModePro = itemsModel;
    Get.toNamed(
      RouteHelper.getProductDetailePage(),
      arguments: {"items_model ": itemsModel},
    ); 
  }
  /*   final Map<String, CategoriesModel> _categoryMap = <String, CategoriesModel>{};
  Map<String, CategoriesModel> get categoryMap => _categoryMap;
  final Map<int, ItemsModel> _itemsMapInt = <int, ItemsModel>{};
  Map<int, ItemsModel> get itemsMapInt => _itemsMapInt;
  final Map<String, ItemsModel> _itemsMap = <String, ItemsModel>{};
  Map<String, ItemsModel> get itemsMap => _itemsMap; */
/* 
  @override
  void setCategoriesMap() {
    /* Map<String, CategoriesModel> _categoryMap =
            Map<String, CategoriesModel>.fromIterable(categories!,
          key: (category) => category.name,
          value: (category) => category,
        ); */
    for (var category in categories!) {
      _categoryMap[category.name!] = category;
      _categoryMap[category.nameAr!] = category;
    }
  }

  final myTable = <int, dynamic>{};
  @override
  void setItemsMap() {
    // Update the GetByIdHash table using the API data
    /* var myTable = items.asMap().map((index, item) => MapEntry(item.id, item)); */
    for (var items in items) {
      _itemsMapInt[int.parse(items.price!)] = items;
      _itemsMapInt[int.parse(items.id!)] = items;
    }
    for (var items in items) {
      _itemsMap[items.name!] = items;
      _itemsMap[items.nameAr!] = items;
    }
  } */
}
