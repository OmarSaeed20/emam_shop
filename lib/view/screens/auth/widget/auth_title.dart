import '/index.dart';

Align authTitle(
  String title, {
  double? fonSiz,
  FontWeight? fontWeight,
  Color? color,
}) =>
    Align(
      alignment: Alignment.centerLeft,
      child: TextWidget(
        title,
        fontSize: fonSiz ?? 16,
        fontWeight: fontWeight ?? FontWeight.w600,
        color: color?? AppColors.grey,
      ),
    );
