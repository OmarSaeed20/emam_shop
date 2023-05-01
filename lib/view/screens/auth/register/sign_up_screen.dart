import '/index.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    height: Dimensions.screenHeight - 40,
                    width: double.infinity,
                    child: Column(
                      children: [
                        65.sH,
                        const TextWidget(
                          "EMAM",
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          fontFamily: AppStrings.montserrat,
                        ),
                        45.sH,
                        authTitle(AppStrings.signupTit.tr),
                        20.sH,
                        TextFormSignUpBody(controller: controller),
                        const Spacer(),
                        AbsorbPointer(
                          absorbing: controller.isEmptyFeild,
                          child: BtnWidget(
                            AppStrings.signup.tr,
                            fontSize: 18.weight,
                            height: 50.height,
                            backgroundColor: controller.isEmptyFeild
                                ? AppColors.grey.withOpacity(0.6)
                                : AppColors.primary,
                            isLoading: controller.isLoading,
                            onPressed: () => controller.onTappedSignUp(),
                          ),
                        ),
                        30.sH,
                        SignHere(
                          AppStrings.alreHaACC.tr,
                          text2: AppStrings.signInHe.tr,
                          onTap: () => Get.offNamed(RouteHelper.getLogin()),
                        ),
                        20.sH,
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
