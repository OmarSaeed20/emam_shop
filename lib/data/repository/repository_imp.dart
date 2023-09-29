import 'package:ecommerce/index.dart';

import '../../domain/repository/repository.dart';

class RepositoryImp implements Repository {
  static RepositoryImp get to => Get.find();
  ApiClient api;
  RepositoryImp(this.api);

  @override
  Future<dynamic> signUp({required SignUpRequest body}) async {
    var requset = await api.postData(ApiLinks.signUp, body.toJson());
    return requset.fold((l) => l, (r) => r);
  }

  @override
  verifyOtp({required email, required otp}) async {
    var requset = await api
        .postData(ApiLinks.verfiySignUp, {"email": email, "verfiyCode": otp});
    return requset.fold((l) => l, (r) => r);
  }

  @override
  resendCode({required email}) async {
    var requset = await api.postData(ApiLinks.resendCode, {"email": email});
    return requset.fold((l) => l, (r) => r);
  }

  @override
  signin({required SignInRequest body}) async {
    var requset = await api.postData(ApiLinks.signin, body.toJson());
    return requset.fold((l) => l, (r) => r);
  }

  @override
  foSetEmail({required email}) async {
    var requset = await api.postData(ApiLinks.foSetEmail, {"email": email});
    return requset.fold((l) => l, (r) => r);
  }

  @override
  foSetOtp({required email, required otp}) async {
    var requset = await api
        .postData(ApiLinks.foSetOtp, {"email": email, "verfiyCode": otp});
    return requset.fold((l) => l, (r) => r);
  }

  @override
  foSetNewPass({required SignInRequest body}) async {
    var requset = await api.postData(ApiLinks.foSetNewPass, body.toJson());
    return requset.fold((l) => l, (r) => r);
  }

  @override
  getAddressView({required userId}) async {
    var requset = await api.postData(ApiLinks.addressView, {"usersid": userId});
    return requset.fold((l) => l, (r) => r);
  }

  @override
  addAddress({required body}) async {
    var requset = await api.postData(ApiLinks.addressAdd, body);
    return requset.fold((l) => l, (r) => r);
  }

  @override
  editAddress({required body}) async {
    var requset = await api.postData(ApiLinks.addressEdit, body);
    return requset.fold((l) => l, (r) => r);
  }

  @override
  deleteAddress({required addressId}) async {
    var requset =
        await api.postData(ApiLinks.addressRemove, {"addressid": addressId});
    return requset.fold((l) => l, (r) => r);
  }

  //////    user
  @override
  getUserData({required userid}) async {
    var requset = await api.postData(ApiLinks.userData, {"user_id": userid});
    return requset.fold((l) => l, (r) => r);
  }

  /// offerr
  @override
  getOffers(userId) async {
    var requset = await api.postData(ApiLinks.offer, {"user_id": userId});
    return requset.fold((l) => l, (r) => r);
  }

  /// orderrs

  @override
  getOrderPending(userId) async {
    var requset =
        await api.postData(ApiLinks.ordersPending, {"user_id": userId});
    return requset.fold((l) => l, (r) => r);
  }

  @override
  getOrderDetails(orderId) async {
    var requset =
        await api.postData(ApiLinks.ordersdetails, {"orders_id": orderId});
    return requset.fold((l) => l, (r) => r);
  }

  @override
  removeOrder(orderId) async {
    var requset =
        await api.postData(ApiLinks.ordersdelete, {"orders_id": orderId});
    return requset.fold((l) => l, (r) => r);
  }

  @override
  getArchiveOrders(userId) async {
    var requset =
        await api.postData(ApiLinks.ordersarchive, {"user_id": userId});
    return requset.fold((l) => l, (r) => r);
  }

  /// items

  @override
  getItems({required categoryid, required usersid}) async {
    var requset = await api.postData(
        ApiLinks.items, {"category_id": categoryid, "user_id": usersid});
    return requset.fold((l) => l, (r) => r);
  }

  @override
  getProductData({required itemsId, required userId}) async {
    var requset = await api.postData(
        ApiLinks.itemsProduct, {"items_id": itemsId, "user_id": userId});
    return requset.fold((l) => l, (r) => r);
  }

  @override
  getItemsSearch({required search}) async {
    var requset = await api.postData(ApiLinks.itemsSearch, {"search": search});
    return requset.fold((l) => l, (r) => r);
  }

  // favorite
  @override
  getFavo({required userId}) async {
    var requset = await api.postData(ApiLinks.favoView, {"user_id": userId});
    return requset.fold((l) => l, (r) => r);
  }

  @override
  addFavo({required usersId, required itemsId}) async {
    var requset = await api
        .postData(ApiLinks.addFavo, {"usersid": usersId, "itemsid": itemsId});
    return requset.fold((l) => l, (r) => r);
  }

  @override
  removeFavo({required usersId, required itemsId}) async {
    var requset = await api.postData(
        ApiLinks.removeFavo, {"usersid": usersId, "itemsid": itemsId});
    return requset.fold((l) => l, (r) => r);
  }

  @override
  deleteFromFavo({required favId}) async {
    var requset =
        await api.postData(ApiLinks.deleteFavo, {"favorite_id": favId});
    return requset.fold((l) => l, (r) => r);
  }

  //// cart

  @override
  getCartView({required userId}) async {
    var requset = await api.postData(ApiLinks.cartview, {"usersid": userId});
    return requset.fold((l) => l, (r) => r);
  }

  @override
  getCountItems({required userId, required itemsId}) async {
    var requset = await api.postData(
      ApiLinks.carCountItems,
      {"usersid": userId, "itemsid": itemsId},
    );
    return requset.fold((l) => l, (r) => r);
  }

  @override
  addCart({required usersId, required itemsId}) async {
    var requset = await api
        .postData(ApiLinks.cartAdd, {"usersid": usersId, "itemsid": itemsId});
    return requset.fold((l) => l, (r) => r);
  }

  @override
  removeCart({required usersId, required itemsId}) async {
    var requset = await api.postData(
        ApiLinks.cartDelete, {"usersid": usersId, "itemsid": itemsId});
    return requset.fold((l) => l, (r) => r);
  }

  @override
  checkout({required Map map}) async {
    var requset = await api.postData(ApiLinks.checkout, map);
    return requset.fold((l) => l, (r) => r);
  }

  ///
  @override
  getCategoriesView() async {
    var requset = await api.getData(ApiLinks.categoriesView);
    return requset.fold((l) => l, (r) => r);
  }

  @override
  getHome() async {
    var requset = await api.getData(ApiLinks.home);
    return requset.fold((l) => l, (r) => r);
  }

  @override
  getCategoriesSearch({required search}) async {
    var requset =
        await api.postData(ApiLinks.categoriesSearch, {"search": search});
    return requset.fold((l) => l, (r) => r);
  }

  ///  Coupons

  @override
  getCoupons() async {
    var requset = await api.getData(ApiLinks.couponView);
    return requset.fold((l) => l, (r) => r);
  }

  @override
  getCouponName(couponName) async {
    var requset =
        await api.postData(ApiLinks.couponName, {"coupon_name": couponName});
    return requset.fold((l) => l, (r) => r);
  }

  /// Notification
  @override
  getNotification({required usersid}) async {
    var requset =
        await api.postData(ApiLinks.notification, {"user_id": usersid});
    return requset.fold((l) => l, (r) => r);
  }
}
