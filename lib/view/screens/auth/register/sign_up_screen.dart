import '/index.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GetBuilder<SignUpControllerImp>(
        builder: (controller) => _bottomNavigationBar(controller),
      ),
      /* extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: const IconAndTextBack(),
        leadingWidth: 120.weight,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ), */
      body: SafeArea(
        child: SingleChildScrollView(
          child: GetBuilder<SignUpControllerImp>(
            builder: (controller) {
              return SizedBox(
                  // padding: paddingSymme(horizontal: 25),
                  width: double.infinity,
                  child: Column(
                    children: [const IconAndTextBack(), _body(controller)],
                  ));
            },
          ),
        ),
      ),
    );
  }
}

_body(SignUpControllerImp controller) => Padding(
      padding: paddingSymme(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: AuthLogoWidegt(title: AppStrings.signup.tr)),
          15.sH,
          authTitle(AppStrings.signupTit.tr),
          15.sH,
          TextFormSignUpBody(controller: controller),
          20.sH
        ],
      ),
    );
    
_bottomNavigationBar(SignUpControllerImp controller) => Padding(
      padding: paddingSymme(horizontal: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AbsorbPointer(
            absorbing: controller.isEmptyFeild,
            child: BtnWidget(
              AppStrings.signup.tr,
              fontSize: 18.weight,
              height: 50.height,
              width: double.infinity,
              backgroundColor: controller.isEmptyFeild
                  ? AppColors.grey.withOpacity(0.6)
                  : AppColors.primary,
              isLoading: controller.isLoading,
              onPressed: () => controller.onTappedSignUp(controller),
            ),
          ),
          15.sH,
          SignHere(
            AppStrings.alreHaACC.tr,
            text2: AppStrings.signInHe.tr,
            onTap: () => Get.offNamed(RouteHelper.getLogin()),
          ),
          20.sH,
        ],
      ),
    );
