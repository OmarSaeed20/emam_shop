import 'package:ecommerce/view/screens/auth/forget_password/forget_verfiy_code.dart';

import '/index.dart';

class RouteHelper {
  static const String initial = '/';
  static const String _onboarding = '/onboarding';
  static const String _wellcom = '/wellcom_screen';
  static const String _login = '/login';
  static const String _phoneNumber = '/_phone_number';
  static const String _forgetPass = '/_forget_pass';
  static const String _setOtp = '/set_otp';
  static const String _resetPassword = '/set_new_password';
  static const String _register = '/register';
  static const String _verifySignup = '/verify_signup';
  static const String _forgetVerfiyCode = '/forget_verfiy_code';
  static const String _main = '/main';
  static const String _notification = '/notification';
  static const String _editProfile = '/edit_profile';
  static const String _faqs = '/faqs';
  static const String _privacyPolicy = '/privacy_policy';
  static const String _home = '/home';
  static const String _competationDetails = '/competation_details';
  static const String _map = '/map';
  static const String _machinLoc = '/machin_loc';
  static const String _qrScaner = '/qr_scaner';
  static const String _chatScreen = '/chat_screen';
  static const String _community = '/community';
  static const String _addPeople = '/add_people';
  static const String _channelsScreen = '/channels_screen';
  static const String _wallet = '/wallet';
  static const String _searchProduct = '/search_Product';
  static const String _category = '/category';
  static const String _productDetails = '/product_details';
  static const String _myCart = '/my_cart';

  static String getInitial() => initial;
  static String getWellcom() => _wellcom;
  static String getOnboarding() => _onboarding;
  static String getLogin() => _login;
  static String getPhoneNumber() => _phoneNumber;
  static String getForgetPass() => _forgetPass;
  static String getSetOTPScre() => _setOtp;
  static String getResetPassword() => _resetPassword;
  static String getRegister() => _register;
  static String getForgetVerfiyCode() => _forgetVerfiyCode;
  static String getVerifySignup() => _verifySignup;
  static String getMain() => _main;
  static String getNotificationsScreen() => _notification;
  static String getEditProfile() => _editProfile;
  static String getFAQs() => _faqs;
  static String getPrivacyPolicy() => _privacyPolicy;
  static String getHome() => _home;
  // I do this to easy variables sending process
  // static String getCompetationDetails(CompetitionsModel model) =>
  //     "$_competationDetails?competitionsModel=${jsonEncode(model)}";
  // static getPopularFood(Data product, {String page = 'home_page'}) =>
  //     '${AppRoutes.popularFood}?product=${jsonEncode(product)}&page=$page';
  // static String getMap(MachineModel model) =>
  //     "$_map?machinModel=${jsonEncode(model)}";
  static String getMapLoc() => _machinLoc;
  static String getQrScaner() => _qrScaner;
  static String getChatScreen() => _chatScreen;
  static String getComunityPage() => _community;
  static String getChannelsScreen() => _channelsScreen;
  static String getAddPeople() => _addPeople;
  static String getWallet() => _wallet;
  static String getSearchProduct() => _searchProduct;
  static String getCategory() => _category;
  static String getProductDetails() => _productDetails;
  static String getMyCart() => _myCart;

  static List<GetPage> routes = <GetPage>[
    GetPage(
      name: initial,
      page: () => const SplashScreen(),
      transition: Transition.fadeIn,
      middlewares: [RouteWelcomeMiddleware()],
    ),
    GetPage(
      name: _onboarding,
      page: () => const OnBoardingScreen(),
      transition: Transition.native,
    ),
    GetPage(
      name: _wellcom,
      page: () => const WelcomeScreen(),
      transition: Transition.native,
    ),
    GetPage(
      name: _phoneNumber,
      page: () => const PhoneScreen(),
      transition: Transition.native,
    ),
    GetPage(
        name: _login,
        page: () => const LoginScreen(),
        transition: Transition.native),
    GetPage(
      name: _register,
      page: () => const SignUpScreen(),
      transition: Transition.native,
    ),
    GetPage(
      name: _verifySignup,
      page: () => const VerifyCodeSignupScreen(),
      transition: Transition.native,
    ),
    GetPage(
      name: _forgetPass,
      page: () => const ForgetPasswordScreen(),
      transition: Transition.native,
    ),
    GetPage(
        name: _forgetVerfiyCode,
        page: () => const ForgetVerifyCodeScreen(),
        transition: Transition.native),
    GetPage(
        name: _resetPassword,
        page: () => const ResetPasswordScreen(),
        transition: Transition.native),
    GetPage(
        name: _main,
        page: () => const MainScreen(),
        transition: Transition.native),

    /* 
    GetPage(
        name: _setOtp,
        page: () => const SetOTPScre(),
        transition: Transition.fadeIn),
    GetPage(
        name: _notification,
        page: () => const NotificationsScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: _editProfile,
        page: () => const EditProfileScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: _faqs,
        page: () => const FAQsScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: _privacyPolicy,
        page: () => const PrivacyPolicyScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: _home,
        page: () => const HomePage(),
        transition: Transition.fadeIn),
    GetPage(
        name: _competationDetails,
        page: () {
          CompetitionsModel? model = CompetitionsModel.fromJson(
            jsonDecode(Get.parameters['competitionsModel']!),
          );
          return CompetationDetails(model: model);
        },
        transition: Transition.fadeIn),
    GetPage(
        name: _map,
        page: () {
          MachineModel? model = MachineModel.fromJson(
            jsonDecode(Get.parameters['machinModel']!),
          );
          return MapPage(macModel: model);
        },
        transition: Transition.fadeIn),
    GetPage(
        name: _machinLoc,
        page: () => const MachinsMapPage(),
        transition: Transition.fadeIn),
    GetPage(
        name: _qrScaner,
        page: () => const QrScanerPage(),
        transition: Transition.fadeIn),
    GetPage(
        name: _chatScreen,
        page: () => const QrChatScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: _community,
        page: () => const CommunityPage(),
        transition: Transition.fadeIn),
    GetPage(
        name: _channelsScreen,
        page: () => const ChannelsScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: _addPeople,
        page: () => const AddPeopleScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: _wallet,
        page: () => const WalletPage(),
        transition: Transition.fadeIn),
    GetPage(
        name: _searchProduct,
        page: () => const SearchProduct(),
        transition: Transition.fadeIn),
    GetPage(
        name: _category,
        page: () => const Categorypage(),
        transition: Transition.fadeIn),
    GetPage(
        name: _productDetails,
        page: () => const ProductDetailsPage(),
        transition: Transition.fadeIn),
    GetPage(
        name: _myCart,
        page: () => const CartScreen(),
        transition: Transition.fadeIn),
    // getPageWidget("name", page: () => const WalletPage())
 */
  ];
  /*  dynamic _getPageWidget(String name, {required Widget Function() page}) =>
      GetPage(
        name: name,
        page: page,
        transition: Transition.fadeIn,
      ); */
}
