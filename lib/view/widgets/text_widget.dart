import '../../index.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
    this.text, {
    Key? key,
    this.fontSize,
    this.spacing,
    this.color,
    this.overFlow,
    this.height,
    this.textAlign,
    this.maxLines,
    this.fontWeight,
  }) : super(key: key);
  final String text;
  final double? fontSize;
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
      style: TextStyle(
        fontSize: getProportionateScreenWidth(fontSize ?? 16),
        letterSpacing: spacing,
        color: color ?? AppColors.black,
        height: height,
        fontWeight: fontWeight ?? FontWeight.w500,
      ),
    );
  }
}
