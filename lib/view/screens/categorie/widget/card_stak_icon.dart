import '../../../../index.dart';

GestureDetector cardStakIcon(
    IconData? icon, {
    required void Function() onTap,
  }) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
            padding: paddingSymme(horizontal: 3, vertical: 3),
            decoration: BoxDecoration(
              color: AppColors.cardColor1,
              borderRadius: BorderRadius.circular(20.height),
            ),
            child: Icon(icon, color: AppColors.black)),
      );