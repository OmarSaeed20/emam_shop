class ApiLinks {
  // static const String baseUri = "http://192.168.22.229:80/emam";
  static const String baseUri = "http://192.168.79.229:80/emam";
  static const String imagLink = "$baseUri/uplode/items/";
  // static const String baseUri = "http://192.168.1.7:80/emam";

  static const String test = "$baseUri/test.php";

  ///////////////// Image \\\\\\\\\\\\\\\
  static const String image = "$baseUri/test.php";

  ///////////////// Auth \\\\\\\\\\\\\\\
  static const String resendCode = "$baseUri/auth/resend_code.php";

  static const String userData = "$baseUri/user/getuserdata.php";
  static const String signUp = "$baseUri/auth/sign_up.php";
  static const String verfiySignUp = "$baseUri/auth/verfiy_code.php";

  static const String signin = "$baseUri/auth/sign_in.php";

  static const String foSetEmail =
      "$baseUri/auth/forget_password/set_email.php";
  static const String foSetOtp =
      "$baseUri/auth/forget_password/verfiy_code.php";
  static const String foSetNewPass =
      "$baseUri/auth/forget_password/set_new_password.php";

  static const String categoriesView = "$baseUri/categories/view.php";
  static const String categoriesSearch = "$baseUri/categories/search.php";
  static const String home = "$baseUri/home.php";
  static const String items = "$baseUri/items/items.php";
  static const String itemsProduct = "$baseUri/items/product.php";
  static const String itemsSearch = "$baseUri/items/search.php";

  static const String favoView = "$baseUri/favorite/view.php";
  static const String addFavo = "$baseUri/favorite/add.php";
  static const String removeFavo = "$baseUri/favorite/remove.php";
  static const String deleteFavo = "$baseUri/favorite/deletefavoriteid.php";

  ////// cart
  static const String cartview = "$baseUri/cart/view.php";
  static const String carCountItems = "$baseUri/cart/getcountitems.php";
  static const String cartAdd = "$baseUri/cart/add.php";
  static const String cartDelete = "$baseUri/cart/delete.php";

  static const String addressView = "$baseUri/address/view.php";
  static const String addressAdd = "$baseUri/address/add.php";
  static const String addressEdit = "$baseUri/address/edit.php";
  static const String addressRemove = "$baseUri/address/remove.php";

  ////// cart
  static const String couponName = "$baseUri/coupon/coupon.php";
  static const String couponView = "$baseUri/coupon/view.php";

  ////// order

  static const String checkout = "$baseUri/orders/checkout.php";
  static const String ordersPending = "$baseUri/orders/pending.php";
  static const String ordersdetails = "$baseUri/orders/details.php";
  static const String ordersdelete = "$baseUri/orders/delete.php";
  static const String ordersarchive = "$baseUri/orders/archive.php";

  ////// notification

  static const String notification = "$baseUri/notification/view.php";

  ////// offer

  static const String offer = "$baseUri/offer/view.php";
}