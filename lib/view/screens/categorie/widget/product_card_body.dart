import 'package:ecommerce/index.dart';

Container productCardBody({
  required String name,
  required VoidCallback onTap,
  required String pric,
  required String oldPric,
  EdgeInsetsGeometry? padding,
}) =>
    Container(
      padding: padding ?? paddingOnly(right: 6, top: 2, bottom: 2, left: 4),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            productTitle(name),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextWidget(
                      "$pric \$",
                      fontSize: 17.weight,
                      fontFamily: AppStrings.montserrat,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                    5.sW,
                    TextWidget(
                      "$oldPric \$",
                      fontSize: 14.weight,
                      fontFamily: AppStrings.montserrat,
                      color: AppColors.black.withOpacity(.6),
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Icon(
                    MyLocaleControllerImp.to.themeData == themeEN
                        ? Icons.arrow_circle_right_rounded
                        : Icons.arrow_circle_left_rounded,
                    color: AppColors.primary,
                    size: 35,
                  ),
                )
              ],
            ),
            3.sH,
          ]),
    );
