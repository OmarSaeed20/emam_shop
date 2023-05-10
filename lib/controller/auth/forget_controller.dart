import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';

import '/index.dart';

abstract class ForgetPasswordController extends GetxController {
  void isCheckFeilds(bool val);
  void onChangedForgetPass();
  void onChangedVerfiy();
  void onChangedResetPass();

  Future<void> onTappedForgetPass();

  void onTappedVerifyCode(val);
  Future<void> startCountdown();
  Future<void> onCountdownFinish();

  void hiddenPassword();
  void hiddenPasswordRe();
  void onTappedResetPass();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  ForgetPasswordControllerImp get to => Get.find();

  @override
  void onInit() {
    _email = TextEditingController();
    super.onInit();
  }

  final AuthRepo _authRepo = Get.find();

  RequestStatus? _requestStatus;
  RequestStatus? get requestStatus => _requestStatus;
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

  String? val;
  @override
  void onChangedVerfiy() {
    val == null ? isCheckFeilds(false) : isCheckFeilds(true);
  }

  @override
  void onChangedResetPass() {
    password.text == passwordRe.text
        ? isCheckFeilds(false)
        : isCheckFeilds(true);
  }

  @override
  Future<void> onTappedForgetPass() async {
    if (forgetForm.currentState!.validate()) {
      _requestStatus = RequestStatus.loading;
      popLoading(msg: "Sending OTP");
      update();
      var response = await _authRepo.foSetEmail(email: _email.text);
      _requestStatus = handlingRespose(response);
      if (_requestStatus == RequestStatus.success) {
        if (response["status"] == "success") {
          startCountdown();
          _requestStatus = RequestStatus.success;
          Get.back();
          snackBarSuccess(
              icon: CupertinoIcons.info_circle, msg: response["message"]);
          final String email = _email.text;
          Get.toNamed(RouteHelper.getForgetVerfiyCode(), arguments: email);
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
  void onTappedVerifyCode(val) async {
    if (form.currentState!.validate()) {
      _requestStatus = RequestStatus.loading;
      popLoading(msg: "Sending OTP");
      update();
      var response = await _authRepo.foSetOtp(email: _email.text, otp: val);
      _requestStatus = handlingRespose(response);
      if (_requestStatus == RequestStatus.success) {
        if (response["status"] == "success") {
          _requestStatus = RequestStatus.success;
          _timer!.cancel();
          Get.back();
          snackBarSuccess(
              icon: CupertinoIcons.info_circle, msg: response["message"]);
          final String email = _email.text;
          Get.offAndToNamed(RouteHelper.getResetPassword(), arguments: email);
        } else {
          _requestStatus = RequestStatus.noData;
          Get.back();
          snackBarMessage(title: "Warning", msg: response["message"]);
        }
      }
      update();
    }
  }

  int _countdown = 0;
  int get countdown => _countdown;
  bool _isCountdownFinish = false;
  bool get isCountdownFinish => _isCountdownFinish;
  Timer? _timer;

  @override
  Future<void> startCountdown() async {
    _countdown = 59;
    _isCountdownFinish = false;
    update();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countdown > 0) {
        _countdown--;
        log("$_countdown");
        update();
      } else {
        _countdown = 00;
        _isCountdownFinish = true;
        _timer!.cancel();
        update();
      }
    });
    /* for (int i = 59; i >= 0; i--) {
      await Future.delayed(const Duration(seconds: 1));
      _countdown = i;
      log("$i");
      update();
    } */
    update();
  }
  /* @override
  Future<void> startCountdown() async {
    _isCountdownFinish = false;
    update();
    for (int i = 59; i >= 0; i--) {
      await Future.delayed(const Duration(seconds: 1));
      _countdown = i;
      log("$i");
      update();
    }
    _isCountdownFinish = true;
    update();
  } */

  @override
  Future<void> onCountdownFinish() async {
    if (_isCountdownFinish == true) {
      _requestStatus = RequestStatus.loading;
      popLoading(msg: "Sending OTP");
      update();
      var response = await _authRepo.foSetEmail(email: _email.text);
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
  Future<void> onTappedResetPass() async {
    if (resetForm.currentState!.validate()) {
      _requestStatus = RequestStatus.loading;
      popLoading(msg: "Please Wait");
      update();

      var response = await _authRepo.foSetNewPass(
          email: _email.text, password: _rePassword.text);
      _requestStatus = handlingRespose(response);
      if (_requestStatus == RequestStatus.success) {
        if (response["status"] == "success") {
          _requestStatus = RequestStatus.success;
          Get.back();
          snackBarSuccess(
              icon: CupertinoIcons.info_circle, msg: response["message"]);

          Get.delete<ForgetPasswordControllerImp>();
          Get.offNamed(RouteHelper.getLogin());
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
  void dispose() {
    email.dispose();
    password.dispose();
    passwordRe.dispose();
    super.dispose();
  }
}
