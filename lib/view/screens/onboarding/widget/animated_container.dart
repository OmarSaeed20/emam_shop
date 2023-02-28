  import '/index.dart';
  
  Widget animatedContainer(OnBoardingControllerImpl controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
            Static.onBoardingList.length,
            (index) => AnimatedContainer(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(4)),
                  duration: const Duration(milliseconds: 600),
                  height: getProportScrHeight(8),
                  width: controller.currentPage == index
                      ? getProportScrHeight(25)
                      : getProportScrHeight(7),
                  decoration: BoxDecoration(
                      color: controller.currentPage == index
                          ? AppColors.secondaryColor
                          : AppColors.grey,
                      borderRadius: BorderRadius.circular(10)),
                )),
      ],
    );
  }