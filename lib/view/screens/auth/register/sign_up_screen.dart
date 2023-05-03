import '/index.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GetBuilder<SignUpControllerImp>(
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
              GetBuilder<SignUpControllerImp>(
                builder: (controller) {
                  return Container(
                    padding: paddingSymme(horizontal: 25),
                    width: double.infinity,
                    child: Column(
                      children: [
                        // 65.sH,
                        AuthLogoWidegt(title: AppStrings.signup.tr),
                        10.sH,
                        authTitle(AppStrings.signupTit.tr),
                        20.sH,
                        TextFormSignUpBody(controller: controller),
                        20.sH
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

_bottomNavigationBar(SignUpControllerImp controller) => Padding(
      padding: paddingSymme(horizontal: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AbsorbPointer(
            absorbing: controller.isEmptyFeild,
            child: BtnWidget(
              AppStrings.signup.tr,
              fontSize: 18.weight,
              height: 50.height,
              width: double.infinity,
              backgroundColor: controller.isEmptyFeild
                  ? AppColors.grey.withOpacity(0.6)
                  : AppColors.primary,
              isLoading: controller.isLoading,
              onPressed: () => controller.onTappedSignUp(),
            ),
          ),
          15.sH,
          SignHere(
            AppStrings.alreHaACC.tr,
            text2: AppStrings.signInHe.tr,
            onTap: () => Get.offNamed(RouteHelper.getLogin()),
          ),
          20.sH,
        ],
      ),
    );
