import 'dart:developer';

import 'package:flutter_animate/flutter_animate.dart';

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
        backgroundColor: AppColors.white,
        title: AppStrings.lang.tr,
        titleStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.weight),
        middleText: AppStrings.choseLang.tr,
        middleTextStyle: TextStyle(color: AppColors.grey, fontSize: 14.weight),
        barrierDismissible: false,
        radius: 6.weight,
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
      pageController!
          .animateToPage(currentPage, duration: 600.ms, curve: Curves.linear);
    }

    update();
  }

  onPageChange(int index) {
    _currentPage = index;
    update();
  }

  skip() {
    DatabaseHelper.to.setBool(EndPoint.onboarding, true);
    Get.offAllNamed(RouteHelper.getWellcom());
  }
}
