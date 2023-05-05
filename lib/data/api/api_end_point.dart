class ApiLinks {
  static const String baseUri = "http://192.168.1.7:80/emam";

  static const String test = "$baseUri/test.php";

  ///////////////// Auth \\\\\\\\\\\\\\\

  static const String signUp = "$baseUri/auth/sign_up.php";
  static const String verfiySignUp = "$baseUri/auth/verfiy_code.php";
}
