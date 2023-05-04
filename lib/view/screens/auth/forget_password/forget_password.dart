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
          child: GetBuilder<ForgetPasswordControllerImp>(
            builder: (controller) {
              return SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      IconAndTextBack(
                        onTap: () => Get.offAndToNamed(RouteHelper.getLogin()),
                      ),
                      _body(controller)
                    ],
                  ));
            },
          ),
        ),
      ),
    );
  }
}

_body(ForgetPasswordControllerImp controller) => Padding(
      padding: paddingSymme(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: screenPick(
              icon: CupertinoIcons.exclamationmark_triangle,
              text: "${AppStrings.forgetPass.tr} !",
            ),
          ),
          30.sH,
          authTitle("set your email"),
          10.sH,
          TextFormForgetPassBody(controller: controller),
          20.sH
        ],
      ),
    );
    
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