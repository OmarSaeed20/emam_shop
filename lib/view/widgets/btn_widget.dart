import '../../index.dart';

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
  }) : super(key: key);
  final String text;

  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? color;
  final double? fontSize;
  final double? height;
  final double? width;
  final double? radius;
  final bool? isAnimation;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? getProportScrHeight(45),
      width: width ?? Dimensions.screenWidth,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 10),
          ),
          elevation: 0.0,
          shadowColor: AppColors.trans,
          backgroundColor: backgroundColor ?? AppColors.primaryColor,
        ),
        onPressed: onPressed,
        child: isAnimation == true
            ? TextWidget(
                text,
                color: color ?? AppColors.white,
                fontWeight: FontWeight.w600,
                fontSize: fontSize ?? getProportionateScreenWidth(16),
              )
            //   .animate()
            //   .fadeIn(curve: Curves.easeInCirc)
            //   .scaleY()
            //   .shimmer(delay: 300.ms, colors: <Color>[
            //   AppColors.white,
            //   const Color(0xff5b0060),
            //   const Color(0xff870160),
            //   const Color(0xffac255e),
            //   const Color(0xffca485c),
            //   const Color(0xffe16b5c),
            //   const Color(0xfff39060),
            //   const Color(0xffffb56b),
            // ])
            : TextWidget(
                text,
                color: color ?? AppColors.white,
                // fontWeight: FontWeight.w600,
                fontSize: fontSize ?? getProportionateScreenWidth(16),
              ),
      ),
    );
  }
}

Widget textBtn(String? text, {void Function()? onTap}) => TextButton(
    onPressed: onTap,
    child: TextWidget(
      text!,
      fontWeight: FontWeight.w700,
    ));
