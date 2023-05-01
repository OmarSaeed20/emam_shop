import '/index.dart';

class VerificationCodeScreen extends StatelessWidget {
  const VerificationCodeScreen({Key? key, this.yourEmail}) : super(key: key);
  final String? yourEmail;
  @override
  Widget build(BuildContext context) {
    final String phone = Get.arguments;

    String? val;
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: paddingSymme(horizontal: 20),
        child: Column(
          children: [
            30.sH,
            Image.asset(
              AppImages.password,
              height: 150.height,
              color: AppColors.secondaryColor,
            ),
            40.sH,
            TextWidget(
              AppStrings.verificationCode.tr,
              fontSize: 24.weight,
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
            10.sH,
            TextWidget(
              AppStrings.otpsent.tr,
              color: AppColors.grey,
              fontWeight: FontWeight.w600,
            ),
            TextWidget(
              phone,
              fontWeight: FontWeight.bold,
              fontSize: 14.weight,
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
            40.sH,
            BtnWidget(
              AppStrings.confirm.tr,
              width: 300.weight,
              onPressed: () {
                // => AuthController.to.onTappedVerifyCode(val!)
              },
            ),
            10.sH,
            /* Center(
                child: Column(children: [
              TextButton(
                onPressed: () => AuthController.to.onTappedReSendOTPCode(),
                child: TextWidget(
                  AppStrings.resendCode.tr,
                  color: AppColors.primaryDeep,
                  fontSize: getProportionateScreenWidth(16.0),
                  fontWeight: FontWeight.bold,
                ),
              ), 
              5.sH,
              TextWidget(
                "AppStrings.otpTime.tr",
                fontSize: getProportionateScreenWidth(16.0),
                fontWeight: FontWeight.bold,
              )
            ]))*/
          ],
        ),
      ),
    ));
  }
}
