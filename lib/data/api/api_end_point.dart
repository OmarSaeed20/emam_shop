class ApiLinks {
  static const String baseUri = "http://192.168.1.7:80/emam";

  static const String test = "$baseUri/test.php";

  ///////////////// Auth \\\\\\\\\\\\\\\

  static const String signUp = "$baseUri/auth/sign_up.php";
  static const String verfiySignUp = "$baseUri/auth/verfiy_code.php";

  static const String signin = "$baseUri/auth/sign_in.php";
  static const String foSetEmail = "$baseUri/auth/forget_password/set_email.php";
  static const String foSetOtp = "$baseUri/auth/forget_password/verfiy_code.php";
  static const String foSetNewPass = "$baseUri/auth/forget_password/set_new_password.php";
}
