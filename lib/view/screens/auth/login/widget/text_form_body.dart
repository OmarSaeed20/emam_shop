import 'package:flutter/cupertino.dart';

import '/index.dart';

class TextFormSignInBody extends StatelessWidget {
  const TextFormSignInBody({super.key, required this.controller});

  final SignInControllerImp controller;

  @override
  Widget build(BuildContext context) {
    return Form(
      onChanged: () => controller.onChangedSignIn(),
      child: Column(
        children: [
          TextInputWidget(
            AppStrings.email.tr,
            prefixIcon: Icons.alternate_email_rounded,
            type: TextInputType.emailAddress,
            controller: controller.email,
            suffixIconColor: GetUtils.isEmail(controller.email.text) == true
                ? Colors.green.shade600
                : AppColors.grey,
            suffixIcon: CupertinoIcons.checkmark_alt_circle_fill,
            validator: (val) =>
                GetUtils.isEmail('$val') ? null : 'The email is not valid.',
          ),
          10.sH,
          TextInputWidget(
            AppStrings.password.tr,
            prefixIcon: Icons.password,
            type: TextInputType.visiblePassword,
            suffixIcon: controller.suffixIcon,
            controller: controller.password,
            suffixIconColor: !controller.isPassword
                ? AppColors.primary2
                : AppColors.primary.withOpacity(.5),
            isPassword: controller.isPassword,
            onPressed: controller.hiddenPassword,
            validator: (val) => GetUtils.isLengthGreaterThan(val, 8)
                ? null
                : 'The password field is required.',
          ),
        ],
      ),
    );
  }
}
