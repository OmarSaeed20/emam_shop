import '/index.dart';

class TextFormResetBody extends StatefulWidget {
  const TextFormResetBody({super.key, required this.controller});
  final ForgetPasswordControllerImp controller;

  @override
  State<TextFormResetBody> createState() => _TextFormResetBodyState();
}

class _TextFormResetBodyState extends State<TextFormResetBody> {
  @override
  void initState() {
    widget.controller.password != TextEditingController();
    widget.controller.passwordRe != TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      onChanged: () => widget.controller.onChangedResetPass(),
      child: Column(
        children: [
          TextInputWidget(
            AppStrings.password.tr,
            prefixIcon: Icons.lock_person_outlined,
            type: TextInputType.visiblePassword,
            suffixIcon: widget.controller.suffixIcon,
            controller: widget.controller.password,
            suffixIconColor: !widget.controller.isPassword
                ? AppColors.awsmMedium
                : AppColors.primary.withOpacity(.5),
            isPassword: widget.controller.isPassword,
            onPressed: widget.controller.hiddenPassword,
            validator: (val) => GetUtils.isLengthGreaterThan(val, 7)
                ? null
                : 'The password field is required.',
          ),
          10.sH,
          TextInputWidget(
            "Confairm Password".tr,
            prefixIcon: Icons.lock_person_outlined,
            type: TextInputType.visiblePassword,
            controller: widget.controller.passwordRe,
            suffixIconColor: !widget.controller.isPasswordRe
                ? AppColors.awsmMedium
                : AppColors.primary.withOpacity(0.5),
            suffixIcon: widget.controller.suffixIconRe,
            isPassword: widget.controller.isPasswordRe,
            onPressed: () => widget.controller.hiddenPasswordRe(),
            validator: (val) => widget.controller.password.text ==
                    widget.controller.passwordRe.text
                ? null
                : 'confiairm password must equal password',
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    widget.controller.password.clear();
    widget.controller.passwordRe.clear();
    super.dispose();
  }
}
