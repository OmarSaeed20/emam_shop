import '/index.dart';

class TextInputWidget extends StatelessWidget {
  const TextInputWidget(
    this.title, {
    Key? key,
    this.controller,
    this.type,
    this.hintText,
    this.isPassword = false,
    this.onChanged,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.onPressed,
    this.val,
    this.suffixIconColor, this.fontSize,
  }) : super(key: key);
  final TextEditingController? controller;
  final TextInputType? type;
  final String? title;
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
        TextWidget(
          '$title',
          fontSize: 14.weight,
          fontWeight: FontWeight.w500,
          fontFamily: AppStrings.montserrat,
        ),
        10.sH,
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(4),
            // boxShadow: AppConstants.boxShadow,
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
            style: TextStyle(color: AppColors.black, fontSize: fontSize?? 16.weight),
            decoration: InputDecoration(
              contentPadding: EdgeInsetsDirectional.fromSTEB(
                  10.weight, 15.height, 0.0, 15.weight),
              hintText: hintText ?? title,
              hintStyle: TextStyle(
                  color: AppColors.grey.withOpacity(0.6), fontSize: 12.weight),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(width: .5.weight, color: AppColors.grey),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(width: .5.weight, color: AppColors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide:
                    BorderSide(width: 1.5.weight, color: AppColors.awsm),
              ),
              filled: true,
              fillColor: AppColors.white,
              prefixIcon: prefixIcon != null
                  // ignore: avoid_unnecessary_containers
                  ? Container(
                      // height: 5.height,
                      // width: 15.weight,
                      // decoration: BoxDecoration(
                      //   borderRadius: BorderRadius.circular(10.weight),
                      //   color: AppColors.primary.withOpacity(.2),
                      // ),
                      child: Icon(
                        prefixIcon,
                        size: 20.height,
                        color: AppColors.primary,
                      ),
                    )
                  : null,
              suffixIcon: suffixIcon != null
                  ? IconButton(
                      onPressed: onPressed,
                      icon: Icon(
                        suffixIcon,
                        color: suffixIconColor ?? AppColors.black,
                      ),
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
