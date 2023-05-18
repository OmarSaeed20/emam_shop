class ApiLinks {
  static const String baseUri = "http://192.168.111.229:80/emam";
  // static const String baseUri = "http://192.168.1.7:80/emam";


  static const String test = "$baseUri/test.php";

  ///////////////// Image \\\\\\\\\\\\\\\
  static const String image = "$baseUri/test.php";

  ///////////////// Auth \\\\\\\\\\\\\\\
  static const String resendCode = "$baseUri/auth/resend_code.php";

  static const String signUp = "$baseUri/auth/sign_up.php";
  static const String verfiySignUp = "$baseUri/auth/verfiy_code.php";

  static const String signin = "$baseUri/auth/sign_in.php";
  
  static const String foSetEmail = "$baseUri/auth/forget_password/set_email.php";
  static const String foSetOtp = "$baseUri/auth/forget_password/verfiy_code.php";
  static const String foSetNewPass = "$baseUri/auth/forget_password/set_new_password.php";
  
  
  static const String view = "$baseUri/categories/view.php";
  static const String home = "$baseUri/home.php";
  static const String items = "$baseUri/items/items.php";

  static const String favoView = "$baseUri/favorite/view.php";
  static const String addFavo = "$baseUri/favorite/add.php";
  static const String removeFavo = "$baseUri/favorite/remove.php";
  static const String deleteFavo = "$baseUri/favorite/deletefavoriteid.php";


}
