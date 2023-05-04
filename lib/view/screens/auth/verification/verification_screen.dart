import '/index.dart';

class VerificationCodeScreen extends StatelessWidget {
  const VerificationCodeScreen(
      {Key? key, this.yourEmail, required this.controller})
      : super(key: key);
  final dynamic controller;
  final String? yourEmail;
  @override
  Widget build(BuildContext context) {
    final String phone = Get.arguments;

    String? val;
    return Scaffold(
        bottomNavigationBar: Padding(
          padding: paddingSymme(horizontal: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AbsorbPointer(
                absorbing: controller.isEmptyFeild,
                child: BtnWidget(
                  AppStrings.confirm.tr,
                  fontSize: 18.weight,
                  width: double.infinity,
                  height: 50.height,
                  backgroundColor: controller.isEmptyFeild
                      ? AppColors.grey.withOpacity(0.6)
                      : AppColors.primary,
                  isLoading: controller.isLoading,
                  onPressed: () => controller.onTappedVerifyCode(val!),
                ),
              ),
              50.sH,
            ],
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: paddingSymme(horizontal: 20),
              child: Form(
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
                        // authController.smsCode = code;
                      },
                      onChanged: (value) {
                        val = value;
                        debugPrint("----------------> $value");
                      },
                      // authController: authController
                    ),
                    10.sH,
                    TextWidget(
                      "00:30",
                      color: AppColors.primary,
                      fontSize: 16.weight,
                      fontWeight: FontWeight.bold,
                    ),
                    // 20.sH,
                    TextButton(
                      onPressed: () {
                        // => AuthController.to.onTappedReSendOTPCode()
                      },
                      child: TextWidget(
                        "Resend Code",
                        color: AppColors.awsm,
                        fontSize: getProportionateScreenWidth(16.0),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}