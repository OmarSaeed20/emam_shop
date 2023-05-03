import '/index.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GetBuilder<SignInControllerImp>(
        builder: (controller) => _bottomNavigationBar(controller),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Positioned(
                top: 10.height,
                left: 15.weight,
                child: const IconAndTextBack(),
              ),
              GetBuilder<SignInControllerImp>(
                builder: (controller) {
                  return Container(
                      padding: paddingSymme(horizontal: 25),
                      width: double.infinity,
                      child: Column(
                        children: [
                          40.sH,
                          const AuthLogoWidegt(title: "Sign in"),
                          40.sH,
                          authTitle(AppStrings.welcomeBack.tr),
                          20.sH,
                          TextFormSignInBody(controller: controller),
                          20.sH,
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () =>
                                  Get.offNamed(RouteHelper.getForgetPass()),
                              child: TextWidget(
                                AppStrings.forgetPass.tr,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.awsmMedium,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

_bottomNavigationBar(SignInControllerImp controller) => Padding(
      padding: paddingSymme(horizontal: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AbsorbPointer(
            absorbing: controller.isEmptyFeild,
            child: BtnWidget(
              AppStrings.signin.tr,
              fontSize: 18.weight,
              width: double.infinity,
              height: 50.height,
              backgroundColor: controller.isEmptyFeild
                  ? AppColors.grey.withOpacity(0.6)
                  : AppColors.primary,
              isLoading: controller.isLoading,
              onPressed: () => controller.onTappedSignIn(),
            ),
          ),
          15.sH,
          SignHere(
            AppStrings.dontHaACC.tr,
            text2: AppStrings.signUpHe.tr,
            onTap: () => Get.offNamed(RouteHelper.getRegister()),
          ),
          20.sH,
        ],
      ),
    );
