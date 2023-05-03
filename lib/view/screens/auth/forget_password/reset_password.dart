import 'package:flutter/cupertino.dart';

import '/index.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

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
                child: IconAndTextBack(onTap: () => Get.back()),
              ),
              GetBuilder<ForgetPasswordControllerImp>(
                builder: (controller) {
                  return Container(
                      padding: paddingSymme(horizontal: 25),
                      height: Dimensions.screenHeight - 40,
                      width: double.infinity,
                      child: Column(
                        children: [
                          40.sH,
                          screenPick(
                            icon: CupertinoIcons.lock_shield,
                            text: "Reset Password",
                          ),
                          40.sH,
                          authTitle("set a new password!"),
                          20.sH,
                          TextFormResetBody(controller: controller),
                          20.sH,
                          const Spacer(),
                          AbsorbPointer(
                            absorbing: controller.isEmptyFeild,
                            child: BtnWidget(
                              "Save".tr,
                              fontSize: 18.weight,
                              height: 50.height,
                              backgroundColor: controller.isEmptyFeild
                                  ? AppColors.grey.withOpacity(0.6)
                                  : AppColors.primary,
                              isLoading: controller.isLoading,
                              onPressed: () => controller.onTappedResetPass(),
                            ),
                          ),
                          30.sH,
                          /* SignHere(
                            AppStrings.dontHaACC.tr,
                            text2: AppStrings.signUpHe.tr,
                            onTap: () =>
                                Get.offNamed(RouteHelper.getRegister()),
                          ), */
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

/* import 'package:flutter/cupertino.dart';

import '/index.dart';
 */
class TextFormResetBody extends StatelessWidget {
  const TextFormResetBody({super.key, required this.controller});
  final ForgetPasswordControllerImp controller;

  @override
  Widget build(BuildContext context) {
    return Form(
      onChanged: () => controller.onChangedResetPass(),
      child: Column(
        children: [
          TextInputWidget(
            AppStrings.password.tr,
            prefixIcon: Icons.lock_person_outlined,
            type: TextInputType.visiblePassword,
            suffixIcon: controller.suffixIcon,
            controller: controller.password,
            suffixIconColor: !controller.isPassword
                ? AppColors.awsmMedium
                : AppColors.primary.withOpacity(.5),
            isPassword: controller.isPassword,
            onPressed: controller.hiddenPassword,
            validator: (val) => GetUtils.isLengthGreaterThan(val, 7)
                ? null
                : 'The password field is required.',
          ),
          10.sH,
          TextInputWidget(
            "Confairm Password".tr,
            prefixIcon: Icons.lock_person_outlined,
            type: TextInputType.visiblePassword,
            controller: controller.passwordRe,
            suffixIconColor: !controller.isPasswordRe
                ? AppColors.awsmMedium
                : AppColors.primary.withOpacity(0.5),
            suffixIcon: controller.suffixIconRe,
            isPassword: controller.isPasswordRe,
            onPressed: () => controller.hiddenPasswordRe(),
            validator: (val) =>
                controller.password.text == controller.passwordRe.text
                    ? null
                    : 'confiairm password must equal password',
          ),
        ],
      ),
    );
  }
}
