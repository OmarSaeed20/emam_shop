import '../../index.dart';
class RouteName {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String forgetPassword = '/forget_password';
  static const String register = '/register';
  static const String verification = '/verification';
  static const String main = '/main';
  static const String notification = '/notification';
  static const String editProfile = '/edit_profile';
  // static const String sendFeedback = '/send-feedback';
  static const String faqs = '/faqs';
  static const String privacyPolicy = '/privacy_policy';
  static const String home = '/home';
  static const String competationDetails = '/competation_details';
  static const String map = '/map';
  static const String qrScaner = '/qr_scaner';
}
Map<String,Widget Function(BuildContext)> routs={
  RouteName.splash:(context) => const SplashScreen(),
  RouteName.onboarding:(context) => const OnBoardingScreen(),
  RouteName.login:(context) => const LoginScreen(),
};

 /*
class RouteHelper {
  static const String initial = '/';
  static const String _onboarding = '/onboarding';
  static const String _login = '/login';
  static const String _forgetPassword = '/forget_password';
  static const String _register = '/register';
  static const String _verification = '/verification';
  static const String _main = '/main';
  static const String _notification = '/notification';
  static const String _editProfile = '/edit_profile';
  // static const String _sendFeedback = '/send-feedback';
  static const String _faqs = '/faqs';
  static const String _privacyPolicy = '/privacy_policy';
  static const String _home = '/home';
  static const String _competationDetails = '/competation_details';
  static const String _map = '/map';
  static const String _qrScaner = '/qr_scaner';

  static String getInitial() => initial;
  static String getOnboarding() => _onboarding;
  static String getLogin() => _login;
  static String getForgetPassword() => _forgetPassword;
  static String getRegister() => _register;
  static String getVerification() => _verification;
  static String getMain() => _main;
  static String getNotificationsScreen() => _notification;
  static String getEditProfile() => _editProfile;
  // static String getSendFeedback() => _sendFeedback;
  static String getFAQs() => _faqs;
  static String getPrivacyPolicy() => _privacyPolicy;
  static String getHome() => _home;
  static String getCompetationDetails() => _competationDetails;
  static String getMap() => _map;
  static String getQrScaner() => _qrScaner;

  static List<GetPage> routes = [
    GetPage(
      name: initial,
      page: () => const SplashScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _onboarding,
      page: () => const OnBoardingScreen(),
      transition: Transition.fadeIn,
    ),
    // GetPage(
    //   name: _login,
    //   page: () => const LoginScreen(),
    //   transition: Transition.fadeIn,
    // ),
    // GetPage(
    //   name: _forgetPassword,
    //   page: () => const ForgetPasswordScreen(),
    //   transition: Transition.fadeIn,
    // ),
    // GetPage(
    //   name: _register,
    //   page: () => const SignUpScreen(),
    //   transition: Transition.fadeIn,
    // ),
    // GetPage(
    //     name: _verification,
    //     page: () => const VerificationCodeScreen(),
    //     transition: Transition.fadeIn),
    // GetPage(
    //     name: _main,
    //     page: () => const MainScreen(),
    //     transition: Transition.fadeIn),
    // GetPage(
    //     name: _notification,
    //     page: () => const NotificationsScreen(),
    //     transition: Transition.fadeIn),
    // GetPage(
    //     name: _editProfile,
    //     page: () => const EditProfileScreen(),
    //     transition: Transition.fadeIn),
    // // GetPage(
    // //     name: _sendFeedback,
    // //     page: () => const SendfeedbackDialog(),
    // //     transition: Transition.fadeIn),
    // GetPage(
    //     name: _faqs,
    //     page: () => const FAQsScreen(),
    //     transition: Transition.fadeIn),
    // GetPage(
    //     name: _privacyPolicy,
    //     page: () => const PrivacyPolicyScreen(),
    //     transition: Transition.fadeIn),
    // GetPage(
    //     name: _home,
    //     page: () => const HomePage(),
    //     transition: Transition.fadeIn),
    // GetPage(
    //     name: _map, page: () => const MapPage(), transition: Transition.fadeIn),
    // GetPage(
    //     name: _qrScaner,
    //     page: () => const QrScanerPage(),
    //     transition: Transition.fadeIn),
  ];
}
 */ 