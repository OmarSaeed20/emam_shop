import 'dart:developer';

import '../index.dart';

abstract class CartController extends GetxController {
  Future<void> onTapAddCart(String itemsId);

  Future<void> onTapRemoveCart(String itemsId);
  // rmoveCart(String itemsId);
  Future<void> getCart();
}

class CartControllerImp extends CartController {
  static CartControllerImp get to => Get.find();
  CartRepo cartRepo = Get.find();

  final DatabaseHelper database = Get.find();
  String userId = DatabaseHelper.to.getString(EndPoint.userId);
  @override
  void onInit() {
    // getCart();
    selectedIndexEnum = CheckOutEnum.check1;
    super.onInit();
  }

  /*  final List<String> _cartList = [];
  List<String> get favoList => _cartList; */

  RequestStatus _requestStatus = RequestStatus.none;
  RequestStatus get requestStatus => _requestStatus;

  /* Map isFavor = {};
  void onTapSetFavorite(id, String val) {
    debugPrint(val);
    isFavor[id] = val;
    update();
  } */

  @override
  Future<void> onTapAddCart(itemsId) async {
    _requestStatus = RequestStatus.loading;
    update();
    final response = await cartRepo.addCart(itemsId: itemsId, usersId: userId);
    _requestStatus = handlingRespose(response);
    if (_requestStatus == RequestStatus.success) {
      if (response['status'] == 'success') {
        log(' (success) ---> ${response["message"]}');
        getCountItem(itemsId);
      } else {
        _requestStatus = RequestStatus.noData;
        log(' (success) ---> ${response["message"]}');
      }
    }
    update();
  }

  @override
  Future<void> onTapRemoveCart(itemsId) async {
    _requestStatus = RequestStatus.loading;
    update();
    final response =
        await cartRepo.removeCart(itemsId: itemsId, usersId: userId);
    _requestStatus = handlingRespose(response);
    if (_requestStatus == RequestStatus.success) {
      if (response['status'] == 'success') {
        getCountItem(itemsId);
      } else {
        _requestStatus = RequestStatus.noData;
        log(' (failure) ---> ${response["message"]}');
      }
    }
    update();
  }

  final List<CartModel> _listCart = [];
  List<CartModel> get listCart => _listCart;
  CountPriceModel? _countprice;
  CountPriceModel? get countpriceModel => _countprice;
  bool isEmpty = true;
  @override
  Future<void> getCart() async {
    try {
      _requestStatus = RequestStatus.loading;
      update();
      final response = await cartRepo.getCartView(userId: userId);
      _requestStatus = handlingRespose(response);
      if (_requestStatus == RequestStatus.success) {
        if (response['status'] == 'success') {
          isEmpty = response["datacart"]["status"] == 'failure' ? true : false;
          if (response["datacart"]["status"] == 'success') {
            _listCart.clear();
            List result = response["datacart"]["data"];
            _listCart.addAll(result.map((e) => CartModel.fromJson(e)));

            _countprice = CountPriceModel.fromJson(response["countprice"]);

            update();
          }
        } else {
          _requestStatus = RequestStatus.noData;
          update();
        }
      }
      update();
    } catch (error) {
      log('error in get my cart ----> $error');
    }
  }

  int _countItems = 0;
  int get countItems => _countItems;

  Future<void> getCountItem(String itemsId) async {
    _requestStatus = RequestStatus.loading;
    update();
    var response =
        await cartRepo.getCountItems(userId: userId, itemsId: itemsId);
    _requestStatus = handlingRespose(response);
    if (_requestStatus == RequestStatus.success) {
      if (response['status'] == 'success') {
        _countItems = int.parse(response['data']);
        update();
      } else {
        _requestStatus = RequestStatus.noData;
        update();
      }
      update();
    }
  }

  void increse({
    required int count,
    required bool add,
    required String itemsId,
    bool? isCartScrren = false,
  }) async {
    log(">>>>$count");
    if (add == true) {
      await onTapAddCart(itemsId).then((value) {
        count++;
        if (isCartScrren == true) {
          getCart();
        }
        update();
      });
    } else {
      if (count > 0) {
        await onTapRemoveCart(itemsId).then((value) {
          count--;
          if (isCartScrren == true) {
            getCart();
          }
          update();
        });
      }
    }
    update();
  }

  deleteItem(String itemsId) {
    // cartRepo.removeCart(usersId: userId, itemsId: itemsId);
    listCart.removeWhere((element) => element.cartItemsid == itemsId);
    update();
  }

  CheckOutEnum? selectedIndexEnum;
  changeSelectedIndex() {
    if (selectedIndexEnum == CheckOutEnum.check1) {
      selectedIndexEnum = CheckOutEnum.check2;
      update();
    } else {
      selectedIndexEnum = CheckOutEnum.check1;
      update();
    }
  }
}

enum CheckOutEnum { check1, check2 }
