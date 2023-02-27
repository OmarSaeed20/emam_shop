import '/index.dart';

Widget sizeHei([double? hei]) => SizedBox(height: getProportScrHeight(hei ?? 10));

Widget sizewid([double? wid]) => SizedBox(width: getProportScrHeight(wid ?? 10));
