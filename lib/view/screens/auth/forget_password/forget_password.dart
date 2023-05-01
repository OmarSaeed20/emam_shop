import '/index.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

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
              GetBuilder<ForgetPasswordControllerImp>(
                builder: (controller) {
                  return Container(
                      padding: paddingSymme(horizontal: 25),
                      height: Dimensions.screenHeight - 40,
                      width: double.infinity,
                      child: Column(
                        children: [
                          30.sH,
                          const AuthLogoWidegt(),
                          40.sH,
                          authTitle("Reset Password !"),
                          20.sH,
                          TextFormForgetPassBody(controller: controller),
                          20.sH,
                          const Spacer(),
                          AbsorbPointer(
                            absorbing: controller.isEmptyFeild,
                            child: BtnWidget(
                              AppStrings.coontinue.tr,
                              fontSize: 18.weight,
                              height: 50.height,
                              backgroundColor: controller.isEmptyFeild
                                  ? AppColors.grey.withOpacity(0.6)
                                  : AppColors.primary,
                              isLoading: controller.isLoading,
                              onPressed: () => controller.onTappedForgetPass(),
                            ),
                          ),
                          30.sH,
                          SignHere(
                            AppStrings.dontHaACC.tr,
                            text2: AppStrings.signUpHe.tr,
                            onTap: () =>
                                Get.offNamed(RouteHelper.getRegister()),
                          ),
                          20.sH,
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
