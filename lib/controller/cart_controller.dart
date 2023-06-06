 

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
  CouponControllerImp couponControl = Get.find<CouponControllerImp>();

  AddressControllerImp addressControl = Get.find();
  PaymentControllerImp paymentControl = Get.find();

  // AddressModel? selectedAddsModel = AddressControllerImp.to.selectedAdressmodel;
  final DatabaseHelper database = Get.find();
  String lang = DatabaseHelper.to.getString(EndPoint.lang);
  String userId = DatabaseHelper.to.getString(EndPoint.userId);
  String usernaem = DatabaseHelper.to.getString(EndPoint.userName);
  String userEmail = DatabaseHelper.to.getString(EndPoint.userEmail);
  String userPhone = DatabaseHelper.to.getString(EndPoint.userPhone);

  /* LabeledGlobalKey<ScaffoldState> cartKey = LabeledGlobalKey("cart_key");
  LabeledGlobalKey<ScaffoldState> securePaymentKey =
      LabeledGlobalKey("secure_payment_key");
  LabeledGlobalKey<ScaffoldState> creditKey = LabeledGlobalKey("credit_key"); */

  @override
  void onInit() {
    selectedIndexEnum = CheckOutEnum.check1;

    super.onInit();
  }

  RequestStatus _requestStatus = RequestStatus.none;
  RequestStatus get requestStatus => _requestStatus;

  @override
  Future<void> onTapAddCart(itemsId) async {
    _requestStatus = RequestStatus.loading;
    update();
    final response = await cartRepo.addCart(itemsId: itemsId, usersId: userId);
    _requestStatus = handlingRespose(response);
    if (_requestStatus == RequestStatus.success) {
      if (response['status'] == 'success') {
        debugPrint(' (success) ---> ${response["message"]}');
        getCountItem(itemsId);
      } else {
        _requestStatus = RequestStatus.noData;
        debugPrint(' (success) ---> ${response["message"]}');
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
        debugPrint(' (failure) ---> ${response["message"]}');
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
      debugPrint('error in get my cart ----> $error');
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
    debugPrint(">>>>$count");
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

  goToCouponScreen() {
    couponControl.initData();

    Get.toNamed(RouteHelper.getCoupon());
  }

  goToCheckoutScreen() {
    {
      if (listCart.isEmpty != true) {
        Get.toNamed(RouteHelper.getCheckout());
      } else {
        snackBarMessage(msg: "No items in cart", title: "waring");
      }
    }
  }

  bool selectCredit = false;

  changePaymentVal(value) {
    debugPrint(value.toString());
    selectCredit = value;
    update();
  }

  bool selectDilvery = false;

  changeDilveryVal(value) {
    debugPrint(value.toString());
    selectDilvery = value;
    update();
  }

  String? ordersPrice;
  String? totalPrice;
  String? deliveryPrice;
  String? totalOldPrice;
  Future<void> onTapCheckout() async {
    debugPrint(">>>>>>>>>>>>>>>>>>>>>>>> onTapCheckout");
    debugPrint(
        "${addressControl.selectedAdressmodel!.addressId ?? '0'}\\//${couponControl.couponModel!.couponId ?? '0'} \\//${couponControl.couponModel!.couponDiscount ?? '0'}\\//${deliveryPrice ?? '0'}");

    _requestStatus = RequestStatus.loading;
    update();
    var model = {
      "users_id": userId,
      "address_id":
          selectDilvery ? addressControl.selectedAdressmodel!.addressId : "",
      "coupon_id": couponControl.couponModel != null
          ? couponControl.couponModel!.couponId
          : "0",
      "coupon_dicount": couponControl.couponModel != null
          ? couponControl.couponModel!.couponDiscount
          : '0',
      "delivery_price": deliveryPrice ?? "0",
      "orders_price": ordersPrice ?? "0",
      "orders_type": selectDilvery ? "0" : "1",
      "payment_method": selectCredit ? "0" : "1",
    };
    debugPrint(model.toString());
    final response = await cartRepo.checkout(map: model);
    _requestStatus = handlingRespose(response);
    debugPrint(_requestStatus.toString());
    if (_requestStatus == RequestStatus.success) {
      if (response['status'] == 'success') {
        debugPrint('check (success) ---> ${response["message"]}');
        snackBarSuccess();
        Get.toNamed(RouteHelper.getMain());
        getOrders();
      } else {
        _requestStatus = RequestStatus.noData;
        debugPrint(' (success) ---> ${response["message"]}');
      }
    }
    update();
  }

  List<CheckoutModel> listOrders = [];
  Future<void> getOrders() async {
    try {
      _requestStatus = RequestStatus.loading;
      update();
      final response = await cartRepo.getOrdersView(userId: userId);
      _requestStatus = handlingRespose(response);
      if (_requestStatus == RequestStatus.success) {
        if (response['status'] == 'success') {
          listOrders.clear();
          List result = response["data"];
          listOrders.addAll(result.map((e) => CheckoutModel.fromJson(e)));

          update();
        } else {
          _requestStatus = RequestStatus.noData;
          update();
        }
      }
      update();
    } catch (error) {
      debugPrint('error in get my cart ----> $error');
    }
  }
}

enum CheckOutEnum { check1, check2 }
