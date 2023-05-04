import '/index.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GetBuilder<SignInControllerImp>(
        builder: (controller) => _bottomNavigationBar(controller),
      ),
      body: SafeArea(
        child: SingleChildScrollView(child: GetBuilder<SignInControllerImp>(
          builder: (controller) {
            return SizedBox(
                width: double.infinity,
                child: Column(
                  children: [const IconAndTextBack(), _body(controller)],
                ));
          },
        )),
      ),
    );
  }
}

_body(SignInControllerImp controller) => Padding(
      padding: paddingSymme(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: AuthLogoWidegt(title: AppStrings.signin.tr)),
          30.sH,
          authTitle(AppStrings.welcomeBack.tr),
          10.sH,
          TextFormSignInBody(controller: controller),
          20.sH,
          Align(
            alignment: MyLocaleControllerImp.to.themeData == themeEN
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: TextButton(
              onPressed: () => Get.offNamed(RouteHelper.getForgetPass()),
              child: TextWidget(
                AppStrings.forgetPass.tr,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.awsm,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          20.sH,
        ],
      ),
    );

_bottomNavigationBar(SignInControllerImp controller) => Padding(
      padding: paddingSymme(horizontal: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BtnWidget(
            AppStrings.signin.tr,
            fontSize: 18.weight,
            width: double.infinity,
            height: 50.height,
            onPressed: () {
              if (controller.signinForm.currentState!.validate()) {
                popLoading();
                controller.onTappedSignIn();
              }
            },
          ),
          /* AbsorbPointer(
            absorbing: controller.isEmptyFeild,
            child: BtnWidget(
              AppStrings.signin.tr,
              fontSize: 18.weight,
              width: double.infinity,
              height: 50.height,
              backgroundColor: controller.isEmptyFeild
                  ? AppColors.grey.withOpacity(0.6)
                  : AppColors.primary,
              isLoading: controller.isLoading,
              onPressed: () {
                popLoading();
                controller.onTappedSignIn();
              },
            ),
          ), */
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
