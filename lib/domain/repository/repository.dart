import '../../index.dart';

abstract class Repository {
  ///  auth
  Future<dynamic> signUp({required SignUpRequest body});
  Future<dynamic> verifyOtp({required String email, required String otp});
  Future<dynamic> resendCode({required String email});
  Future<dynamic> signin({required SignInRequest body});
  Future<dynamic> foSetEmail({required String email});
  Future<dynamic> foSetOtp({required String email, required String otp});
  Future<dynamic> foSetNewPass({required SignInRequest body});
  
  // address
  Future<dynamic> getAddressView({required String userId});
  Future<dynamic> addAddress({required Map body});
  Future<dynamic> editAddress({required Map body});
  Future<dynamic> deleteAddress({required String addressId});

  /// user
  Future<dynamic> getUserData({required String userid});

  /// offerr
  Future<dynamic> getOffers(String userId);

  ///  orders
  Future<dynamic> getOrderPending(String userId);
  Future<dynamic> getOrderDetails(String orderId);
  Future<dynamic> removeOrder(String orderId);
  Future<dynamic> getArchiveOrders(String userId);

  /// items
  Future<dynamic> getItems(
      {required String categoryid, required String usersid});
  Future<dynamic> getProductData(
      {required String itemsId, required String userId});

  Future<dynamic> getItemsSearch({required String search});

  /// favorite
  Future<dynamic> getFavo({required String userId});
  Future<dynamic> addFavo({required String usersId, required String itemsId});
  Future<dynamic> removeFavo(
      {required String usersId, required String itemsId});
  Future<dynamic> deleteFromFavo({required String favId});

  //// cart
  Future<dynamic> getCartView({required String userId});
  Future<dynamic> getCountItems(
      {required String userId, required String itemsId});
  Future<dynamic> addCart({required String usersId, required String itemsId});
  Future<dynamic> removeCart(
      {required String usersId, required String itemsId});
  Future<dynamic> checkout({required Map map});

  /// home
  Future<dynamic> getCategoriesView();
  Future<dynamic> getHome();
  Future<dynamic> getCategoriesSearch({required String search});

  /// coupon
  Future<dynamic> getCoupons();
  Future<dynamic> getCouponName(String couponName);

  /// Notification
  Future<dynamic> getNotification({required String usersid});
}
