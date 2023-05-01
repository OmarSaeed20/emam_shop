import '/index.dart';

abstract class ForgetPasswordController extends GetxController {
  void isCheckFeilds(bool val);
  void onChangedForgetPass();
  void onTappedForgetPass();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  ForgetPasswordControllerImp get to => Get.find();

  // loading
  final bool _isLoading = false;
  bool get isLoading => _isLoading;

  final TextEditingController _email = TextEditingController();
  TextEditingController get email => _email;

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
  void onTappedForgetPass() {}

  @override
  void dispose() {
    _email.clear();
    super.dispose();
  }
}
