import 'package:flutter/cupertino.dart';

import '/index.dart';

abstract class SignInController extends GetxController {
  void isCheckFeilds(bool val);
  void hiddenPassword();
  void onChangedSignIn();
  void onTappedSignIn();
  void onTappedVerifyCode(val);

}

class SignInControllerImp extends SignInController {
  SignInControllerImp get to => Get.find();

  // loading
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  // check all feilds valid or not valid
  bool _isEmptyFeild = true;
  bool get isEmptyFeild => _isEmptyFeild;

  // hide password
  bool _isPassword = true;
  bool get isPassword => _isPassword;

  // check all feilds valid or not valid

  @override
  void isCheckFeilds(bool val) {
    _isEmptyFeild = val;
    update();
  }

  IconData suffixIcon = CupertinoIcons.eye;
  @override
  void hiddenPassword() {
    _isPassword = !_isPassword;
    suffixIcon = _isPassword ? CupertinoIcons.eye : CupertinoIcons.eye_slash;
    update();
  }

  final TextEditingController _email = TextEditingController();
  TextEditingController get email => _email;

  final TextEditingController _password = TextEditingController();
  TextEditingController get password => _password;

  @override
  void onChangedSignIn() {
    GetUtils.isEmail(email.text) &&
            GetUtils.isLengthGreaterThan(password.text, 7)
        ? isCheckFeilds(false)
        : isCheckFeilds(true);
  }

  @override
  void onTappedSignIn() {
    _isLoading = true;
    update();
  }

  
  @override
  void onTappedVerifyCode(val) {}
  
  @override
  void dispose() {
    _email.clear();
    _password.clear();
    super.dispose();
  }
}
