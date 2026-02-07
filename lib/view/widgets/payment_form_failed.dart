import '/index.dart';

class PaymentTextInputWidget extends StatelessWidget {
  const PaymentTextInputWidget(
    this.hintText, {
    Key? key,
    this.controller,
    this.type,
    this.isPassword = false,
    this.onChanged,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.onPressed,
    this.val,
    this.suffixIconColor,
    this.fontSize,
  }) : super(key: key);
  final TextEditingController? controller;
  final TextInputType? type;
  final String? hintText;
  final bool isPassword;
  final IconData? prefixIcon;
  final double? fontSize;
  final IconData? suffixIcon;
  final Color? suffixIconColor;
  final VoidCallback? onPressed;
  final Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final String? val;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(4),
          ),
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            initialValue: val,
            controller: controller,
            keyboardType: type ?? TextInputType.text,
            obscureText: isPassword,
            onChanged: onChanged,
            validator: validator,
            cursorColor: AppColors.black,
            style: TextStyle(
                color: AppColors.black, fontSize: fontSize ?? 16.weight),
            decoration: InputDecoration(
              contentPadding: paddingOnly(left: 10, top: 15, bottom: 15),
              hintText: hintText,
              hintStyle: TextStyle(color: AppColors.grey, fontSize: 12.weight),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(width: 0, color: AppColors.grey),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                // borderSide: const BorderSide(),
                borderSide: const BorderSide(width: 0, color: AppColors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(width: 0, color: AppColors.awsm),
              ),
              filled: true,
              fillColor: AppColors.white,
            ),
          ),
        ),
      ],
    );
  }
}
