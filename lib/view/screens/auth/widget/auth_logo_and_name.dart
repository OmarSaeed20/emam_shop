import '/index.dart';

class AuthLogoWidegt extends StatelessWidget {
  const AuthLogoWidegt({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          AppImages.emamLogoWithout,
          height: 120.height,
          width: 150.weight,
        ),
        const TextWidget(
          "EMAM",
          fontSize: 35,
          fontWeight: FontWeight.w600,
          fontFamily: AppStrings.montserrat,
        ),
      ],
    );
  }
}
