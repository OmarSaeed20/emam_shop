/* 
import '/index.dart';

abstract class ItemsController extends GetxController {
  void intialData();
  // Future<dynamic> getItemsData(String id);
  // void goToProductDetaile(ItemsModel itemsModel);
  /* void updateOrientation(Orientation newOrientation); */
}

class ItemsControllerImp extends ItemsController {
  static ItemsControllerImp get to => Get.find();

  ItemsRepo itemsRepo = Get.find();
  String? lang;

  RequestStatus _requestStatus = RequestStatus.none;
  RequestStatus get requestStatus => _requestStatus;

  final CategoriesModel? categoriesModel = Get.arguments["categoriesModel"];
  final List<CategoriesModel>? _categories = Get.arguments["categories"];
  List<CategoriesModel>? get categories => _categories;
  List<ItemsModel>? _items = Get.arguments["items"];
  List<ItemsModel>? get items => _items;

  String? _categoryId;
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
    lang = DatabaseHelper.to.getString(EndPoint.lang);
    _categoryId = Get.arguments["categoriesId"];
    // getItemsData(_categoryId!);
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
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

/*   @override
  Future<dynamic> getItemsData(id) async {
    _requestStatus = RequestStatus.loading;
    _items = [];
    update();
    var response = await itemsRepo.getItems(id: id);
    _requestStatus = handlingRespose(response);
    if (_requestStatus == RequestStatus.success) {
      if (response["status"] == "success") {
        for (var element in response["data"]) {
          _items!.add(ItemsModel.fromJson(element));
          update();
          // log("$_items");
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
  } */

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
 */