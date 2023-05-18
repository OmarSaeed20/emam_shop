import "/index.dart";

Stack productDetailseImage(ItemsControllerImp controller) => Stack(
      children: [
        Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: AppColors.secondaryLight,
          margin: const EdgeInsets.all(0),
          child: Container(
            height: 260.height,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.cardColor,
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(12.height)),
            ),
            child: Image.network(
              controller.itemsModePro!.image!,
              filterQuality: FilterQuality.medium,
              fit: BoxFit.contain,
            ),
          ),
        ),
        int.parse(controller.itemsModePro!.discount!) > 0
            ? Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  height: 20.height,
                  width: 115.weight,
                  decoration: BoxDecoration(
                    color: AppColors.primaryMid,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10.height),
                      topLeft: Radius.circular(16.height),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: TextWidget(
                    "Discount : ${controller.itemsModePro!.discount!}%",
                    fontFamily: AppStrings.montserrat,
                    fontSize: 14.weight,
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ).animate().shake().fade(),
              )
            : Container(),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: paddingOnly(right: 20, left: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconAndTextBack(onTap: () => Get.back(), showTextBack: false),
                InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                    radius: 15.height,
                    backgroundColor: AppColors.secondaryLight,
                    child: Icon(
                      Icons.share_outlined,
                      size: 20.weight,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
