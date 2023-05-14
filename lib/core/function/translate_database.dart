import 'package:ecommerce/index.dart';

translateDatabase(String ar, String en) {
  if (DatabaseHelper.to.getString(EndPoint.lang) == EndPoint.arCode) {
    return ar;
  } else {
    return en;
  }
}
