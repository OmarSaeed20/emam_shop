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
      key: widget.controller.resetForm,
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
                ? AppColors.awsm
                : AppColors.primary.withOpacity(.5),
            isPassword: widget.controller.isPassword,
            onPressed: widget.controller.hiddenPassword,
            validator: (val) =>
                valiedInput(val: val!, max: 20, min: 7, InputType.password1),
          ),
          10.sH,
          TextInputWidget(
            "Confairm Password".tr,
            prefixIcon: Icons.lock_person_outlined,
            type: TextInputType.visiblePassword,
            controller: widget.controller.passwordRe,
            suffixIconColor: !widget.controller.isPasswordRe
                ? AppColors.awsm
                : AppColors.primary.withOpacity(0.5),
            suffixIcon: widget.controller.suffixIconRe,
            isPassword: widget.controller.isPasswordRe,
            onPressed: () => widget.controller.hiddenPasswordRe(),
            validator: (val) => valiedInput(
              InputType.password2,
              val: widget.controller.password.text,
              val2: val!,
            ),
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
