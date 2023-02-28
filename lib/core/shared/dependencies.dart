import "/index.dart";

Future<void> init() async {
  Get.lazyPut(() => OnBoardingControllerImpl());
}
