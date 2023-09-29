import 'package:ecommerce/data/response/cart/cart_response.dart';

import '../data/network/request/checkout_request.dart';
import '../index.dart';

abstract class CartController extends GetxController {
  Future<void> onTapAddCart(String itemsId);

  Future<void> onTapRemoveCart(String itemsId);
  // rmoveCart(String itemsId);
  Future<void> getCart();

  Future<void> getCountItem(String itemsId);
  void increse(
      {required int count, required bool add, required String itemsId});

  deleteItem(String itemsId);
  changeSelectedIndex();

  goToCouponScreen();
  goToCheckoutScreen();

  changePaymentVal(value);
  changeDilveryVal(value);
  Future<void> onTapCheckout();
}

class CartControllerImp extends CartController {
  static CartControllerImp get to => Get.find();
  final RepositoryImp _repo = Get.find<RepositoryImp>();
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
    getCart();
    super.onInit();
  }

  RequestStatus _requestStatus = RequestStatus.none;
  RequestStatus get requestStatus => _requestStatus;

  @override
  Future<void> onTapAddCart(itemsId) async {
    _requestStatus = RequestStatus.loading;
    update();
    final response = await _repo.addCart(itemsId: itemsId, usersId: userId);
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
    final response = await _repo.removeCart(itemsId: itemsId, usersId: userId);
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

  final List<CartResponse> _listCart = [];
  List<CartResponse> get listCart => _listCart;
  CountPriceModel? _countprice;
  CountPriceModel? get countpriceModel => _countprice;
  bool isEmpty = true;
  @override
  Future<void> getCart() async {
    try {
      _requestStatus = RequestStatus.loading;
      update();
      final response = await _repo.getCartView(userId: userId);
      _requestStatus = handlingRespose(response);
      if (_requestStatus == RequestStatus.success) {
        if (response['status'] == 'success') {
          isEmpty = response["datacart"]["status"] == 'failure' ? true : false;
          if (response["datacart"]["status"] == 'success') {
            _listCart.clear();
            List result = response["datacart"]["data"];
            _listCart.addAll(result.map((e) => CartResponse.fromJson(e)));

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

  @override
  Future<void> getCountItem(String itemsId) async {
    _requestStatus = RequestStatus.loading;
    update();
    var response = await _repo.getCountItems(userId: userId, itemsId: itemsId);
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

  @override
  void increse({
    required int count,
    required bool add,
    required String itemsId,
  }) async {
    if (add == true) {
      await onTapAddCart(itemsId).then((value) {
        count++;
        if (Get.currentRoute == RouteHelper.getCart()) {
          getCart();
        }
        update();
      });
    } else {
      if (count > 0) {
        await onTapRemoveCart(itemsId).then((value) {
          count--;
          if (Get.currentRoute == RouteHelper.getCart()) {
            getCart();
          }
          update();
        });
      }
    }
    debugPrint(">>>>$count");
    update();
  }

  @override
  deleteItem(String itemsId) {
    // cartRepo.removeCart(usersId: userId, itemsId: itemsId);
    listCart.removeWhere((element) => element.cartItemsid == itemsId);
    update();
  }

  CheckOutEnum? selectedIndexEnum;
  @override
  changeSelectedIndex() {
    if (selectedIndexEnum == CheckOutEnum.check1) {
      selectedIndexEnum = CheckOutEnum.check2;
      update();
    } else {
      selectedIndexEnum = CheckOutEnum.check1;
      update();
    }
  }

  @override
  goToCouponScreen() {
    couponControl.initData();

    Get.offNamed(RouteHelper.getCoupon());
  }

  @override
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

  @override
  changePaymentVal(value) {
    debugPrint(value.toString());
    selectCredit = value;
    update();
  }

  bool selectDilvery = false;

  @override
  changeDilveryVal(value) {
    debugPrint(value.toString());
    selectDilvery = value;
    update();
  }

  String? ordersPrice;
  String? totalPrice;
  String? deliveryPrice;
  String? totalOldPrice;
  @override
  Future<void> onTapCheckout() async {
    debugPrint(">>>>>>>>>>>>>>>>>>>>>>>> onTapCheckout");
    debugPrint(
        "${addressControl.selectedAdressmodel ?? '0'}\\//${couponControl.couponModel ?? '0'} \\ \\//${deliveryPrice ?? '0'}");

    _requestStatus = RequestStatus.loading;
    update();
    CheckoutResquest model = CheckoutResquest(
      usersId: userId,
      addressId:
          selectDilvery ? addressControl.selectedAdressmodel!.addressId! : "0",
      couponId: couponControl.couponModel != null
          ? couponControl.couponModel!.couponId!
          : "0",
      couponDicount: couponControl.couponModel != null
          ? couponControl.couponModel!.couponDiscount!
          : '0',
      deliveryPrice: deliveryPrice ?? "0",
      ordersPrice: ordersPrice ?? "0",
      ordersType: selectDilvery ? "0" : "1",
      paymentMethod: selectCredit ? "0" : "1",
    );
    debugPrint(model.toString());
    final response = await _repo.checkout(map: model.toJson());
    _requestStatus = handlingRespose(response);
    if (_requestStatus == RequestStatus.success) {
      if (response['status'] == 'success') {
        debugPrint('check (success) ---> ${response["message"]}');
        snackBarSuccess();
        Get.toNamed(RouteHelper.getMain());
      } else {
        _requestStatus = RequestStatus.noData;
        debugPrint(' (success) ---> ${response["message"]}');
      }
    }
    update();
  }
}

enum CheckOutEnum { check1, check2 }
