import 'dart:developer';

import 'package:flutter/cupertino.dart';

import '/index.dart';

abstract class ItemsController extends GetxController {
  void intialData();
  Future<dynamic> getItemsData(String categoryid);
  Future<dynamic> getItemsSearch(String search);
  void goToProductDetaile(ItemsModel itemsModel);
  /* void updateOrientation(Orientation newOrientation); */
}

class ItemsControllerImp extends ItemsController {
  static ItemsControllerImp get to => Get.find();

  ItemsRepo repo = Get.find();
  CartControllerImp cartController = Get.find();
  DatabaseHelper database = Get.find();
  String? lang;

  RequestStatus _requestStatu = RequestStatus.none;
  RequestStatus get requestStatu => _requestStatu;

  CartControllerImp cartContro = Get.find();
  // final String? _categoryId = Get.arguments['cateId'];
  /* // Store the current screen orientation
  var orientation = Orientation.portrait;

  // Update the screen orientation
  @override
  void updateOrientation(Orientation newOrientation) {
    if (newOrientation != orientation) {
      orientation = newOrientation;
      update();
    }
  } */

  @override
  void intialData() {
    lang = database.getString(EndPoint.lang);
    // getItemsData(_categoryId!);
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }

  List<ItemsModel> _itemsScreenList = [];
  List<ItemsModel> get itemsScreenList => _itemsScreenList;
  @override
  Future<dynamic> getItemsData(categoryid) async {
    _requestStatu = RequestStatus.loading;
    _itemsScreenList = [];
    update();
    var response = await repo.getItems(
      categoryid: categoryid,
      usersid: database.getString(EndPoint.userId),
    );
    _requestStatu = handlingRespose(response);
    if (_requestStatu == RequestStatus.success) {
      if (response["status"] == "success") {
        for (var element in response["data"]) {
          _itemsScreenList.add(ItemsModel.fromJson(element));
          update();
          log("$_itemsScreenList");
        }
      } else {
        _requestStatu = RequestStatus.noData;
        log('message getItemsData =>>RequestStatus.noData');
        update();
      }
      update();
    } else if (_requestStatu == RequestStatus.serverFailure ||
        _requestStatu == RequestStatus.serverException) {
      snackBarMessage(title: "warning", msg: "Please try again");
      update();
    } else if (_requestStatu == RequestStatus.offLineFailure) {
      _requestStatu == RequestStatus.offLineFailure;
    } else {}
  }
 
  @override
  Future<dynamic> getItemsSearch(search) async {
    _requestStatu = RequestStatus.loading;
    _itemsScreenList.clear();
    update();
    var response = await repo.getItemsSearch(search: search.trim());
    _requestStatu = handlingRespose(response);
    if (_requestStatu == RequestStatus.success) {
      if (response["status"] == "success") {
        for (var element in response["data"]) {
          _itemsScreenList.add(ItemsModel.fromJson(element));
          update();
          log("$_itemsScreenList");
        }
      } else {
        _requestStatu = RequestStatus.noData;
        log('  getItemssearch =>>RequestStatus.noData');
        update();
      }
      update();
    } else if (_requestStatu == RequestStatus.serverFailure ||
        _requestStatu == RequestStatus.serverException) {
      snackBarMessage(title: "warning", msg: "Please try again");
      update();
    } else if (_requestStatu == RequestStatus.offLineFailure) {
      _requestStatu == RequestStatus.offLineFailure;
    } else {}
  }

  ItemsModel? getItemsByNameBinary(String name) {
    // Use binary search to find a category by its name
    // itemsScreenList.sort();
    var left = 0;
    var right = itemsScreenList.length - 1;
    while (left <= right) {
      var mid = (left + right) ~/ 2;
      if (itemsScreenList[mid].name == name) {
        log('itemsScreenList[mid]');
        return itemsScreenList[mid];
      } else if (itemsScreenList[mid].name!.compareTo(name) < 0) {
        log('left');
        left = mid + 1;
      } else {
        log('right');
        right = mid - 1;
      }
    }
    return null;
  }

  List<ItemsModel> resultListItems = [];
  List<ItemsModel> getCategoriesByNameBinary(String name) {
    int low = 0;
    int high = itemsScreenList.length - 1;

    while (low <= high) {
      int mid = (low + high) ~/ 2;
      int cmp = itemsScreenList[mid].name!.compareTo(name);

      if (cmp == 0) {
        log('cmp == 0  $resultListItems');
        resultListItems.add(itemsScreenList[mid]);
        // Search for other matching categories to the left of mid.
        for (int i = mid - 1; i >= 0 && itemsScreenList[i].name == name; i--) {
          resultListItems.add(itemsScreenList[i]);
          log('left  $resultListItems');
        }
        // Search for other matching categories to the right of mid.
        for (int i = mid + 1;
            i < itemsScreenList.length && itemsScreenList[i].name == name ||
                itemsScreenList[i].nameAr == name;
            i++) {
          log('right  $resultListItems');
          resultListItems.add(itemsScreenList[i]);
        }
        log('cmp   $resultListItems');
        return resultListItems;
      } else if (cmp < 0) {
        low = mid + 1;
      } else {
        high = mid - 1;
      }
    }

    return resultListItems;
  }

