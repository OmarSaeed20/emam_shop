import '/index.dart';

extension SizedBoxExtension on num {
  SizedBox get sH => SizedBox(height: getProportionateScreenHeight(toDouble()));
  SizedBox get sW => SizedBox(width: getProportionateScreenWidth(toDouble()));
}

extension DimensionsExtension on num {
  double get height => getProportionateScreenHeight(toDouble());
  double get weight => getProportionateScreenWidth(toDouble());
}
