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
  static const String _itemsScreen = '/items_screen';
  static const String _allCategorie = '/all_categorie';
  static const String _productDetails = '/product_detaile';
  static const String _editProfile = '/edit_profile';
  static const String _termsPolicies = '/terms_policies';
  static const String _paymentMethods = '/payment_methods';
  static const String _deliveryAddress = '/delivery_address';
  static const String _myOrders = '/my_orders';
  static const String _helpSupport = '/help_support';
  static const String _report = '/report_problem';
  static const String _cart = '/cart';

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
  static String getAllCategories() => _allCategorie;
  static String getItemsScreen() => _itemsScreen;
  static String getProductDetaile() => _productDetails;
  static String getNotifications() => _notification;
  static String getProfile() => _editProfile;
  static String getHelpSupport() => _helpSupport;
  static String getTermsPolicies() => _termsPolicies;
  static String getPaymentMethods() => _paymentMethods;
  static String getDeliveryAddress() => _deliveryAddress;
  static String getMyOrders() => _myOrders;
  static String getReport() => _report;
  static String getCart() => _cart;

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
    GetPage(
        name: _editProfile,
        page: () => const EditProfilePage(),
        transition: Transition.native),
    GetPage(
        name: _helpSupport,
        page: () => const HelpSupportPage(),
        transition: Transition.native),
    GetPage(
        name: _termsPolicies,
        page: () => const TermsPoliciesPage(),
        transition: Transition.native),
    GetPage(
        name: _paymentMethods,
        page: () => const PaymentPage(),
        transition: Transition.native),
    GetPage(
        name: _deliveryAddress,
        page: () => const MyAddressPage(),
        transition: Transition.native),
    GetPage(
        name: _myOrders,
        page: () => const MyOrdersPage(),
        transition: Transition.native),
    GetPage(
        name: _report,
        page: () => const RreportPage(),
        transition: Transition.native),
    GetPage(
        name: _cart,
        page: () => const CartScreen(),
        transition: Transition.native),
    /* 
   
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
