import 'dart:developer';

import 'package:flutter/cupertino.dart';

import '/index.dart';

abstract class SignUpController extends GetxController {
  void isCheckFeilds(bool val);
  void onChangedSignUp();
  void hiddenPassword();

  void signWithGoogle();
  void signWithFacebook();
  void signWithApple();

  Future<void> onTappedSignUp(controller);
  Future<void> onTappedVerifyCode(otp);
}

class SignUpControllerImp extends SignUpController {
  SignUpControllerImp get to => Get.find();

  final AuthRepo _authRepo = Get.find();

  RequestStatus? _requestStatus;
  RequestStatus? get requestStatus => _requestStatus;

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

  String? val;
  void onChangedVerfiy() {
    val == null ? isCheckFeilds(false) : isCheckFeilds(true);
  }

  @override
  Future<void> onTappedSignUp(controller) async {
    _requestStatus = RequestStatus.loading;
    popLoading(msg: "Sending OTP");
    update();
    SignUpModel model = SignUpModel();
    model
      ..userName = _name.text.trim()
      ..userEmail = _email.text.trim()
      ..userPassword = _password.text.trim()
      ..userPhone = _phone.text.trim();
    var response = await _authRepo.signUp(body: model);
    _requestStatus = handlingRespose(response);

    if (requestStatus == RequestStatus.success) {
      if (response["status"] == "success") {
        Get.back();
        String email = _email.text;
        Get.toNamed(RouteHelper.getVerifySignup(), arguments: email);
      } else {
        Get.back();
        snackBarMessage(
          title: "${response["status"]}",
          msg: "${response["message"]}",
        );
        _requestStatus = RequestStatus.noData;
      }
    }
    update();
  }

/* 
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

 */
  @override
  void signWithFacebook() {}

  @override
  void signWithGoogle() {}

  @override
  void signWithApple() {}

  @override
  Future<void> onTappedVerifyCode(otp) async {
    if (form.currentState!.validate()) {
      _requestStatus = RequestStatus.loading;
      popLoading();
      update();
      var response = await _authRepo.verifyOtp(email: email.text, otp: otp.toString());
      _requestStatus = handlingRespose(response);

      if (requestStatus == RequestStatus.success) {
        if (response["status"] == "success") {
          Get.back();

          Get.delete<SignUpControllerImp>();
          snackBarSuccess();
          Get.offNamed(RouteHelper.getLogin());
        } else {
          Get.back();
          snackBarMessage(
            title: "${response["status"]}",
            msg: "${response["message"]}",
          );
          _requestStatus = RequestStatus.noData;
        }
      }
      update();
    }
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

class ResponseModel {
  final bool isSuccess;
  final String message;

  ResponseModel(this.isSuccess, this.message);
}
