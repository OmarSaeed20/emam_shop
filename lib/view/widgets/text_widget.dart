import '/index.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
    this.text, {
    Key? key,
    this.fontSize,
    this.decoration,
    this.spacing,
    this.color,
    this.overFlow,
    this.height,
    this.locale,
    this.textAlign,
    this.fontFamily,
    this.maxLines,
    this.fontWeight,
  }) : super(key: key);
  final String text;
  final String? fontFamily;
  final TextDecoration? decoration;
  final double? fontSize;
  final Locale? locale;
  final double? spacing;
  final Color? color;
  final TextOverflow? overFlow;
  final double? height;
  final int? maxLines;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overFlow,
      maxLines: maxLines,
      textAlign: textAlign,
      locale:locale ,
      style: TextStyle(
        fontSize: getProportionateScreenWidth(fontSize ?? 16),
        letterSpacing: spacing,
        color: color ?? AppColors.black,
        height: height,
        fontWeight: fontWeight ?? FontWeight.w500,
        decoration: decoration,
        fontFamily: fontFamily,
      ),
    );
  }
}
