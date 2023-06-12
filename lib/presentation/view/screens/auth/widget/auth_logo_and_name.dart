import '/index.dart';

class AuthLogoWidegt extends StatelessWidget {
  const AuthLogoWidegt({super.key, this.title, this.fonSiz});
  final String? title;
  final double? fonSiz;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          AppImages.emamLogoWithout,
          height: 130.height,
          width: 150.weight,
          fit: BoxFit.fill,
          color: AppColors.primary,
        ),
        TextWidget(
          title ?? "EMAM",
          fontSize: fonSiz ?? 35,
          fontWeight: FontWeight.w600,
          color: AppColors.awsm,
          fontFamily: AppStrings.montserrat,
        )
      ],
    );
  }
}
