import '../../../../index.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class AnimatedBtn extends StatelessWidget {
  const AnimatedBtn(
    this.text, {
    Key? key,
    required this.onTap,
    this.textColo,
    this.color,
    this.fontSize,
    this.height,
    this.width,
    this.radius,
    this.border,
    this.isLoading = false,
    this.padding,
    this.fontWeight,
    this.icon, this.margin,
  }) : super(key: key);
  final String text;
  final VoidCallback onTap;
  final Color? textColo;
  final BorderSide? border;
  final Color? color;
  final double? fontSize;
  final double? height;
  final double? width;
  final double? radius;
  final bool isLoading;
  final IconData? icon;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? paddingOnly(),
      child: AnimatedButton(
        text: text,
        buttonTextStyle: TextStyle(
          fontSize: (fontSize ?? 14).weight,
          fontWeight: fontWeight ?? FontWeight.w400,
          color: textColo ?? AppColors.white,
        ),
        borderRadius: BorderRadius.circular((radius ?? 6.0).weight),
        color: color ?? AppColors.primary,
        height: (height ?? 40).height,
        width: width ?? double.infinity,
        icon: icon,
        pressEvent: onTap,
      ),
    );
  }
}
