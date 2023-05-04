import '/index.dart';

abstract class PhoneController extends GetxController {
  void isCheckFeilds(bool val);
  void onChangedSignWithPhone();
  void onTappedSignWithphone(controller);
  void onTappedVerifyCode(val);
}

class PhoneControllerImp extends PhoneController {
  PhoneControllerImp get to => Get.find();
  // loading
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  GlobalKey<FormState> phoneForm = GlobalKey<FormState>();
  GlobalKey<FormState> form = GlobalKey<FormState>();

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

  @override
  void onChangedSignWithPhone() {
    GetUtils.isLengthEqualTo(_phone.text, 11)
        ? isCheckFeilds(false)
        : isCheckFeilds(true);
  }

  @override
  void onTappedSignWithphone(controller) {
    String phone = _phone.text;
    Get.to(
      () => VerificationCodeScreen(controller: controller),
      arguments: phone,
    );
    // Get.toNamed(RouteHelper.getVerification(), arguments: phone);
  }

  @override
  void onTappedVerifyCode(val) {
    snackBarSuccess();
    // _isLoading = true;
    Get.offAndToNamed(RouteHelper.getLogin());
    update();
  }

  @override
  void dispose() {
    phone.clear();
    super.dispose();
  }
}
