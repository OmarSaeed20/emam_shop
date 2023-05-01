import 'package:flutter/cupertino.dart';

import '/index.dart';

abstract class SignUpController extends GetxController {
  void isCheckFeilds(bool val);
  void onChangedSignUp();
  void hiddenPassword();

  void signWithGoogle();
  void signWithFacebook();
  void signWithApple();

  void onTappedSignUp();
}

class SignUpControllerImp extends SignUpController {
  SignUpControllerImp get to => Get.find();

  // loading
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isUserLoading = false;
  bool get isUserLoading => _isUserLoading;

  // registration
  final TextEditingController _name = TextEditingController();
  TextEditingController get name => _name;
  final TextEditingController _email = TextEditingController();
  TextEditingController get email => _email;
  final TextEditingController _password = TextEditingController();
  TextEditingController get password => _password;
  final TextEditingController _phone = TextEditingController();
  TextEditingController get phone => _phone;

  // check all feilds valid or not valid
  bool _isEmptyFeild = true;
  bool get isEmptyFeild => _isEmptyFeild;

  // check all feilds valid or not valid

  @override
  void isCheckFeilds(bool val) {
    _isEmptyFeild = val;
    update();
  }


  // hide password
  bool _isPassword = true;
  bool get isPassword => _isPassword;
  IconData suffixIcon = CupertinoIcons.eye;

  @override
  void hiddenPassword() {
    _isPassword = !_isPassword;
    suffixIcon = _isPassword ? CupertinoIcons.eye : CupertinoIcons.eye_slash;
    update();
  }

  @override
  void onChangedSignUp() {
    GetUtils.isUsername(name.text) == false &&
            GetUtils.isLengthGreaterThan(password.text, 8) &&
            GetUtils.isEmail(email.text) &&
            GetUtils.isLengthEqualTo(phone.text, 11)
        ? isCheckFeilds(false)
        : isCheckFeilds(true);
  }

  @override
  void onTappedSignUp() {
    _isLoading = true;
    update();
  }

  @override
  void signWithFacebook() {}

  @override
  void signWithGoogle() {}

  @override
  void signWithApple() {}

  @override
  void dispose() {
    // clear controllers when close auth controller
    _name.clear();
    _email.clear();
    _password.clear();
    _phone.clear();
    super.dispose();
  }
}
