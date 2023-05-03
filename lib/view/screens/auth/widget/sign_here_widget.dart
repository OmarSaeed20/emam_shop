import '/index.dart';

class SignHere extends StatelessWidget {
  const SignHere(
    this.text, {
    super.key,
    required this.text2,
    required this.onTap,
  });

  final String text;
  final String text2;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextWidget(text, fontWeight: FontWeight.w400),
        InkWell(
          onTap: onTap,
          child: TextWidget(
            text2,
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: AppColors.awsmMedium,
            decoration: TextDecoration.underline,
          ),
        ),
      ],
    );
  }
}
