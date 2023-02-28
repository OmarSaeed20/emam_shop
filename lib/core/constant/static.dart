import '/index.dart';

class Static {
  static const List<OnBoardingModel> onBoardingList = [
    OnBoardingModel(
      title: AppStrings.onBoaTi1,
      supTitle: AppStrings.onBoaSupTi1,
      image: AppImages.onBoa1,
      texBtn: AppStrings.letsGo,
    ),
    OnBoardingModel(
        title: AppStrings.onBoaTi2,
        image: AppImages.onBoa2,
        texBtn: AppStrings.next,
        supTitle: AppStrings.onBoaSupTi2),
    OnBoardingModel(
        title: AppStrings.onBoaTi3,
        image: AppImages.onBoa3,
        texBtn: AppStrings.next,
        supTitle: AppStrings.onBoaSupTi3),
    OnBoardingModel(
        title: AppStrings.onBoaTi4,
        image: AppImages.onBoa4,
        texBtn: AppStrings.finished,
        supTitle: AppStrings.onBoaSupTi4),
  ];
}
