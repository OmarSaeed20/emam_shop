import "/index.dart";

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var listOnBoa = Static.onBoardingList;
    return Scaffold(
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
                        right: 16.weight,
                        left: 16.weight,
                        child: Column(
                          children: [
                            _animatContainer(controller),
                            35.sH,
                            BtnWidget(
                              fontSize: 18.weight,
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
                            15.sH
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
                color: AppColors.secondary,
                borderRadius: BorderRadius.all(Radius.circular(10.height)),
              ),
            ),
          )
        ],
      );
}
