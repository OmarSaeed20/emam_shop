import '/index.dart';

abstract class PhoneController extends GetxController {
  void isCheckFeilds(bool val);
  void onChangedSignWithPhone();
  void onTappedSignWithphone();
}

class PhoneControllerImp extends PhoneController {
  PhoneControllerImp get to => Get.find();
  // loading
  bool _isLoading = false;
  bool get isLoading => _isLoading;

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
  void onTappedSignWithphone() {
    String phone = _phone.text;

    Get.toNamed(RouteHelper.getVerification(), arguments: phone);
  }

  @override
  void dispose() {
    phone.clear();
    super.dispose();
  }
}
