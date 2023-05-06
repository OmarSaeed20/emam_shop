import '/index.dart';

class ForgetVerifyCodeScreen extends StatelessWidget {
  const ForgetVerifyCodeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final String phone = Get.arguments;
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
            padding: paddingSymme(horizontal: 20),
            child: GetBuilder<ForgetPasswordControllerImp>(
              builder: (controller) => Form(
                key: controller.form,
                onChanged: () => controller.onChangedVerfiy(),
                child: Column(
                  children: [
                    40.sH,
                    verfiyScreenHeader(phone),
                    60.sH,
                    CustomPinCodeField(
                      onCompleted: (code) {
                        debugPrint("-------Codddde------> $code");
                        controller.onTappedVerifyCode(code);
                      },
                      onChanged: (value) {
                        controller.val = value;
                        debugPrint("----------------> $value");
                      },
                    ),
                    10.sH,
                    TextWidget(
                      "00:${controller.countdown}",
                      color: AppColors.awsm,
                      fontWeight: FontWeight.bold,
                    ),
                    TextButton(
                      onPressed: () => controller.onCountdownFinish(),
                      child: TextWidget(
                        "Resend Code",
                        color: controller.isCountdownFinish == true
                            ? AppColors.primary
                            : AppColors.grey,
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
}

verfiyScreenHeader(String email) => Column(
      children: [
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
          email,
          fontWeight: FontWeight.bold,
          fontSize: 12.weight,
          color: AppColors.awsm,
        ),
      ],
    );
