import '/index.dart';

class VerifyForgetScreen extends StatefulWidget {
  const VerifyForgetScreen({Key? key}) : super(key: key);

  @override
  State<VerifyForgetScreen> createState() => _VerifyForgetScreenState();
}

class _VerifyForgetScreenState extends State<VerifyForgetScreen> {
  @override
  void dispose() {
    ForgetPasswordControllerImp.to.timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String email = Get.arguments["email"];
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
                    verfiyScreenHeader(email),
                    60.sH,
                    CustomPinCodeField(
                      onCompleted: (code) {
                        debugPrint("-------Codddde------> $code");
                        controller.onTappedVerifyCode(email, code);
                      },
                      onChanged: (value) {
                        controller.val = value;
                        debugPrint("----verfiy forget-----> $value");
                      },
                    ),
                    10.sH,
                    TextWidget(
                      "00:${controller.countdown}",
                      color: AppColors.awsm,
                      fontWeight: FontWeight.bold,
                    ),
                    if (controller.isCountdownFinish)
                      TextButton(
                        onPressed: () => controller.onCountdownFinish(email),
                        child: const TextWidget(
                          "Resend Code",
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ).animate().scaleY()
                    else
                      const TextWidget(
                        "Resend Code",
                        color: AppColors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    50.sH
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
