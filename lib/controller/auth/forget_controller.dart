import 'dart:async';

import 'package:flutter/cupertino.dart';

import '/index.dart';

abstract class ForgetPasswordController extends GetxController {
  void isCheckFeilds(bool val);
  void onChangedForgetPass();
  void onChangedVerfiy();
  void onChangedResetPass();

  Future<void> onTappedForgetPass();

  void onTappedVerifyCode(String email, val);
  Future<void> startCountdown();
  Future<void> onCountdownFinish(String email);

  void hiddenPassword();
  void hiddenPasswordRe();
  void onTappedResetPass();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  static ForgetPasswordControllerImp get to => Get.find();

  @override
  void onInit() {
    _email = TextEditingController();
    super.onInit();
  }

  final RepositoryImp _repo = Get.find();

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
      update();
      var response = await _repo.foSetEmail(email: _email.text);
      _requestStatus = handlingRespose(response);
      if (_requestStatus == RequestStatus.success) {
        if (response["status"] == "success") {
          startCountdown();
          snackBarSuccess(
              icon: CupertinoIcons.info_circle, msg: response["message"]);
          Get.toNamed(
            RouteHelper.getForgetVerfiyCode(),
            arguments: {"email": email.text},
          );
        } else {
          _requestStatus = RequestStatus.noData;
          snackBarMessage(title: "Warning", msg: response["message"]);
        }
        update();
      } else if (_requestStatus == RequestStatus.offLineFailure ||
          _requestStatus == RequestStatus.serverFailure ||
          _requestStatus == RequestStatus.serverException) {
        snackBarMessage(title: "warning", msg: "Please try again");
        update();
      } else {}
    }
  }

  String? argEmail;
  @override
  void onTappedVerifyCode(String email, val) async {
    argEmail = email;
    if (form.currentState!.validate()) {
      _requestStatus = RequestStatus.loading;
      update();
      var response = await _repo.foSetOtp(email: email, otp: val);
      _requestStatus = handlingRespose(response);
      if (_requestStatus == RequestStatus.success) {
        if (response["status"] == "success") {
          _requestStatus = RequestStatus.success;
          _timer!.cancel();
          snackBarSuccess(
              icon: CupertinoIcons.info_circle, msg: response["message"]);
          Get.offAndToNamed(
            RouteHelper.getResetPassword(),
            arguments: {"email": email},
          );
        } else {
          _requestStatus = RequestStatus.noData;
          snackBarMessage(title: "Warning", msg: response["message"]);
        }
        update();
      } else if (_requestStatus == RequestStatus.offLineFailure ||
          _requestStatus == RequestStatus.serverFailure ||
          _requestStatus == RequestStatus.serverException) {
        snackBarMessage(title: "warning", msg: "Please try again");
        update();
      } else {}
    }
  }

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
      var response = await _repo.foSetEmail(email: email);
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
        update();
      } else if (_requestStatus == RequestStatus.offLineFailure ||
          _requestStatus == RequestStatus.serverFailure ||
          _requestStatus == RequestStatus.serverException) {
        snackBarMessage(title: "warning", msg: "Please try again");
        update();
      } else {}
    }
  }

  @override
  Future<void> onTappedResetPass() async {
    if (resetForm.currentState!.validate()) {
      _requestStatus = RequestStatus.loading;
      update();
      debugPrint(email.text);
      debugPrint(_rePassword.text);
      SignInRequest request = SignInRequest(
          email: email.text.trim(), password: password.text.trim());
      var response = await _repo.foSetNewPass(body: request);
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
          snackBarMessage(title: "Warning", msg: response["message"]);
        }
        update();
      }
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
