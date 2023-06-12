import 'package:ecommerce/index.dart';
import 'package:flutter/cupertino.dart';

ListTile homeAppBar({
  required VoidCallback cartTap,
  required VoidCallback notfTap,
}) =>
    ListTile(
        /*  Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget("Delever to", fontSize: 14.weight),
                Icon(CupertinoIcons.chevron_down, size: 15.height)
              ],
            ),
            TextWidget(
              "4102 Pretty View Lane ",
              fontWeight: FontWeight.w600,
              fontSize: 14.weight,
              color: AppColors.primaryMid,
            )
          ],
        ), */
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              CupertinoIcons.placemark_fill,
              color: AppColors.primary,
              size: 18.height,
            ),
            5.sW,
            TextWidget("menoufia, egypt", fontSize: 14.weight),
          ],
        ),
        leading: appBarImg(
          onTap: () {},
          AppImages.user,
          size: 50.weight,
          fit: BoxFit.cover,
          border: Border.all(width: .5.weight, color: AppColors.grey200),
        ),
        trailing: SizedBox(
          width: 70.weight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: cartTap,
                child: const Icon(
                  CupertinoIcons.cart,
                  color: AppColors.primary,
                ),
              ),
              GestureDetector(
                onTap: notfTap,
                child: const Icon(
                  Icons.notifications_active_outlined,
                  color: AppColors.primary,
                ),
              ),
              // appBarImg(AppImages.notification),
            ],
          ),
        ));

appBarImg(
  String img, {
  required VoidCallback onTap,
  double? size,
  // double? wid,
  BoxFit? fit,
  BoxBorder? border,
  Color? color,
}) =>
    GestureDetector(
      onTap: onTap,
      child: Container(
        height: getProportionateScreenHeight(size ?? 25.height),
        width: getProportionateScreenWidth(size ?? 25.weight),
        decoration: BoxDecoration(
          border: border,
          borderRadius: BorderRadius.circular(6.weight),
        ),
        child: Image.asset(img, fit: fit, color: color),
      ),
    );