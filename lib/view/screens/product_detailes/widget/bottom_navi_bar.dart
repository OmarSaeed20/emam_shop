import 'package:flutter/cupertino.dart';

import '../../../../index.dart';

botNavigationBar() => Container(
      height: 80.height,
      width: double.infinity,
      color: AppColors.offWhite,
      padding: paddingOnly(top: 16, bottom: 20, right: 20, left: 20),
      child: GetBuilder<ItemsControllerImp>(
        builder: (controller) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            btnFavWidget(
              onTap: () => controller.onfavoriteUpdat(),
              active: controller.itemsModePro!.favorite == "1" ? true : false,
            ),
            6.sW,
            btnFavWidget(
              icon: controller.painIcon,
              onTap: () => controller.onAddPinUpdat(),
              active: controller.pain,
            ),
            10.sW,
            Expanded(
              child: BtnWidget(
                'Add to bag',
                height: 40.height,
                onPressed: () => controller.addToBag(),
              ),
            )
          ],
        ),
      ),
    );

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
