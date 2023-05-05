 
import 'package:flutter/cupertino.dart';

import '/index.dart';

snackBarMessage( {String? title,required String msg}) => Get.showSnackbar(GetSnackBar(
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
      titleText: Padding(
        padding: paddingSymme(horizontal: 10),
        child: TextWidget(title ?? "", fontWeight: FontWeight.w700),
      ),
      messageText: Padding(
        padding: paddingSymme(horizontal: 10),
        child: TextWidget(msg, fontSize: 14),
      ),
    ));

snackBarChickInternetConnection(bool isSuccess, {void Function()? onTap}) =>
    Get.showSnackbar(GetSnackBar(
      duration: const Duration(milliseconds: 4000),
      icon: Padding(
        padding: paddingSymme(horizontal: 12),
        child: Icon(
          // CupertinoIcons.wifi_exclamationmark,
          Icons.network_check_outlined,
          color: isSuccess == true ? AppColors.success : AppColors.red,
          size: 35.height,
        ),
      ),
      leftBarIndicatorColor:
          isSuccess == true ? AppColors.success : AppColors.red,
      titleText: Padding(
        padding: paddingSymme(horizontal: 10),
        child: const TextWidget(
          "internet connection",
          fontWeight: FontWeight.w600,
        ),
      ),
      messageText: Padding(
        padding: paddingSymme(horizontal: 10),
        child: TextWidget(
          isSuccess == true
              ? "connected internet successflly"
              : "Please check your internet connection",
          fontSize: 14,
        ),
      ),
      backgroundColor: AppColors.offWhite3,
      snackPosition: SnackPosition.BOTTOM,
      /*  mainButton:isSuccess==false? Container(
        height: 30.height,
        width: 50.weight,
        decoration: BoxDecoration(
          border: Border.all(width: .5.weight),
          borderRadius: BorderRadius.circular(6.weight),
        ),
        child: Center(
          child: InkWell(
            onTap: onTap ??
                () async {
                  bool isConnected = await retryCheckInternetConnection();
                  log("Is connected to internet: $isConnected");
                },
            child: TextWidget(
              "Retry",
              color: AppColors.primary,
              fontSize: 14.weight,
            ),
          ),
        ),
      ):Container(), */
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
