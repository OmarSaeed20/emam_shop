import "package:firebase_core/firebase_core.dart";

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

  Get.lazyPut(() => MyLocaleControllerImp(), fenix: true);

  Get.lazyPut(() => TestController(), fenix: true);
  // repo
  Get.lazyPut(() => AuthRepo(), fenix: true);
  Get.lazyPut(() => HomeRepo(), fenix: true);
}

Future<void> appInit() async {
  await Firebase.initializeApp();
}
