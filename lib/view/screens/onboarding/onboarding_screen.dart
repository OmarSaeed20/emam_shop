import "/index.dart";

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var listOnBoa = Static.onBoardingList;
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      body: SafeArea(
        child: GetBuilder<OnBoardingContoller>(
            builder: (controller) => Stack(
                  children: [
                    PageView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: controller.pageController,
                      onPageChanged: (value) =>
                          controller.onPageChange(controller.currentPage),
                      itemCount: listOnBoa.length,
                      itemBuilder: (context, index) {
                        final list = listOnBoa[index];
                        return OnBoardingBody(list: list);
                      },
                    ),
                    Positioned(
                        bottom: 0,
                        right: getProportionateScreenWidth(16),
                        left: getProportionateScreenWidth(16),
                        child: Column(
                          children: [
                            _animatContainer(controller),
                            35.sH,
                            BtnWidget(
                              controller.currentPage != listOnBoa.length - 1
                                  ? AppStrings.coontinue.tr
                                  : 'Get Strat',
                              onPressed: () => controller.next(),
                            ),
                            TextButton(
                              child: const TextWidget('Skip'),
                              onPressed: () => controller.skip(),
                            ),
                          ],
                        )),
                  ],
                )),
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
                color: AppColors.secondaryColor,
                borderRadius: BorderRadius.all(Radius.circular(10.height)),
              ),
            ),
          )
        ],
      );
}
