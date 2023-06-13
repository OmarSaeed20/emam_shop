import 'dart:io';

import '/index.dart';

Future<bool> alertExitAppDialog() {
  Get.defaultDialog(
    backgroundColor: AppColors.white,
    title: "Alert",
    titleStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.weight),
    middleText: "Do you want to exit the application",
    middleTextStyle: TextStyle(color: AppColors.grey, fontSize: 14.weight),
    // barrierDismissible: false,
    radius: 6.weight,
    actions: [_askExitBtn()],
  );
  return Future.value(true);
}

_askExitBtn() => dialogBody(
      icon: Icons.info,
      icSize: 80.weight,
      sH: 20.sH,
      btn1: dialogBtn(
        "Ok",
        onTap: () => exit(0),
      ),
      btn2: dialogBtn(
        "Cancel",
        onTap: () => Get.back(),
      ),
    );
