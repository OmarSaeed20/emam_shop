import '../index.dart';

abstract class SettingController extends GetxController {
  goToProfile();
  goToPayMentMethods();
  goToDeliveryAddress();
  goToMyOrders();
  goToNotfications();
  goToHelpSupport();
  goToTermsAndPolicies();
  goToReoprtProblems();
  goToDeleteAccount();
  goToLogout();
}

class SettingControllerImp extends SettingController {
  static SettingControllerImp get to => Get.find();

  final DatabaseHelper database = Get.find();
  late String userId;
  late String userName;
  late String userEmail;
  late String userPhone;

  init() {
    userId = database.getString(EndPoint.userId);
    userName = database.getString(EndPoint.userName);
    userEmail = database.getString(EndPoint.userEmail);
    userPhone = database.getString(EndPoint.userPhone);
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }

  @override
  goToDeleteAccount() {
    myServices.sharedPreferences.clear();
    snackBarSuccess(msg: 'Account deleteted successfly');
    Get.offAllNamed(RouteHelper.getWellcom());
  }

  @override
  goToDeliveryAddress() {
    Get.toNamed(RouteHelper.getDeliveryAddress());
  }

  @override
  goToHelpSupport() {
    Get.toNamed(RouteHelper.getHelpSupport());
  }

  MyServices myServices = Get.find();
  @override
  goToLogout() {
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("users$userId");
    // myServices.sharedPreferences.clear();
    database.setString(EndPoint.step, EndPoint.logout);
    database.remove(EndPoint.userId);
    database.remove(EndPoint.userName);
    database.remove(EndPoint.userEmail);
    database.remove(EndPoint.userPhone);
    Get.offAllNamed(RouteHelper.getLogin());
  }

  @override
  goToMyOrders() {
    Get.toNamed(RouteHelper.getMyOrders());
  }

  @override
  goToNotfications() {
    Get.toNamed(RouteHelper.getNotifications());
  }

  @override
  goToPayMentMethods() {
    Get.toNamed(RouteHelper.getPaymentMethods());
  }

  @override
  goToProfile() {
    Get.toNamed(RouteHelper.getProfile());
  }

  @override
  goToReoprtProblems() {
    Get.toNamed(RouteHelper.getReport());
  }

  @override
  goToTermsAndPolicies() {
    Get.toNamed(RouteHelper.getTermsPolicies());
  }
}
