import 'package:flutter/cupertino.dart';

import '../../../../index.dart';

class ChoseDeliverytype extends StatelessWidget {
  const ChoseDeliverytype({super.key, required this.controller});
  final CartControllerImp controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: controller.selectDilvery ? 170.height : 100.height,
      margin: paddingSymme(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: paddingSymme(horizontal: 6),
            child: const TextWidget('Delivery type', fontSize: 15),
          ),
          16.sH,
          selectDeliveryType(),
          if (controller.selectDilvery)
            GetBuilder<AddressControllerImp>(builder: (controller) {
              if (controller.selectedAdressmodel == null) {
                return addUserData(
                  onTap: () => Get.toNamed(RouteHelper.getDeliveryAddress()),
                  title: "Select Address",
                  img: AppImages.location,
                );
              } else {
                return cardAddressData(controller);
              }
            })
          else
            Container()
        ],
      ),
    );
  }

  Expanded selectDeliveryType() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: RadioListTileWiget(
              img: AppImages.dilvery,
              title: "Delivery",
              vlu: true,
              groupVlu: controller.selectDilvery,
              onChanged: (value) => controller.changeDilveryVal(value),
            ),
          ),
          Expanded(
            child: RadioListTileWiget(
              img: AppImages.drivethru,
              title: "Drive Thru",
              vlu: false,
              groupVlu: controller.selectDilvery,
              onChanged: (value) => controller.changeDilveryVal(value),
            ),
          ),
        ],
      ),
    );
  }
}

cardAddressData(AddressControllerImp controller) {
  return Container(
    color: AppColors.grey100,
    child: ListTile(
      onTap: () => Get.toNamed(RouteHelper.getDeliveryAddress()),
      title: TextWidget(
        "${controller.selectedAdressmodel!.title}",
        fontSize: 12,
      ),
      subtitle: TextWidget(
        "${controller.selectedAdressmodel!.fullAddress}",
        fontSize: 9,
        color: AppColors.grey,
      ),
      leading: Container(
        height: 35.height,
        width: 38.weight,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(AppImages.location)),
        ),
      ),
      trailing: const Icon(
        CupertinoIcons.checkmark_alt_circle_fill,
        color: AppColors.success,
      ),
    ),
  ).animate().shimmer();
}
