import '/index.dart';

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
