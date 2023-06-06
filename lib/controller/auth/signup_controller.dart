import 'dart:async'; 

import 'package:flutter/cupertino.dart';

import '/index.dart';

abstract class SignUpController extends GetxController {
  void isCheckFeilds(bool val);
  void onChangedSignUp();
  void onChangedVerfiy();
  void hiddenPassword();

  void signWithGoogle();
  void signWithFacebook();
  void signWithApple();

  Future<void> startCountdown();
  Future<void> onCountdownFinish(String email);
  Future<void> onTappedSignUp(controller);
  Future<void> onTappedVerifyCode(String email, otp);
}

class SignUpControllerImp extends SignUpController {
  static SignUpControllerImp get to => Get.find();

  final AuthRepo _authRepo = Get.find();

  RequestStatus _requestStatus = RequestStatus.none;
  RequestStatus get requestStatus => _requestStatus;

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
  @override
  void onChangedVerfiy() {
    val == null ? isCheckFeilds(false) : isCheckFeilds(true);
  }

  @override
  Future<void> onTappedSignUp(controller) async {
    _requestStatus = RequestStatus.loading;
    update();
    SignUpModel model = SignUpModel(
      userName: _name.text.trim(),
      userEmail: _email.text.trim(),
      userPassword: _password.text.trim(),
      userPhone: _phone.text.trim(),
    );

    var response = await _authRepo.signUp(body: model);
    _requestStatus = handlingRespose(response);

    if (requestStatus == RequestStatus.success) {
      if (response["status"] == "success") {
        startCountdown();
        Get.toNamed(RouteHelper.getVerifySignup(),
            arguments: {"email": email.text});
      } else {
        Get.back();
        snackBarMessage(
          title: "${response["status"]}",
          msg: "${response["message"]}",
        );
        _requestStatus = RequestStatus.noData;
      }
    } else if (_requestStatus == RequestStatus.offLineFailure ||
        _requestStatus == RequestStatus.serverFailure ||
        _requestStatus == RequestStatus.serverException) {
      snackBarMessage(title: "warning", msg: "Please try again");
      update();
    } else {}
    update();
  }

  @override
  void signWithFacebook() {}

  @override
  void signWithGoogle() {}

  @override
  void signWithApple() {}

  int _countdown = 0;
  int get countdown => _countdown;
  bool _isCountdownFinish = false;
  bool get isCountdownFinish => _isCountdownFinish;
  Timer? _timer;
  Timer? get timer => _timer;

  @override
  Future<void> startCountdown() async {
    _countdown = 59;
    _isCountdownFinish = false;
    update();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countdown > 0) {
        _countdown--;
        debugPrint("$_countdown");
        update();
      } else {
        _countdown = 00;
        _isCountdownFinish = true;
        _timer!.cancel();
        update();
      }
    });
    update();
  }

  @override
  Future<void> onCountdownFinish(String email) async {
    if (_isCountdownFinish == true) {
      _requestStatus = RequestStatus.loading;
      popLoading(msg: "Sending OTP");
      update();
      var response = await _authRepo.foSetEmail(email: email);
      _requestStatus = handlingRespose(response);
      if (_requestStatus == RequestStatus.success) {
        if (response["status"] == "success") {
          startCountdown();
          _requestStatus = RequestStatus.success;
          Get.back();
          snackBarSuccess(msg: response["message"]);
        } else {
          _requestStatus = RequestStatus.noData;
          Get.back();
          snackBarMessage(title: "Warning", msg: response["message"]);
        }
      }
      update();
    }
  }

  @override
  Future<void> onTappedVerifyCode(String email, otp) async {
    if (form.currentState!.validate()) {
      _requestStatus = RequestStatus.loading;
      popLoading();
      update();
      var response =
          await _authRepo.verifyOtp(email: email, otp: otp.toString());
      _requestStatus = handlingRespose(response);

      if (requestStatus == RequestStatus.success) {
        if (response["status"] == "success") {
          Get.back();

          Get.delete<SignUpControllerImp>();
          snackBarSuccess(msg: "Accunt Cereated Successfly");
          Get.offNamed(RouteHelper.getLogin());
        } else {
          Get.back();
          snackBarMessage(
            title: "Warning",
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
