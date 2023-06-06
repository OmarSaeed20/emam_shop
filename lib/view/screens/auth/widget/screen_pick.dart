import '/index.dart';
screenPick({required IconData icon, required String text}) => Column(
      children: [
        Icon(icon, size: 100.height, color: AppColors.primary),
        10.sH,
        TextWidget(
          text,
          fontSize: 25,
          fontWeight: FontWeight.w600,
          fontFamily: AppStrings.montserrat,
        )
      ],
    );