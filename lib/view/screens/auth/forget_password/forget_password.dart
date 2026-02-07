import 'package:flutter/cupertino.dart';

import '/index.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GetBuilder<ForgetPasswordControllerImp>(
        builder: (controller) => _bottomNavigationBar(controller),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Positioned(
                top: 10.height,
                left: 15.weight,
                child: IconAndTextBack(
                  onTap: () => Get.offAndToNamed(RouteHelper.getLogin()),
                ),
              ),
              GetBuilder<ForgetPasswordControllerImp>(
                builder: (controller) {
                  return Padding(
                      padding: paddingSymme(horizontal: 25),
                      // width: double.infinity,
                      child: Column(
                        children: [
                          30.sH,
                          screenPick(
                            icon: CupertinoIcons.exclamationmark_triangle,
                            text: "${AppStrings.forgetPass.tr} !",
                          ),
                          40.sH,
                          authTitle("set your email"),
                          20.sH,
                          TextFormForgetPassBody(controller: controller),
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

_bottomNavigationBar(ForgetPasswordControllerImp controller) => Padding(
      padding: paddingSymme(horizontal: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AbsorbPointer(
            absorbing: controller.isEmptyFeild,
            child: BtnWidget(
              AppStrings.coontinue.tr,
              fontSize: 18.weight,
              height: 50.height,
              width: double.infinity,
              backgroundColor: controller.isEmptyFeild
                  ? AppColors.grey.withOpacity(0.6)
                  : AppColors.primary,
              isLoading: controller.isLoading,
              onPressed: () => controller.onTappedForgetPass(controller),
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
