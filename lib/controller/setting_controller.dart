import 'package:url_launcher/url_launcher.dart';

import '../index.dart';

abstract class SettingController extends GetxController {
  goToProfile();
  goToPayMentMethods();
  goToDeliveryAddress();
  goToMyOrders();
  goToNotfications();
  goToHelpSupport();
  goToContactus();
  goToTermsAndPolicies();
  goToReoprtProblems();
  goToDeleteAccount();
  deleteUserDatabase();
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

  List<ContactusData> contactusListData = [
    ContactusData(
        img: AppImages.dilvery,
        title: "phone",
        supTitle: "+20 106 452 536 8",
        url: "+201064525368"),
    ContactusData(
        img: AppImages.dilvery,
        title: "TikTok",
        supTitle: "omar@gmail.com",
        url: 'omar@gmail.com'),
    ContactusData(
        img: AppImages.dilvery,
        title: "mail",
        supTitle: "supportuser@gmail.com",
        url: 'supportuser@gmail.com'),
  ];
  Future<void> launchUrll(urll) async {
    Uri url = Uri.parse(urll);
    if (!await launchUrl(url)) {
      snackBarMessage(msg: "Could not launch $url");
      throw Exception('Could not launch $url');
    } else {
      await launchUrl(url);
    }
  }

  @override
  goToContactus() {
    Get.toNamed(RouteHelper.getContactus());
  }

  MyServices myServices = Get.find();
  @override
  goToLogout() {
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("users$userId");
    // myServices.sharedPreferences.clear();
    database.setString(EndPoint.step, EndPoint.logout);
    deleteUserDatabase();
    Get.offAllNamed(RouteHelper.getLogin());
  }

  @override
  deleteUserDatabase() {
    database.remove(EndPoint.userId);
    database.remove(EndPoint.userName);
    database.remove(EndPoint.userEmail);
    database.remove(EndPoint.userPhone);
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

class ContactusData {
  final String url;
  final String img;
  final String title;
  final String? supTitle;

  ContactusData({
    required this.url,
    required this.img,
    required this.title,
    this.supTitle,
  });
}
