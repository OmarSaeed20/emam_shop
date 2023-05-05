import '/index.dart';

class VerifyCodeSignupScreen extends StatelessWidget {
  const VerifyCodeSignupScreen({
    Key? key,
    // this.yourEmail,
  }) : super(key: key);
  // final String? yourEmail;
  @override
  Widget build(BuildContext context) {
    final String phone = Get.arguments;
    return Scaffold(
        /*  bottomNavigationBar: Padding(
          padding: paddingSymme(horizontal: 30),
          child: GetBuilder<SignUpControllerImp>(
            builder: (controller) => _bottomNavi(controller, val),
          ),
        ), */
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
            padding: paddingSymme(horizontal: 20),
            child: GetBuilder<SignUpControllerImp>(
              builder: (controller) => Form(
                key: controller.form,
                child: Column(
                  children: [
                    40.sH,
                    screenPick(
                      icon: Icons.hourglass_empty_rounded,
                      text: AppStrings.verificationCode.tr,
                    ),
                    40.sH,
                    TextWidget(
                      AppStrings.otpsent.tr,
                      color: AppColors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                    TextWidget(
                      phone,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.weight,
                      color: AppColors.awsm,
                    ),
                    60.sH,
                    CustomPinCodeField(
                      onCompleted: (code) {
                        debugPrint("-------Codddde------> $code");
                        controller.onTappedVerifyCode(code);
                      },
                      onChanged: (value) =>
                          debugPrint("----------------> $value"),
                    ),
                    10.sH,
                    TextWidget(
                      "00:30",
                      color: AppColors.primary,
                      fontSize: 16.weight,
                      fontWeight: FontWeight.bold,
                    ),
                    TextButton(
                      onPressed: () {
                        // Get.back();
                        // => AuthController.to.onTappedReSendOTPCode()
                      },
                      child: TextWidget(
                        "Resend Code",
                        color: AppColors.awsm,
                        fontSize: 16.weight,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    ));
  }

  Column _bottomNavi(SignUpControllerImp controller, String? val) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        BtnWidget(
          AppStrings.confirm.tr,
          fontSize: 16.weight,
          height: 50.height,
          onPressed: () => controller.onTappedVerifyCode(val!),
        ),
        50.sH,
      ],
    );
  }
}
