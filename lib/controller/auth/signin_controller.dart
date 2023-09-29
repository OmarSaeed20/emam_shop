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

  final RepositoryImp _repo = Get.find();
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
      SignInRequest request =
          SignInRequest(email: email.text, password: password.text);
      var response = await _repo.signin(body: request);
      _requestStatus = handlingRespose(response);
      if (_requestStatus == RequestStatus.success) {
        if (response["status"] == "success") {
          _requestStatus = RequestStatus.success;
          if (response['data']['user_approve'] == "1") {
            _saveUserData(
              id: response["data"]["user_id"],
              username: response["data"]["user_name"],
              email: response["data"]["user_email"],
              phone: response["data"]["user_phone"],
            );
            _onSuccessLogin();
          } else {
            SignUpControllerImp.to.startCountdown();
            Get.toNamed(
              RouteHelper.getVerifySignup(),
              arguments: {"email": email.text},
            );
          }
          update();
        } else {
          _requestStatus = RequestStatus.noData;
          snackBarMessage(title: "warning", msg: response["data"]);
        }
        update();
      }
    }
  }

  _onSuccessLogin() {
    FirebaseMessaging.instance.subscribeToTopic("users");
    FirebaseMessaging.instance
        .subscribeToTopic("users${database.getString(EndPoint.userId)}");
    Get.delete<SignInControllerImp>();
    Get.delete<SignUpControllerImp>();
    Get.offAllNamed(RouteHelper.getMain());
  }

  _saveUserData({id, username, email, phone}) {
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
