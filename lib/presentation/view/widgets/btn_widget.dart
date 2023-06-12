import '../../../index.dart';

class BtnWidget extends StatelessWidget {
  const BtnWidget(
    this.text, {
    Key? key,
    required this.onPressed,
    this.backgroundColor,
    this.color,
    this.fontSize,
    this.height,
    this.width,
    this.radius,
    this.isAnimation = false,
    this.border,
    this.isLoading = false,
    this.padding, this.fontWeight,
  }) : super(key: key);
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final BorderSide? border;
  final Color? color;
  final double? fontSize;
  final double? height;
  final double? width;
  final double? radius;
  final bool isLoading;
  final bool? isAnimation;
final  FontWeight? fontWeight;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(height ?? 44),
      width: width ?? double.infinity,
      padding: padding,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 6.weight),
          ),
          elevation: 0.0,
          shadowColor: AppColors.trans,
          backgroundColor: backgroundColor ?? AppColors.primary,
          side: border,
        ),
        onPressed: onPressed,
        child: isAnimation == true
            ? isLoading
                ? const Center(child: LoadingWidget())
                : TextWidget(
                    text,
                    color: color ?? AppColors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: getProportionateScreenWidth(fontSize ?? 14),
                  )
                    .animate()
                    .fadeIn(curve: Curves.easeInCirc)
                    .scaleY()
                    .shimmer(delay: 300.ms, colors: <Color>[
                    AppColors.white,
                    const Color(0xff5b0060),
                    const Color(0xff870160),
                    const Color(0xffac255e),
                    const Color(0xffca485c),
                    const Color(0xffe16b5c),
                    const Color(0xfff39060),
                    const Color(0xffffb56b),
                  ])
            : isLoading
                ? const Center(child: LoadingWidget())
                : TextWidget(
                    text,
                    color: color ?? AppColors.white,
                    fontWeight:fontWeight?? FontWeight.w600,
                    fontSize: getProportionateScreenWidth(fontSize ?? 14),
                  ),
      ),
    );
  }
}
