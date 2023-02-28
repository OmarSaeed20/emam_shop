import '/index.dart';

abstract class OnBoardingController extends GetxController {
  next();

  onPageChanged(int index);
  skip();
}

class OnBoardingControllerImpl extends OnBoardingController {
  int currentPage = 0;
  late PageController pageController;

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  @override
  next() {
    currentPage++;
    if (currentPage > Static.onBoardingList.length - 1) {
      Get.offAllNamed(RouteName.login);
      // print("4");
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 600),
          curve: Curves.decelerate);
    }
  }

  @override
  skip() {}

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }
}
