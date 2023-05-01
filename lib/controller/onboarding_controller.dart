import 'dart:developer';

import '/index.dart';

class OnBoardingContoller extends GetxController {
  PageController? pageController;
  @override
  void onInit() {
    pageController = PageController();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      diallog();
    });
    super.onInit();
  }

  diallog() {
    Get.defaultDialog(
        title: "Language",
        middleText: AppStrings.choseLang,
        barrierDismissible: false,
        actions: [const ChooseLang()]);
  }

  int _currentPage = 0;
  int get currentPage => _currentPage;

  next() {
    _currentPage++;
    log("$_currentPage");
    if (_currentPage > Static.onBoardingList.length - 1) {
      log(AutofillHints.birthday);
      skip();
    } else {
      pageController!.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 600),
        curve: Curves.linear,
      );
    }

    update();
  }

  onPageChange(int index) {
    _currentPage = index;
    update();
  }

  skip() {
    Get.offAllNamed(RouteHelper.getWellcom());
  }
}
