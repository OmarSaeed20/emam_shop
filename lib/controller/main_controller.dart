import 'package:flutter/cupertino.dart';

import '/index.dart';

abstract class MainController extends GetxController {
  void getCurrentScreen(int index);
}

class MainControllerImp extends MainController {
  static MainControllerImp get to => Get.find();

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  GlobalKey<ScaffoldState> get getkey => _key;

  int _currentIndex = 0;
  get getCurrentIndex => _currentIndex;

  List<Widget> get getcurrentScreen => _currentScreen;
  final List<Widget> _currentScreen = [
    const HomePage(),
    Container(),
    const CartScreen(),
    const FavoriteScreen(),
    const SettingScreen(),
  ];
  List<IconData> get icon => _currentIcon;
  List<IconData> get activeIcon => _currentActiveIcon;
  final List<IconData> _currentIcon = [
    Icons.dashboard_outlined,
    CupertinoIcons.person,
    CupertinoIcons.cart,
    CupertinoIcons.heart,
    Icons.settings_outlined,
  ];
  final List<IconData> _currentActiveIcon = [
    Icons.dashboard_rounded,
    CupertinoIcons.person_fill,
    CupertinoIcons.cart_fill,
    CupertinoIcons.heart_fill,
    CupertinoIcons.gear_solid
  ];

  @override
  void getCurrentScreen(int index) {
    _currentIndex = index;
    update();
  }

  //  drawer

  void editProfile() {
    Get.toNamed(RouteHelper.getProfile());
  }

  bool _value = false;
  get switchlang => _value;
  void switchLang() {
    _value = !_value;
    update();
  }

  void sendFeedback() {
    /*  Get.defaultDialog(
      contentPadding: EdgeInsets.zero,
      title: AppStrings.sendfedBa.tr,
      content: const SendfeedbackDialog(),
    ); */
  }

  void privacyPolicy() {
    Get.toNamed(RouteHelper.getTermsPolicies());
  }
  // ResponseModel? _response;

  Future<bool> onTapLogOut() async {
    /* try {
      _isLoading = true;
      update();
      Response response = await MainRepo.to.logOut();

      if (response.statusCode == 200 || response.statusCode == 201) {
        snackBarSuccess(msg: 'Loged Out Successfully ...');
        DatabaseHelper.to.setBool(EndPoint.login, false);
        Get.offNamedUntil(RouteHelper.getLogin(), (route) => false);
      } else {
        snackBarMessage(title: 'Log Out', msg: 'Loged Out failed ??? ...');
      }
      _isLoading = false;
      update();
    } catch (error) {
      snackBarMessage(title: 'Log Out', msg: 'Loged Out failed $error...');
      log('error in Log Out ---> $error');
    }  */
    return false;
  }

  void deleteAcount() {}

  // theme
  void lightTheme() {
    Get.snackbar('Light', 'message');
  }

  void darkTheme() {
    Get.snackbar('Dark', 'message');
  }
}
