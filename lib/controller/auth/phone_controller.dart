import 'dart:async';

import '/index.dart';

abstract class PhoneController extends GetxController {
  void isCheckFeilds(bool val);
  void onChangedSignWithPhone();
  void onTappedSignWithphone(controller);
  void onTappedVerifyCode(val, BuildContext context);
  void onChangedVerfiy();
  Future<void> startCountdown();
  Future<void> onCountdownFinish(String email);
}

class PhoneControllerImp extends PhoneController {
  static PhoneControllerImp get to => Get.find<PhoneControllerImp>();

  GlobalKey<FormState> phoneForm = GlobalKey<FormState>();
  GlobalKey<FormState> form = GlobalKey<FormState>();

  RequestStatus _requestStatus = RequestStatus.none;
  RequestStatus get requestStatus => _requestStatus;

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
    startCountdown();
    String phone = _phone.text;
    Get.toNamed(
      RouteHelper.getVerifyPhone(),
      arguments: {"email": phone},
    );
    // Get.toNamed(RouteHelper.getVerification(), arguments: phone);
  }

  String? val;
  @override
  void onChangedVerfiy() {
    val == null ? isCheckFeilds(false) : isCheckFeilds(true);
  }

  @override
  void onTappedVerifyCode(val, context) {
    snackBarSuccess();
    successAwsomeDialog(
      context,
      btnOkOnPress: () => Get.back(),
    );
    timer!.cancel();
    Get.delete<PhoneControllerImp>();
    Get.offNamed(RouteHelper.getLogin());
    update();
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
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
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
      },
    );
    update();
  }

  final RepositoryImp _repo = Get.find();

  @override
  Future<void> onCountdownFinish(String? email) async {
    email = "omarhamode106@gmail.com";
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
      }
      update();
    }
  }

  @override
  void dispose() {
    phone.clear();
    super.dispose();
  }
}
