import 'package:ecommerce/index.dart';
import 'package:flutter/cupertino.dart';

ListTile homeAppBar() => ListTile(
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
    /*  TextWidget(
      "EMAM",
      textAlign: TextAlign.center,
      fontSize: 26.weight,
      fontFamily: AppStrings.montserrat,
      fontWeight: FontWeight.w600,
    ), */
    leading: appBarImg(
      AppImages.user1,
      size: 50,
      fit: BoxFit.cover,
      // color: AppColors.primary,
      border: Border.all(width: .5.weight, color: AppColors.grey200),
    ),
    trailing: SizedBox(
      width: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Icon(CupertinoIcons.search, color: AppColors.awsm),
          Icon(CupertinoIcons.bell, color: AppColors.awsm),
          // appBarImg(AppImages.notification),
        ],
      ),
    ));

appBarImg(
  String img, {
  double? size,
  // double? wid,
  BoxFit? fit,
  BoxBorder? border,
  Color? color,
}) =>
    Container(
      height: getProportionateScreenHeight(size ?? 25.height),
      width: getProportionateScreenWidth(size ?? 25.weight),
      decoration: BoxDecoration(
        border: border,
        borderRadius: BorderRadius.circular(6.weight),
      ),
      child: Image.asset(img, fit: fit, color: color),
    );
