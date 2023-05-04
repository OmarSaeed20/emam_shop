import 'package:flutter/cupertino.dart';

import '/index.dart';

abstract class ForgetPasswordController extends GetxController {
  void isCheckFeilds(bool val);
  void onChangedForgetPass();
  void onChangedResetPass();

  void onTappedForgetPass(controller);
  void onTappedResetPass();
  void onTappedVerifyCode(val);
  void hiddenPassword();
  void hiddenPasswordRe();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  ForgetPasswordControllerImp get to => Get.find();

  @override
  void onInit() {
    _email = TextEditingController();
    super.onInit();
  }

  // loading
  final bool _isLoading = false;
  bool get isLoading => _isLoading;
  GlobalKey<FormState> forgetForm = GlobalKey<FormState>();
  GlobalKey<FormState> resetForm = GlobalKey<FormState>();
  GlobalKey<FormState> form = GlobalKey<FormState>();

  TextEditingController _email = TextEditingController();
  TextEditingController get email => _email;
  final TextEditingController _password = TextEditingController();
  TextEditingController get password => _password;
  final TextEditingController _rePassword = TextEditingController();
  TextEditingController get passwordRe => _rePassword;

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

  // hide password
  bool _isPasswordRe = true;
  bool get isPasswordRe => _isPasswordRe;
  IconData suffixIconRe = CupertinoIcons.eye;

  @override
  void hiddenPasswordRe() {
    _isPasswordRe = !_isPasswordRe;
    suffixIconRe =
        _isPasswordRe ? CupertinoIcons.eye : CupertinoIcons.eye_slash;
    update();
  }

  // check all feilds valid or not valid
  bool _isEmptyFeild = true;
  bool get isEmptyFeild => _isEmptyFeild;

  // check all feilds valid or not valid

  @override
  void isCheckFeilds(bool val) {
    _isEmptyFeild = val;
    update();
  }

  @override
  void onChangedForgetPass() {
    GetUtils.isEmail(email.text) ? isCheckFeilds(false) : isCheckFeilds(true);
  }

  @override
  void onChangedResetPass() {
    password.text == passwordRe.text
        ? isCheckFeilds(false)
        : isCheckFeilds(true);
  }

  @override
  void onTappedForgetPass(controller) {
    final String email = _email.text;
    Get.to(
      () => VerificationCodeScreen(controller: controller),
      arguments: email,
    );
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    passwordRe.dispose();
    super.dispose();
  }

  @override
  void onTappedVerifyCode(val) {
    // _isLoading = true;
    Get.offAndToNamed(RouteHelper.getResetPassword());
    update();
  }

  @override
  void onTappedResetPass() {
    // snackBarMessage("Chick your Internet");
    snackBarSuccess();
  }
}
