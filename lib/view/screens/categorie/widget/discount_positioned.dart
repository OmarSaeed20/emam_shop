import '../../../../index.dart';

Positioned discontPositined({required String dic}) {
  return Positioned(
    top: 0,
    right: 0,
    child: Container(
      height: 15.height,
      width: 45.weight,
      padding: paddingSymme(horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(12.height),
          bottomLeft: Radius.circular(20.height),
        ),
      ),
      child: TextWidget(
        "$dic%",
        textAlign: TextAlign.center,
        fontSize: 12.weight,
        fontFamily: AppStrings.montserrat,
        color: AppColors.white,
      ),
    ),
  );
}
