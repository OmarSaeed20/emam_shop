import 'package:flutter/cupertino.dart';

import '/index.dart';

abstract class SignInController extends GetxController {
  void isCheckFeilds(bool val);
  void hiddenPassword();
  void onChangedSignIn();

  Future<void> onTappedSignIn();
}

class SignInControllerImp extends SignInController {
  SignInControllerImp get to => Get.find();

  AuthRepo api = Get.find();
  // loading
  RequestStatus? _requestStatus;
  RequestStatus? get requestStatus => _requestStatus;

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

  GlobalKey<FormState> signinForm = GlobalKey<FormState>();
  GlobalKey<FormState> form = GlobalKey<FormState>();

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
  Future<void> onTappedSignIn() async {
    if (signinForm.currentState!.validate()) {
      _requestStatus = RequestStatus.loading;
      popLoading();
      update();
      var response =
          await api.signin(email: email.text, password: password.text);
      _requestStatus = handlingRespose(response);
      if (_requestStatus == RequestStatus.success) {
        if (response["status"] == "success") {
          Get.back();
          _requestStatus = RequestStatus.success;
          snackBarSuccess(msg: response["message"]);
          Get.delete<SignInControllerImp>();
          Get.offAllNamed(RouteHelper.getMain());
          update();
        } else {
          Get.back();
          snackBarMessage(title: "warning", msg: response["message"]);
        }
        update();
      }
    }
  }

  @override
  void dispose() {
    _email.clear();
    _password.clear();
    super.dispose();
  }
}
