import "/index.dart";

/* class AppBinding implements Bindings {
  @override
  Future<void> dependencies() async {
    // prefs
    Get.put<DatabaseHelper>(DatabaseHelper());
    await Get.putAsync<DatabaseHelper>(() => DatabaseHelper.to.init());

    // api client
    // Get.lazyPut(() => ApiClient(url: EndPoints.App_Url), fenix: true);

    // repository
    

    // controllers
    Get.lazyPut(() => OnBoardingContoller(),fenix: true);
  }
} */

Future<void> init() async {
  // Get.put<DatabaseHelper>(DatabaseHelper());
  await Get.putAsync<DatabaseHelper>(() => DatabaseHelper().init());

  /// Api Client

  Get.lazyPut(() => ApiClient(), fenix: true);

  Get.lazyPut(() => OnBoardingContoller());
  Get.lazyPut(() => SignUpControllerImp(), fenix: true);
  Get.lazyPut(() => SignInControllerImp(), fenix: true);
  Get.lazyPut(() => ForgetPasswordControllerImp(), fenix: true);
  Get.lazyPut(() => PhoneControllerImp(), fenix: true);

  Get.lazyPut(() => MainControllerImp(), fenix: true);
  Get.lazyPut(() => HomeControllerImp(), fenix: true);
  Get.lazyPut(() => ItemsControllerImp(), fenix: true);
  Get.lazyPut(() => FavoriteControllerImp(), fenix: true);
  Get.lazyPut(() => CartControllerImp(), fenix: true);
  Get.lazyPut(() => SettingControllerImp(), fenix: true);
  Get.lazyPut(() => AddressControllerImp(), fenix: true);
  Get.lazyPut(() => GetAddressDataControllerImp(), fenix: true);
  Get.lazyPut(() => CouponControllerImp(), fenix: true);
  Get.lazyPut(() => PaymentControllerImp(), fenix: true);
  Get.lazyPut(() => MyOrderControllerImp(), fenix: true);
  Get.lazyPut(() => NotificationControllerImp(), fenix: true);

  Get.lazyPut(() => MyLocaleControllerImp(), fenix: true);

  Get.lazyPut(() => TestController(), fenix: true);
  // repo
  Get.lazyPut(() => AuthRepo(), fenix: true);
  Get.lazyPut(() => HomeRepo(), fenix: true);
  Get.lazyPut(() => ItemsRepo(), fenix: true);
  Get.lazyPut(() => FavoriteRepo(), fenix: true);
  Get.lazyPut(() => CartRepo(), fenix: true);
  Get.lazyPut(() => CouponRepo(), fenix: true);
  Get.lazyPut(() => AddressRepo(), fenix: true);
  Get.lazyPut(() => MyOrderRepo(), fenix: true);
  Get.lazyPut(() => NotificationRepo(), fenix: true);
}
