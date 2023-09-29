import '/index.dart';

class SignWithBody extends StatelessWidget {
  const SignWithBody({super.key, required this.controller});
  final SignUpControllerImp controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _socialContainer(
          AppStrings.google.tr,
          img: AppImages.google,
          onTap: () => controller.signWithGoogle(),
        ),
        15.sH,
        _socialContainer(
          AppStrings.facebock.tr,
          img: AppImages.facebook,
          onTap: () => controller.signWithFacebook(),
        ),
        15.sH,
        // if (GetPlatform.isIOS)
        _socialContainer(
          AppStrings.apple.tr,
          icon: Icons.apple,
          color: AppColors.black,
          onTap: () => controller.signWithApple(),
          isImg: false,
        ),
        30.sH,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [_divider(), TextWidget(AppStrings.or.tr), _divider()],
        ),
        35.sH,
        _socialContainer(
          AppStrings.conWiPHo.tr,
          onTap: () => Get.toNamed(RouteHelper.getPhoneNumber()),
          isSocil: false,
        ),
        15.sH,
        AnimatedBtn(
          AppStrings.conToSigin.tr,
          color: AppColors.primary,
          textColo: AppColors.white,
          onTap: () => Get.toNamed(RouteHelper.getLogin()),
          height: 55.height,
          margin: paddingSymme(horizontal: 25),
        ),
      ],
    );
  }
}

Container _divider() =>
    Container(color: AppColors.grey, height: 1.height, width: 100.weight);

_socialContainer(
  String text, {
  required void Function() onTap,
  IconData? icon,
  String? img,
  Color? color,
  Color? cardColor,
  Color? textColo,
  bool? isSocil = true,
  bool? isImg = true,
}) =>
    Container(
      // width: Dimensions.screenWidth - 50,
      margin: paddingSymme(horizontal: 25),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.weight)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6.weight),
        child: MaterialButton(
          height: 55.height,
          // style: ButtonStyle(backgroundColor: cardColor?!),
          color: cardColor ?? AppColors.grey200,
          elevation: 5,
          onPressed: onTap,
          child: isSocil == true
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    isImg == true
                        ? Image.asset(img!, height: 20.height)
                        : Icon(icon, color: color, size: 24.height),
                    25.sW,
                    TextWidget(
                      "${AppStrings.signWith.tr} $text",
                      color: textColo,
                    )
                  ],
                )
              : Center(child: TextWidget(text, color: textColo)),
        ),
      ),
    );