  ItemsModel? _itemsModePro;
  ItemsModel? get itemsModePro => _itemsModePro;
  @override
  void goToProductDetaile(itemsModel) {
    _itemsModePro = itemsModel;
    cartContro.getCountItem(_itemsModePro!.id!);
    Get.toNamed(RouteHelper.getProductDetaile());
    update();
  }

  List<String> productDis = ["Description", "Color", "Materials", "Reviews"];

  int? selectedIndex = 0;
  changeSelectedIndex(int index) {
    selectedIndex = index;
    update();
  }

  double ratingVal = 3.4;
  void onRatingUpdat(value) {
    debugPrint("$value");
    ratingVal = value;
    update();
  }

  bool favorite = false;
  void onfavoriteUpdat() {
    debugPrint("$favorite");
    favorite = !favorite;
    update();
  }

  bool pain = false;
  IconData painIcon = CupertinoIcons.cart_badge_plus;
  void onAddPinUpdat() {
    debugPrint("$pain");
    pain = !pain;
    painIcon =
        !pain ? CupertinoIcons.cart_badge_plus : CupertinoIcons.cart_fill;
    update();
  }

  /* double originalPrice = 100.0;
  double discountPercentage = 10.0;  var discountAmount = 0;
  var discountedPrice = 0;

  calculateDiscount(var price, int dicount) {
    discountAmount = (price * dicount) / 100;
    discountedPrice = price - discountAmount;
    return discountedPrice;
  }

   */

/*   ItemsModel? _itemsMode = Get.arguments["items_model"];
  ItemsModel? get itemsMode => _itemsMode;
   void goToProductDetaile(itemsModel) {
    _itemsMode = itemsModel;
    Get.toNamed(
      RouteHelper.getProductDetailePage(),
      // arguments: {"items_model ": itemsModel},
    );
    /* Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProductDetailePage(id: _items[_index].id))); */
  } */
/* 
  final Map<String, CategoriesModel> _categoryMap =
      Get.arguments["categoryMap"];
  Map<String, CategoriesModel> get categoryMap => _categoryMap;
  CategoriesModel? getCategoryByNameHashTable(String searchName) {
    // Use hash table search to find a category by name
    return categoryMap[searchName];
  }

  final Map<int, ItemsModel> _itemsMapInt = Get.arguments["itemsMapInt"];
  Map<int, ItemsModel> get itemsMapInt => _itemsMapInt;
  final Map<String, ItemsModel> _itemsMap = Get.arguments["itemsMap"];
  Map<String, ItemsModel> get itemsMap => _itemsMap;
  ItemsModel? getItemsByNameHashTable(String searchName) {
    // Use hash table search to find a category by name
    return itemsMap[searchName];
  }

  ItemsModel? getItemsPriceByNameHashTable(int searchPrice) {
    // Use hash table search to find a category by name
    return itemsMapInt[searchPrice];
  }

  CategoriesModel? getCategoryByIdLinear(int id) {
    // Use linear search to find a category by its ID
    return categories.firstWhere(
      (category) => int.parse(category.id!) == id,
      // orElse: () => null,
    );
  }

  CategoriesModel? getCategoryByNameLinear(String name) {
    // Use linear search to find a category by its name
    return categories.firstWhere(
      (category) => category.name == name,
      // orElse: () => null,
    );
  }

  CategoriesModel? getCategoryByIdBinary(int id) {
    // Use binary search to find a category by its ID
    var left = 0;
    var right = categories.length - 1;
    while (left <= right) {
      var mid = (left + right) ~/ 2;
      if (int.parse(categories[mid].id!) == id) {
        return categories[mid];
      } else if (int.parse(categories[mid].id!) < id) {
        left = mid + 1;
      } else {
        right = mid - 1;
      }
    }
    return null;
  }

  CategoriesModel? getCategoryByNameBinary(String name) {
    // Use binary search to find a category by its name
    var left = 0;
    var right = categories.length - 1;
    while (left <= right) {
      var mid = (left + right) ~/ 2;
      if (categories[mid].name == name) {
        return categories[mid];
      } else if (categories[mid].name!.compareTo(name) < 0) {
        left = mid + 1;
      } else {
        right = mid - 1;
      }
    }
    return null;
  }
 */
}
