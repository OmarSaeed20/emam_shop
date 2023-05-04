import 'package:flutter/cupertino.dart';

import '/index.dart';

abstract class SignUpController extends GetxController {
  void isCheckFeilds(bool val);
  void onChangedSignUp();
  void hiddenPassword();

  void signWithGoogle();
  void signWithFacebook();
  void signWithApple();

  void onTappedSignUp(controller);
  void onTappedVerifyCode(val);
}

class SignUpControllerImp extends SignUpController {
  SignUpControllerImp get to => Get.find();

  // loading
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isUserLoading = false;
  bool get isUserLoading => _isUserLoading;

  // registration

  GlobalKey<FormState> signupForm = GlobalKey<FormState>();
  GlobalKey<FormState> form = GlobalKey<FormState>();
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
    GetUtils.isUsername(name.text) &&
            name.text.length > 4 &&
            name.text.length < 14 &&
            GetUtils.isLengthGreaterThan(password.text, 7) &&
            password.text.length < 20 &&
            GetUtils.isEmail(email.text) &&
            GetUtils.isLengthEqualTo(phone.text, 11)
        ? isCheckFeilds(false)
        : isCheckFeilds(true);
  }

  @override
  void onTappedSignUp(controller) {
    _isLoading = true;
    String email = _email.text;
    Get.to(
      () => VerificationCodeScreen(controller: controller),
      arguments: email,
    );

    _isLoading = false;
    update();
  }

  @override
  void signWithFacebook() {}

  @override
  void signWithGoogle() {}

  @override
  void signWithApple() {}

  @override
  void onTappedVerifyCode(val) {
    snackBarSuccess();
    Get.delete<SignUpControllerImp>();
    Get.offNamed(RouteHelper.getLogin());
  }

  @override
  void dispose() {
    // clear controllers when close auth controller
    /* _name.dispose();
    _email.dispose();
    _password.dispose();
    _phone.dispose();
     */
    super.dispose();
  }
}
