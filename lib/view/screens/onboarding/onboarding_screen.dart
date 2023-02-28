import "/index.dart";

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16)),
      child: Column(
        children: [
          const Expanded(child: OnBoardingBody()),
          Column(
            children: [
              GetBuilder<OnBoardingControllerImpl>(
                  builder: (controller) => animatedContainer(controller)),
              sizeHei(25),
              GetBuilder<OnBoardingControllerImpl>(
                  builder: (controller) => BtnWidget(AppStrings.next,
                      onPressed: () => controller.next(),
                      width: getProportionateScreenWidth(300))),
              textBtn(onTap: () {}, AppStrings.skip),
              sizeHei(6),
            ],
          ),
        ],
      ),
    ));
  }
}
