import '../view/screens/home/home_screen.dart';
import '/index.dart';

abstract class MainController extends GetxController {}

class MainControllerImp extends MainController {
  static MainControllerImp get to => Get.find();

  // loading
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  get getkey => _key;
  get getBucket => _bucket;
  get getAppBar => _appBar;

  get getCurrentIndex => _currentIndex;
  get getcurrentScreen => _currentScreen;

  // static MainController get to => Get.find();

  // bool _value = false;
  int _currentIndex = 0;
  Widget _currentScreen = const HomePage();
  final PageStorageBucket _bucket = PageStorageBucket();
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  final List<PreferredSizeWidget> _appBar = [
    // homeAppBar(),
    AppBar(elevation: 0, toolbarHeight: 0),
    AppBar(elevation: 0, title: const TextWidget("map")),
    AppBar(elevation: 0, title: const TextWidget("sc")),
    AppBar(elevation: 0, title: const TextWidget("commm")),
    AppBar(elevation: 0, title: const TextWidget("waa")),
    // qrAppBar(),
    // communityAppBar(),
    // walletyAppBar(),
  ];

  void getCurrentScreen({required int index}) {
    if (index == 0) {
      _currentScreen = const HomePage();
      _currentIndex = 0;
    } else if (index == 1) {
      _currentScreen = Container();
      _currentIndex = 1;
    } else if (index == 2) {
      _currentScreen = Container();
      _currentIndex = 2;
    } else if (index == 3) {
      _currentScreen = Container();
      _currentIndex = 3;
    } else {
      _currentScreen = Container();
      _currentIndex = 4;
    }
    update();
  }

  //  drawer

  void editProfile() {
    Get.toNamed(RouteHelper.getEditProfile());
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

  void fAQs() {
    Get.toNamed(RouteHelper.getFAQs());
  }

  void privacyPolicy() {
    Get.toNamed(RouteHelper.getPrivacyPolicy());
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
