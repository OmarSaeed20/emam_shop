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

  AuthRepo repo = Get.find();
  DatabaseHelper database = Get.find();
  // loading
  RequestStatus _requestStatus = RequestStatus.none;
  RequestStatus get requestStatus => _requestStatus;

  @override
  void onInit() {
    /*   FirebaseMessaging.instance.getToken().then((value) {
      log("Tokennnnn>>>> $value");
      String? token = value;
    }); */
    super.onInit();
  }

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
      // popLoading();
      update();
      var response =
          await repo.signin(email: email.text, password: password.text);
      _requestStatus = handlingRespose(response);
      if (_requestStatus == RequestStatus.success) {
        if (response["status"] == "success") {
          _requestStatus = RequestStatus.success;
          _saveUserData(
            response["data"]["user_id"],
            response["data"]["user_name"],
            response["data"]["user_email"],
            response["data"]["user_phone"],
          );
          snackBarSuccess(msg: "welcome ${response["data"]["user_name"]}");
          _onSuccessLogin();
          update();
        } else {
          _requestStatus = RequestStatus.noData;
          // Get.back();
          snackBarMessage(title: "warning", msg: response["data"]);
        }
        update();
      } else if (_requestStatus == RequestStatus.offLineFailure ||
          _requestStatus == RequestStatus.serverFailure ||
          _requestStatus == RequestStatus.serverException) {
        // _requestStatus == RequestStatus.offLineFailure;
        snackBarMessage(title: "warning", msg: "Please try again");
        update();
      } else {}
    }
  }

  _onSuccessLogin() {
    // Get.back();
    Get.delete<SignInControllerImp>();
    Get.delete<SignUpControllerImp>();
    Get.offAllNamed(RouteHelper.getMain());
  }

  _saveUserData(id, username, email, phone) {
    database.setString(EndPoint.userId, id);
    database.setString(EndPoint.userName, username);
    database.setString(EndPoint.userEmail, email);
    database.setString(EndPoint.userPhone, phone);
    database.setString(EndPoint.step, EndPoint.login);
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }
}
