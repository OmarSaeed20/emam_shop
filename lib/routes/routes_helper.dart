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
  static const String _itemsScreen = '/items_screen';
  static const String _allCategorie = '/all_categorie';
  static const String _productDetails = '/product_detaile';

  static const String _searchProduct = '/search_Product';
  static const String _category = '/category';

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
  static String getNotifications() => _notification;
  static String getEditProfile() => _editProfile;
  static String getFAQs() => _faqs;
  static String getPrivacyPolicy() => _privacyPolicy;
  static String getHome() => _home;
  static String getAllCategories() => _allCategorie;
  static String getItemsScreen() => _itemsScreen;
  static String getProductDetaile() => _productDetails;
  // I do this to easy variables sending process
  // static String getCompetationDetails(CompetitionsModel model) =>
  //     "$_competationDetails?competitionsModel=${jsonEncode(model)}";
  // static getPopularFood(Data product, {String page = 'home_page'}) =>
  //     '${AppRoutes.popularFood}?product=${jsonEncode(product)}&page=$page';
  // static String getMap(MachineModel model) =>
  //     "$_map?machinModel=${jsonEncode(model)}";
  static String getSearchProduct() => _searchProduct;
  static String getCategory() => _category;

  static List<GetPage> routes = <GetPage>[
    GetPage(
      name: initial,
      page: () => const SplashScreen(),
      transition: Transition.native,
    ),
    GetPage(
        name: _onboarding,
        page: () => const OnBoardingScreen(),
        middlewares: [RouteWelcomeMiddleware()],
        transition: Transition.native),
    GetPage(
        name: _wellcom,
        page: () => const WelcomeScreen(),
        transition: Transition.native),
    GetPage(
        name: _phoneNumber,
        page: () => const PhoneScreen(),
        transition: Transition.native),
    GetPage(
        name: _login,
        page: () => const LoginScreen(),
        transition: Transition.native),
    GetPage(
        name: _register,
        page: () => const SignUpScreen(),
        transition: Transition.native),
    GetPage(
        name: _verifySignup,
        page: () => const VerifyCodeSignupScreen(),
        transition: Transition.native),
    GetPage(
        name: _forgetPass,
        page: () => const ForgetPasswordScreen(),
        transition: Transition.native),
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
    GetPage(
        name: _allCategorie,
        page: () => const CategorigsScreen(),
        transition: Transition.native),
    GetPage(
        name: _itemsScreen,
        page: () => const ItemScreen(),
        transition: Transition.native),
    GetPage(
      name: _productDetails,
      page: () => const ProductDetailsScreen(),
      transition: Transition.size,
    ),
    GetPage(
      name: _notification,
      page: () => const NotificationScreen(),
      transition: Transition.zoom,
    ),
    /* 
    GetPage(
        name: _setOtp,
        page: () => const SetOTPScre(),
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
