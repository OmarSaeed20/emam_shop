import '/index.dart';

class TextInputWidget extends StatelessWidget {
  const TextInputWidget(
    this.title, {
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
  }) : super(key: key);
  final TextEditingController? controller;
  final TextInputType? type;
  final String? title;
  final bool isPassword;
  final IconData? prefixIcon;
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
            style: TextStyle(
              color: AppColors.black,
              fontSize: getProportionateScreenWidth(16),
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsetsDirectional.fromSTEB(
                  10.weight, 15.height, 0.0, 15.weight),
              hintText: title,
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
                    BorderSide(width: 1.5.weight, color: AppColors.primary),
              ),
              filled: true,
              fillColor: AppColors.white,
              prefixIcon: prefixIcon != null
                  ? IconButton(
                      onPressed: onPressed,
                      icon: Icon(
                        prefixIcon,
                        size: 20.height,
                        color: AppColors.awsmMedium,
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
