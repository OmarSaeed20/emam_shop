import 'package:flutter/cupertino.dart';

import '/index.dart';

class PhoneScreen extends StatelessWidget {
  const PhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GetBuilder<PhoneControllerImp>(
        builder: (controller) => _bottomNavigationBar(controller),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: GetBuilder<PhoneControllerImp>(
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

_body(PhoneControllerImp controller) => Padding(
      padding: paddingSymme(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: screenPick(
              icon: CupertinoIcons.phone,
              text: AppStrings.phoneNum.tr,
            ),
          ),
          30.sH,
          authTitle("set your ${AppStrings.phone.tr} !"),
          10.sH,
          TextFormSignPhoneBody(controller: controller),
          20.sH
        ],
      ),
    );

_bottomNavigationBar(PhoneControllerImp controller) => Padding(
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
              isLoading: controller.isLoading,
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
