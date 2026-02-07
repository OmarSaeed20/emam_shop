import 'package:flutter/cupertino.dart';

import '/index.dart';

snackBarMessage(String msg) => Get.showSnackbar(GetSnackBar(
      snackPosition: SnackPosition.TOP,
      duration: const Duration(milliseconds: 4000),
      backgroundColor: AppColors.offWhite3,
      leftBarIndicatorColor: AppColors.red,
      icon: Padding(
        padding: paddingSymme(horizontal: 12),
        child: Icon(
          CupertinoIcons.exclamationmark_bubble,
          color: AppColors.red,
          size: 35.height,
        ),
      ),
      messageText: Padding(
        padding: paddingSymme(horizontal: 10),
        child: TextWidget(msg),
      ),
    ));

snackBarInternetError({void Function()? onTap}) => Get.showSnackbar(GetSnackBar(
      icon: Padding(
        padding: paddingSymme(horizontal: 12),
        child: Icon(
          // CupertinoIcons.wifi_exclamationmark,
          Icons.network_check_outlined,
          color: AppColors.red,
          size: 35.height,
        ),
      ),
      leftBarIndicatorColor: AppColors.red,
      messageText: Padding(
        padding: paddingSymme(horizontal: 10),
        child: const TextWidget("Chick Your Internet Data"),
      ),
      backgroundColor: AppColors.offWhite3,
      snackPosition: SnackPosition.BOTTOM,
      mainButton: Container(
        height: 30.height,
        width: 50.weight,
        decoration: BoxDecoration(
          border: Border.all(width: .5.weight),
          borderRadius: BorderRadius.circular(6.weight),
        ),
        child: Center(
          child: InkWell(
            onTap: onTap ?? () {},
            child: TextWidget(
              "Retry",
              color: AppColors.primary,
              fontSize: 14.weight,
            ),
          ),
        ),
      ),
    ));

snackBarSuccess({String? msg}) => Get.showSnackbar(
      GetSnackBar(
        duration: const Duration(milliseconds: 4000),
        leftBarIndicatorColor: Colors.green[600],
        backgroundColor: AppColors.offWhite3,
        snackPosition: SnackPosition.TOP,
        icon: Padding(
          padding: paddingSymme(horizontal: 12),
          child: Icon(
            Icons.check_circle_rounded,
            color: Colors.green[600],
            size: 35.height,
          ),
        ),
        messageText: Padding(
          padding: paddingSymme(horizontal: 10),
          child: TextWidget(
            msg ?? "Success",
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
