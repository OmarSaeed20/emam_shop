import '/index.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  // late AnimationController animationController;
  // late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    navigateToHome();
    super.initState();
    // initSlidingAnimation();
  }

  @override
  void dispose() {
    super.dispose();
    // animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.screenHeight,
      width: Dimensions.screenWidth,
      child: Lottie.asset(AppImages.logoSplash, fit: BoxFit.fill),
    );
  }

  // void initSlidingAnimation() {
  //   animationController = AnimationController(
  //     vsync: this,
  //     duration: const Duration(seconds: 3),
  //   );
  // }

  void navigateToHome() {
    Future.delayed(
      const Duration(seconds: 3),
      () => Get.offAllNamed(RouteName.onboarding),
    );
  }
}
