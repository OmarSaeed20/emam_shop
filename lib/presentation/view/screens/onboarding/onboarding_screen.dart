import "/index.dart";

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        bottomSheet: GetBuilder<OnBoardingContoller>(
          builder: (controller) {
            return _bottomSheet(controller);
          },
        ),
        body: SafeArea(
          child: GetBuilder<OnBoardingContoller>(
            builder: (controller) {
              List<OnBoardingModel> listOnBoa = controller.listData;
              return Stack(
                children: [
                  PageView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: controller.pageController,
                    onPageChanged: (value) =>
                        controller.onPageChange(controller.currentPage),
                    itemCount: listOnBoa.length,
                    itemBuilder: (context, index) {
                      OnBoardingModel list = listOnBoa[index];
                      return OnBoardingBody(
                        title: list.title!,
                        img: list.image!,
                        supTitle: list.supTitle!,
                      );
                    },
                  ),
                  /*   Positioned(
                    bottom: 0,
                    right: 16.weight,
                    left: 16.weight,
                    child: Column(
                      children: [
                        _animatContainer(controller),
                        35.sH,
                        BtnWidget(
                          fontSize: 15.weight,
                          height: 50.height,
                          controller.currentPage != listOnBoa.length - 1
                              ? AppStrings.coontinue.tr
                              : AppStrings.getSta.tr,
                          onPressed: () => controller.next(),
                        ),
                        TextButton(
                          child: TextWidget(AppStrings.skip.tr),
                          onPressed: () => controller.skip(),
                        ),
                        // 15.sH
                      ],
                    ),
                  ), */
                ],
              );
            },
          ),
        ),
      ),
      onWillPop: () async {
        return false;
      },
    );
  }

  _bottomSheet(OnBoardingContoller controller) {
    return Container(
      height: 180.height,
      padding: paddingSymme(horizontal: 16),
      decoration: BoxDecoration(
        // color: AppColors.cardColor11,
        borderRadius: BorderRadius.vertical(top: Radius.circular(12.weight)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _animatContainer(controller),
          35.sH,
          TextButton(
            child: TextWidget(AppStrings.skip.tr, color: AppColors.primary2),
            onPressed: () => controller.skip(),
          ),
          AnimatedBtn(
            fontSize: 15,
            height: 45,
            controller.currentPage != controller.listData.length - 1
                ? AppStrings.coontinue.tr
                : AppStrings.getSta.tr,
            onTap: () => controller.next(),
          ),
          15.sH
        ],
      ),
    );
  }

  _animatContainer(OnBoardingContoller controller) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
            Static.onBoardingList.length,
            (index) => AnimatedContainer(
              margin: paddingSymme(horizontal: 3),
              duration: const Duration(milliseconds: 900),
              width: controller.currentPage == index ? 20.weight : 6.weight,
              height: 6.height,
              decoration: BoxDecoration(
                color: AppColors.secondaryPro,
                borderRadius: BorderRadius.all(Radius.circular(10.height)),
              ),
            ),
          )
        ],
      );
}
