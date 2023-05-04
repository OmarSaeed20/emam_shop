import 'package:flutter/cupertino.dart';

import '/index.dart';

class TextFormSignInBody extends StatelessWidget {
  const TextFormSignInBody({super.key, required this.controller});

  final SignInControllerImp controller;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.signinForm,
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
            validator: (val) => valiedInput(val:val!, InputType.email),
          ),
          10.sH,
          TextInputWidget(
            AppStrings.password.tr,
            prefixIcon: Icons.password,
            type: TextInputType.visiblePassword,
            suffixIcon: controller.suffixIcon,
            controller: controller.password,
            suffixIconColor: !controller.isPassword
                ? AppColors.darkblu
                : AppColors.primary.withOpacity(.5),
            isPassword: controller.isPassword,
            onPressed: controller.hiddenPassword,
            validator: (val) =>
                valiedInput(val:val!, max: 20, min: 8, InputType.password1),
          ),
        ],
      ),
    );
  }
}
