import '/index.dart';

class OnBoardingContoller extends GetxController {
  static OnBoardingContoller get to => Get.find<OnBoardingContoller>();
  PageController? pageController;
  DatabaseHelper database;
  OnBoardingContoller(this.database);
  late String lang;
  late List<OnBoardingModel> listData = onBoardingListEn;

  @override
  void onInit() {
    debugPrint(listData.toString());
    lang = database.getString(EndPoint.lang);
    initLang();
    pageController = PageController();

    super.onInit();
  }

  void initLang() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _dialdebugPrintChoseLang();
    });
    update();
  }

  List<OnBoardingModel> onBoardingListAr = const [
    OnBoardingModel(
      image: AppImages.onBoa1,
      title: AppStrings.onBoaTi1Ar,
      supTitle: AppStrings.onBoaSupTi1Ar,
    ),
    OnBoardingModel(
      image: AppImages.onBoa2,
      title: AppStrings.onBoaTi2Ar,
      supTitle: AppStrings.onBoaSupTi2Ar,
    ),
    OnBoardingModel(
      image: AppImages.onBoa3,
      title: AppStrings.onBoaTi3Ar,
      supTitle: AppStrings.onBoaSupTi3Ar,
    ),
    OnBoardingModel(
      image: AppImages.onBoa4,
      title: AppStrings.onBoaTi4Ar,
      supTitle: AppStrings.onBoaSupTi4Ar,
    ),
  ];
  List<OnBoardingModel> onBoardingListEn = [
    const OnBoardingModel(
      image: AppImages.onBoa1,
      title: AppStrings.onBoaTi1,
      supTitle: AppStrings.onBoaSupTi1,
    ),
    const OnBoardingModel(
      title: AppStrings.onBoaTi2,
      image: AppImages.onBoa2,
      supTitle: AppStrings.onBoaSupTi2,
    ),
    const OnBoardingModel(
      title: AppStrings.onBoaTi3,
      image: AppImages.onBoa3,
      supTitle: AppStrings.onBoaSupTi3,
    ),
    const OnBoardingModel(
      title: AppStrings.onBoaTi4,
      image: AppImages.onBoa4,
      supTitle: AppStrings.onBoaSupTi4,
    ),
  ];

  _dialdebugPrintChoseLang() {
    Get.defaultDialog(
      backgroundColor: AppColors.white,
      title: AppStrings.lang,
      titleStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.weight),
      middleText: AppStrings.choseLang,
      middleTextStyle: TextStyle(color: AppColors.grey, fontSize: 14.weight),
      barrierDismissible: false,
      radius: 6.weight,
      actions: [const ChooseLang()],
    );
  }

  int _currentPage = 0;
  int get currentPage => _currentPage;

  next() {
    _currentPage++;
    debugPrint("$_currentPage");
    if (_currentPage > Static.onBoardingList.length - 1) {
      debugPrint(AutofillHints.birthday);
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
    // database.setBool(EndPoint.onboarding, true);
    database.setString(EndPoint.step, EndPoint.onboard);
    Get.offAllNamed(RouteHelper.getWellcom());
  }
}
