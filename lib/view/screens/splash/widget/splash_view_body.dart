import "package:flutter_animate/flutter_animate.dart";

import "/index.dart";

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  // late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    _initSlidingAnimation();
    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.screenHeight,
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
          image: AssetImage(AppImages.background),
          fit: BoxFit.fitHeight,
          opacity: 20,
        ),
          color: AppColors.primarylight
          /*  ThemeController.to.getDarkTheme
            ? AppColors.darkScaffoldColor
            : AppColors.lightScaffoldColor, */
          ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // SvgPicture.asset(AppImages.emamLogo, height: 100.height),
          Image.asset(
            AppImages.emamLogoWithout,
            color: AppColors.red,
            height: 200.height,
          )
              .animate()
              .fadeIn(curve: Curves.easeInCirc)
              .scaleY()
              .shimmer(delay: 1700.ms, colors: <Color>[
            AppColors.red,
            const Color(0xff5b0060),
            const Color(0xff870160),
            const Color(0xffac255e),
            const Color(0xffca485c),
            const Color(0xffe16b5c),
            const Color(0xfff39060),
            const Color(0xffffb56b),
            AppColors.primary2
          ]),
          14.sH,
          const TextWidget(
            "EMAM",
            fontSize: 45,
            fontWeight: FontWeight.w700,
            color: AppColors.primary,
            fontFamily: "Montserrat",
          ),
        ],
      ),
    );
  }

  void _initSlidingAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
  }

  void _checkLogIn() {
    Get.offAllNamed(RouteHelper.getOnboarding());
    /* if (DatabaseHelper.to.getBool(EndPoints.onBoard)) {
      if (DatabaseHelper.to.getBool(EndPoints.userlogin)) {
        Get.offNamedUntil(RouteHelper.getMain(), (route) => false);
      } else {
        Get.offNamedUntil(RouteHelper.getLogin(), (route) => false);
      }
    } else {
      Get.offNamedUntil(RouteHelper.getOnboarding(), (route) => false);
    } */
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(seconds: 3),
      () => _checkLogIn(),
      // () => Get.offAllNamed(RouteHelper.getOnboarding()),
    );
  }
}
