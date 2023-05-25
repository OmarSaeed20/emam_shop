import 'package:flutter/cupertino.dart';

import '../../../../index.dart';

botNavigationBar() {
  ItemsControllerImp itemContro = Get.find();

  return Container(
    height: 85.height,
    width: double.infinity,
    color: AppColors.offWhite,
    padding: paddingOnly(top: 16, bottom: 25, right: 20, left: 20),
    child: GetBuilder<FavoriteControllerImp>(builder: (favContro) {
      favContro.isFavor[itemContro.itemsModePro!.id] =
          itemContro.itemsModePro!.favorite;
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          btnFavWidget(
            onTap: () {
              /* log(itemContro.itemsModePro!.id!);
              if (favContro.isFavor[itemContro.itemsModePro!.id] == "1") {
                favContro.onTapSetFavorite(itemContro.itemsModePro!.id!, '0');
                favContro.onTapRemovefavo(itemContro.itemsModePro!.id!);
              } else {
                favContro.onTapSetFavorite(itemContro.itemsModePro!.id!, '1');
                favContro.onTapAddFavo(itemContro.itemsModePro!.id!);
              } */
            },
            active: favContro.isFavor[itemContro.itemsModePro!.id] == "1"
                ? true
                : false,
          ),
          /*  6.sW,
            btnFavWidget(
              icon: controller.painIcon,
              onTap: () => controller.onAddPinUpdat(),
              active: controller.pain,
            ), */
          10.sW,
          Expanded(
            child: BtnWidget(
              'Go To Cart',
              height: 40.height,
              onPressed: () => HomeControllerImp.to.goToCart(),
            ),
          )
        ],
      );
    }),
  );
}

GestureDetector btnFavWidget({
  required VoidCallback onTap,
  required bool active,
  bool home = false,
  IconData? icon,
}) {
  return GestureDetector(
    onTap: onTap,
    child: home ? proCardIcon(active, icon: icon) : _proDetaiIcon(active, icon),
  );
}

Container _proDetaiIcon(bool active, IconData? icon) => Container(
      height: 40.height,
      width: 40.height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.height),
        border: Border.all(color: !active ? AppColors.grey : AppColors.red),
      ),
      child: !active
          ? Icon(icon ?? CupertinoIcons.heart, color: AppColors.grey)
          : Icon(icon ?? CupertinoIcons.heart_fill, color: AppColors.red)
              .animate()
              .flipH()
              .shake(),
    );

proCardIcon(bool active, {IconData? icon, void Function()? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: !active
        ? Icon(icon ?? CupertinoIcons.heart, color: AppColors.primaryMid)
        : Icon(icon ?? CupertinoIcons.heart_fill, color: AppColors.primary)
            .animate()
            .shimmer()
            .shake(),
  );
}
