import 'package:flutter/cupertino.dart';

import '/index.dart';

class TextFormSignUpBody extends StatefulWidget {
  const TextFormSignUpBody({super.key, required this.controller});
  final SignUpControllerImp controller;

  @override
  State<TextFormSignUpBody> createState() => _TextFormSignUpBodyState();
}

class _TextFormSignUpBodyState extends State<TextFormSignUpBody> {
  @override
  void dispose() {
    widget.controller.name.clear();
    widget.controller.phone.clear();
    widget.controller.email.clear();
    widget.controller.password.clear();
    widget.controller.isPassword != false;
    widget.controller.suffixIcon = CupertinoIcons.eye;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      onChanged: () => widget.controller.onChangedSignUp(),
      child: Column(
        children: [
          TextInputWidget(
            AppStrings.name.tr,
            prefixIcon: Icons.person_outline,
            type: TextInputType.name,
            controller: widget.controller.name,
            suffixIconColor: GetUtils.isUsername(widget.controller.name.text)
                ? Colors.green.shade600
                : AppColors.grey,
            suffixIcon: CupertinoIcons.checkmark_alt_circle_fill,
            validator: (val) =>
                GetUtils.isUsername(widget.controller.name.text) &&
                        GetUtils.isBlank(val!) != true
                    ? null
                    : 'The name field is required.',
          ),
          10.sH,
          TextInputWidget(
            AppStrings.phone.tr,
            prefixIcon: Icons.phone_android_sharp,
            type: TextInputType.phone,
            controller: widget.controller.phone,
            suffixIconColor:
                GetUtils.isLengthEqualTo(widget.controller.phone.text, 11) ==
                        true
                    ? Colors.green.shade600
                    : AppColors.grey,
            suffixIcon: CupertinoIcons.checkmark_alt_circle_fill,
            validator: (val) => GetUtils.isLengthEqualTo(val, 11)
                ? null
                : 'The phone field is required.',
          ),
          10.sH,
          TextInputWidget(
            AppStrings.email.tr,
            prefixIcon: Icons.alternate_email_rounded,
            type: TextInputType.emailAddress,
            controller: widget.controller.email,
            suffixIconColor:
                GetUtils.isEmail(widget.controller.email.text) == true
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
            suffixIcon: widget.controller.suffixIcon,
            controller: widget.controller.password,
            suffixIconColor: !widget.controller.isPassword
                ? AppColors.primary2
                : AppColors.primary.withOpacity(.5),
            isPassword: widget.controller.isPassword,
            onPressed: widget.controller.hiddenPassword,
            validator: (val) => GetUtils.isLengthGreaterThan(val, 8)
                ? null
                : 'The password field is required.',
          ),
        ],
      ),
    );
  }
}
