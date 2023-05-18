import '../../../../index.dart';

productImage(
  String img, {
  required String dic,
  double? height,
  BoxFit? fit,
  BorderRadiusGeometry? borderRadius,
}) =>
    Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.secondaryLight,
            borderRadius: BorderRadius.circular(6.height),
          ),
          padding: paddingOnly(top: 2, right: 2, left: 2),
          child: ClipRRect(
            borderRadius: borderRadius ??
                BorderRadius.vertical(top: Radius.circular(6.height)),
            child: SizedBox(
              height: height ?? 190.height,
              width: Dimensions.screenWidth,
              child: img.isEmpty
                  ? Image.asset(AppImages.e404, fit: fit ?? BoxFit.fitHeight)
                  : Image.network(img, fit: fit ?? BoxFit.fitHeight),
            ),
          ),
        ),
        dic != "0" ? discontPositined(dic: dic) : Container()
      ],
    );