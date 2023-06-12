import '../../../../../index.dart';

cartCheckoutListTile(String title, String num,
    {double? fontSize, FontWeight? fontWeight, Color? color}) {
  return SizedBox(
    height: 20.height,
    child: ListTile(
      title: TextWidget(
        title,
        fontSize: fontSize ?? 14.weight,
        fontWeight: fontWeight ?? FontWeight.w600,
        color: color,
      ),
      horizontalTitleGap: 0,
      trailing: TextWidget(
        num,
        fontFamily: AppStrings.montserrat,
        fontWeight: fontWeight ?? FontWeight.w600,
        color: color,
        fontSize: fontSize,
      ),
    ),
  );
}
