import 'package:ecommerce/index.dart';

Container productCardBody({
  required String name,
  VoidCallback? favTap,
  VoidCallback? cartTap,
  required String pric,
  required String oldPric,
  EdgeInsetsGeometry? padding,
  bool isFavoritScreen = false,
  IconData? icon2,
  bool? active2 = false,
  bool? active = false,
  bool? isHome = false,
}) =>
    Container(
      padding: padding ?? paddingOnly(right: 6, top: 2, bottom: 2, left: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          productTitle(name, maxLi: isFavoritScreen ? 2 : 1),
          isFavoritScreen ? 18.sH : Container(),
          if (isHome!) 10.sH,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (isFavoritScreen)
                    Container(
                      margin: paddingOnly(top: 2, right: 4),
                      child: proCardIcon(active2!, icon: icon2, onTap: cartTap),
                    ),
                  if (!isHome)
                    Container(
                      margin: paddingOnly(top: 2, right: 4),
                      padding: paddingSymme(vertical: 3, horizontal: 3),
                      alignment: Alignment.center,
                      child: btnFavWidget(
                          home: true, onTap: favTap ?? () {}, active: active!),
                    ),
                ],
              ),
            ],
          ),
          3.sH,
        ],
      ),
    );
