import '/index.dart';

Align authTitle(
  String title, {
  double? fonSiz,
  FontWeight? fontWeight,
  Color? color,
  AlignmentGeometry? alignment,
}) =>
    Align(
      alignment: MyLocaleControllerImp.to.themeData == themeAR
          ? alignment ?? Alignment.centerRight
          : alignment ?? Alignment.centerLeft,
      child: TextWidget(
        title,
        fontSize: fonSiz ?? 16,
        fontWeight: fontWeight ?? FontWeight.w600,
        color: color ?? AppColors.grey,
      ),
    );
