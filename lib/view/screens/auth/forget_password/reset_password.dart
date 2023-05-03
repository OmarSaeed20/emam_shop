import 'package:flutter/cupertino.dart';

import '/index.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

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
                  onTap: () => Get.toNamed(RouteHelper.getForgetPass()),
                ),
              ),
              GetBuilder<ForgetPasswordControllerImp>(
                builder: (controller) {
                  return Container(
                      padding: paddingSymme(horizontal: 25),
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
              "Save".tr,
              fontSize: 18.weight,
              width: double.infinity,
              height: 50.height,
              backgroundColor: controller.isEmptyFeild
                  ? AppColors.grey.withOpacity(0.6)
                  : AppColors.primary,
              isLoading: controller.isLoading,
              onPressed: () => controller.onTappedResetPass(),
            ),
          ),
          50.sH,
        ],
      ),
    );
