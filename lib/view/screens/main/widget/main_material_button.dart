// import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';

import '/index.dart';

customMateIcon({
  required void Function()? onTap,
  required IconData? icon,
  required bool? isSelect,
}) =>
    /* BottomNavigationBarItem(
      label: text,
      activeIcon: Icon(iconAc, color: AppColors.primary),
      icon: Icon(icon, color: color),
    ); */
    Stack(
      children: [
        Positioned(
            bottom: 0,
            right: 2,
            left: 2,
            child: Container(
              height: 2,
              // width: 5,
              decoration: BoxDecoration(
                color: isSelect == true ? AppColors.awsm : AppColors.trans,
              ),
            )),
        GestureDetector(
          onTap: onTap,
          child: SizedBox(
            height: 40.height,
            width: 40.weight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isSelect == true
                    ? Icon(
                        icon,
                        size: isSelect == true ? 30 : 30,
                        // color: isSelect == true
                        //     ? AppColors.primary
                        //     : AppColors.offWhite3,
                      )
                        .animate()
                        .fadeIn(curve: Curves.easeInOutCirc)
                        .scaleX()
                        .shimmer(delay: 500.ms, colors: <Color>[
                        AppColors.primary,
                        const Color(0xff5b0060),
                        const Color(0xff870160),
                        const Color(0xffac255e),
                        const Color(0xffca485c),
                        const Color(0xffe16b5c),
                        const Color(0xfff39060),
                        const Color(0xffffb56b),
                      ]).scale(delay: const Duration(milliseconds: 100))
                    : Icon(
                        icon,
                        size: isSelect == true ? 30 : 20,
                        color: isSelect == true
                            ? AppColors.primary
                            : AppColors.offWhite3,
                      ),
                // TextWidget(text!, fontSize: 12, color: color)
              ],
            ),
          ),
        ),
      ],
    );

homeMateIcon({
  required bool isSelect,
  required VoidCallback? onTap,
}) =>
    customMateIcon(
      icon: isSelect == true
          ? CupertinoIcons.square_grid_2x2_fill
          : CupertinoIcons.square_grid_2x2,
      onTap: onTap,
      isSelect: isSelect,
    );

walletMateIcon({
  required VoidCallback? onTap,
  required bool isSelect,
}) =>
    customMateIcon(
      icon: isSelect == true
          ? CupertinoIcons.creditcard_fill
          : CupertinoIcons.creditcard,
      onTap: onTap,
      isSelect: isSelect,
    );

cartMateIcon({
  required VoidCallback? onTap,
  required bool isSelect,
}) =>
    customMateIcon(
      icon: isSelect == true ? CupertinoIcons.cart_fill : CupertinoIcons.cart,
      onTap: onTap,
      isSelect: isSelect,
    );

favvMateIcon({
  required VoidCallback? onTap,
  required bool isSelect,
}) =>
    customMateIcon(
      icon: isSelect == true ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
      onTap: onTap,
      isSelect: isSelect,
    );

settingMateIcon({
  required VoidCallback? onTap,
  required bool isSelect,
}) =>
    customMateIcon(
      icon: isSelect == true
          ? CupertinoIcons.gear_solid
          : Icons.settings_outlined,
      // ? CupertinoIcons.gear_solid
      // : CupertinoIcons.gear_solid,
      onTap: onTap,
      isSelect: isSelect,
    );
