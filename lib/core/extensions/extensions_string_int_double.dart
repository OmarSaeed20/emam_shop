import 'package:ecommerce/core/constant/app_strings.dart';

extension NunNullString on String? {
  String orEmpty() {
    if (this == null) {
      return AppStrings.empty;
    } else {
      return this!;
    }
  }
}

extension NunNullInt on int? {
  int orZero() {
    if (this == null) {
      return AppStrings.zero;
    } else {
      return this!;
    }
  }
}

extension NunNullDouble on double? {
  double orZero() {
    if (this == null) {
      return AppStrings.zero2;
    } else {
      return this!;
    }
  }
}
