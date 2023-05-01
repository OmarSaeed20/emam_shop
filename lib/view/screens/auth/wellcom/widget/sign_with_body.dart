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
          color: Colors.red,
          onTap: () => controller.signWithGoogle(),
        ),
        15.sH,
        _socialContainer(
          AppStrings.facebock.tr,
          img: AppImages.facebook,
          color: Colors.blueAccent,
          onTap: () => controller.signWithFacebook(),
        ),
        15.sH,
        // if (GetPlatform.isIOS)
          _socialContainer(
            AppStrings.apple.tr,
            icon: Icons.apple,
            onTap: () => controller.signWithApple(),
            isImg: false,
          ),
        30.sH,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [_divider(), const TextWidget(AppStrings.or), _divider()],
        ),
        35.sH,
        _socialContainer(
          AppStrings.conWiPHo.tr,
          onTap: () => Get.toNamed(RouteHelper.getPhoneNumber()),
          isSocil: false,
        ),
        15.sH,
        _socialContainer(
          AppStrings.conToSigin.tr,
          cardColor: AppColors.primary,
          textColo: AppColors.white,
          onTap: () => Get.toNamed(RouteHelper.getLogin()),
          isSocil: false,
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
    InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 55.height,
        width: Dimensions.screenWidth - 50,
        child: Card(
          color: cardColor,
          elevation: 2,
          child: Padding(
            padding: paddingSymme(horizontal: 35),
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
      ),
    );
