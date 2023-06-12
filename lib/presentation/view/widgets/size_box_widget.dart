import '/index.dart';
/* 
Widget sizeHei([double? hei]) =>
    SizedBox(height: getProportScrHeight(hei ?? 10));

Widget sizewid([double? wid]) =>
    SizedBox(width: getProportScrHeight(wid ?? 10)); */

extension SizedBoxExtension on num {
  SizedBox get sH => SizedBox(height: getProportionateScreenHeight(toDouble()));
  SizedBox get sW => SizedBox(width: getProportionateScreenWidth(toDouble()));
}

extension DimensionsExtension on num {
  double get height => getProportionateScreenHeight(toDouble());
  double get weight => getProportionateScreenWidth(toDouble());
}

EdgeInsetsDirectional paddingOnly({
  double left = 0.0,
  double top = 0.0,
  double right = 0.0,
  double bottom = 0.0,
}) =>
    EdgeInsetsDirectional.only(
      start: getProportionateScreenWidth(left),
      top: getProportionateScreenHeight(top),
      end: getProportionateScreenWidth(right),
      bottom: getProportionateScreenHeight(bottom),
    );

EdgeInsetsDirectional paddingSymme({
  double horizontal = 0.0,
  double vertical = 0.0,
}) =>
    EdgeInsetsDirectional.symmetric(
      vertical: getProportionateScreenHeight(vertical),
      horizontal: getProportionateScreenWidth(horizontal),
    );
