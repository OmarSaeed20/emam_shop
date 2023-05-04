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
    _navigateToHome();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.screenHeight,
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.background),
            fit: BoxFit.fill,
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
            fit: BoxFit.fill,
            color: AppColors.red,
            height: 200.height,
          )
              .animate()
              .fadeIn(curve: Curves.easeInCirc)
              .scaleY()
              .shimmer(delay: 1700.ms, colors: <Color>[
            AppColors.primary,
            const Color(0xff5b0060),
            const Color(0xff870160),
            const Color(0xffac255e),
            const Color(0xffca485c),
            const Color(0xffe16b5c),
            const Color(0xfff39060),
            const Color(0xffffb56b),
            AppColors.darkblu
          ]),
          10.sH,
          const TextWidget(
            "EMAM",
            fontSize: 55,
            fontWeight: FontWeight.bold,
            color: AppColors.awsm,
            fontFamily: AppStrings.montserrat,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
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

  void _navigateToHome() {
    Future.delayed(
      const Duration(seconds: 3),
      () => _checkLogIn(),
      // () => Get.offAllNamed(RouteHelper.getOnboarding()),
    );
  }
}
