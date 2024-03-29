import 'package:flutter/cupertino.dart';

import '/index.dart';

class TextFormForgetPassBody extends StatelessWidget {
  const TextFormForgetPassBody({super.key, required this.controller});
  final ForgetPasswordControllerImp controller;

  @override
  Widget build(BuildContext context) {
    return Form(
      onChanged: () => controller.onChangedForgetPass(),
      child: Column(
        children: [
          TextInputWidget(
            AppStrings.forgetPass.tr,
            prefixIcon: Icons.email_outlined,
            type: TextInputType.emailAddress,
            suffixIconColor: controller.isEmptyFeild != true
                ? Colors.green.shade600
                : AppColors.grey,
            suffixIcon: CupertinoIcons.checkmark_alt_circle_fill,
            controller: controller.email,
            validator: (val) =>
                GetUtils.isEmail(val!) ? null : 'The email field is required.',
          ),
        ],
      ),
    );
  }
}
