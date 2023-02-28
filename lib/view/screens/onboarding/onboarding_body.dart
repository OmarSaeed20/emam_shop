import 'package:ecommerce/index.dart';

class OnBoardingBody extends GetView<OnBoardingControllerImpl> {
  const OnBoardingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (val) {
        controller.onPageChanged(val);
      },
      itemCount: Static.onBoardingList.length,
      itemBuilder: (context, index) {
        final list = Static.onBoardingList[index];
        return Container(
          height: Dimensions.screenHeight,
          width: Dimensions.screenWidth,
          margin: EdgeInsets.only(top: getProportScrHeight(30)),
          child: SafeArea(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextWidget(
                list.title,
                fontSize: 19,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(
                  height: getProportScrHeight(380),
                  width: Dimensions.screenWidth,
                  child: LottieBuilder.asset(list.image)),
              Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: getProportScrHeight(45)),
                  child: TextWidget(
                    list.supTitle,
                    textAlign: TextAlign.center,
                    color: AppColors.blackLight,
                    spacing: getProportionateScreenWidth(0.4),
                    height: getProportionateScreenWidth(1.5),
                    fontWeight: FontWeight.w700,
                  )),
            ],
          )),
        );
      },
    );
  }
} 
//Widget OnBoardingBody() => GetBuilder<OnBoardingControllerImpl>(
//     builder: (controller) => );
