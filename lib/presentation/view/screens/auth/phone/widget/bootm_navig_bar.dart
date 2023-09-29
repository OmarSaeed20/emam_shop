import '/index.dart';

class PhBottomNavigationBar extends StatelessWidget {
  const PhBottomNavigationBar({super.key, required this.controller});
  final PhoneControllerImp controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingSymme(horizontal: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AbsorbPointer(
            absorbing: controller.isEmptyFeild,
            child: BtnWidget(
              AppStrings.signin.tr,
              fontSize: 18.weight,
              width: double.infinity,
              height: 50.height,
              backgroundColor: controller.isEmptyFeild
                  ? AppColors.grey.withOpacity(0.6)
                  : AppColors.primary,
              onPressed: () => controller.onTappedSignWithphone(controller),
            ),
          ),
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
  }
}
