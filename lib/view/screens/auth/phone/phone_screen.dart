import '/index.dart';

class PhoneScreen extends StatelessWidget {
  const PhoneScreen({super.key});

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
              GetBuilder<PhoneControllerImp>(
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
                          authTitle(
                            "${AppStrings.signWith.tr} ${AppStrings.phone.tr}",
                          ),
                          20.sH,
                          TextFormSignPhoneBody(controller: controller),
                          20.sH,
                          const Spacer(),
                          AbsorbPointer(
                            absorbing: controller.isEmptyFeild,
                            child: BtnWidget(
                              AppStrings.signin.tr,
                              fontSize: 18.weight,
                              height: 50.height,
                              backgroundColor: controller.isEmptyFeild
                                  ? AppColors.grey.withOpacity(0.6)
                                  : AppColors.primary,
                              isLoading: controller.isLoading,
                              onPressed: () =>
                                  controller.onTappedSignWithphone(),
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
