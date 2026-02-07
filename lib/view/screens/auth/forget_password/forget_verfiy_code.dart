import '/index.dart';

class ForgetVerifyCodeScreen extends StatefulWidget {
  const ForgetVerifyCodeScreen({Key? key}) : super(key: key);

  @override
  State<ForgetVerifyCodeScreen> createState() => _ForgetVerifyCodeScreenState();
}

class _ForgetVerifyCodeScreenState extends State<ForgetVerifyCodeScreen> {
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
                        debugPrint("----------------> $value");
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
                        child: TextWidget(
                          "Resend Code",
                          color: controller.isCountdownFinish == true
                              ? AppColors.primary
                              : AppColors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    50.sH
                  ],
                ),
              ),
            )),
      ),
    ));
  }
}
