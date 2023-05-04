import '/index.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WillPopScope(
      onWillPop: alertExitApp,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: paddingSymme(horizontal: 16),
            child: Column(
              children: [
                70.sH,
                const TextWidget(
                  "EMAM",
                  fontWeight: FontWeight.w700,
                  fontSize: 45,
                  fontFamily: AppStrings.montserrat,
                ),
                80.sH,
                GetBuilder<SignUpControllerImp>(
                  builder: (controller) => SignWithBody(controller: controller),
                ),
                45.sH,
                SignHere(
                  AppStrings.dontHaACC.tr,
                  text2: AppStrings.signUpHe.tr,
                  onTap: () => Get.toNamed(RouteHelper.getRegister()),
                ),
                20.sH,
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
