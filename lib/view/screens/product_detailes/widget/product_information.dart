import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../index.dart';

Container productDetailes(ItemsControllerImp controller) {
  return Container(
    padding: paddingSymme(horizontal: 20),
    child: Column(
      children: [
        15.sH,
        TextWidget(
          translateDatabase(
            controller.itemsModePro!.nameAr!,
            controller.itemsModePro!.name!,
          ),
          fontSize: 19.weight,
          fontWeight: FontWeight.w500,
        ),
        8.sH,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextWidget(
              "${controller.itemsModePro!.price!}\$",
              fontSize: 20.weight,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
            ),
            GetBuilder<CartControllerImp>(
              builder: (controller) => SizedBox(
                height: 24.height,
                width: 84.weight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    plusAndMinsBtn(
                      isPlus: false,
                      onTap: () => controller.increse(
                        count: controller.countItems,
                        add: false,
                        itemsId: ItemsControllerImp.to.itemsModePro!.id!,
                      ),
                    ),
                    /* AnimatedSwitcher(
                      duration: const Duration(seconds: 2),
                      key: ValueKey(controller.countItems),
                      child: TextWidget("${controller.countItems}"),
                      transitionBuilder: (child, animation) =>
                          ScaleTransition(scale: animation, child: child),
                    ), */
                    TextWidget("${controller.countItems}")
                        .animate()
                        .scale(delay: const Duration(microseconds: 600)),
                    plusAndMinsBtn(
                      onTap: () => controller.increse(
                        count: controller.countItems,
                        add: true,
                        itemsId: ItemsControllerImp.to.itemsModePro!.id!,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        10.sH,
        Container(
            alignment: Alignment.centerLeft,
            height: 22.height,
            child: Row(
              children: [
                Container(
                  margin: paddingSymme(vertical: 0),
                  child: RatingBar.builder(
                    initialRating: controller.ratingVal,
                    itemSize: 22.height,
                    minRating: .5,
                    maxRating: 5,
                    itemCount: 5,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    unratedColor: Colors.amber[100],
                    itemBuilder: (context, index) {
                      return Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 1.height,
                      );
                    },
                    onRatingUpdate: (value) => controller.onRatingUpdat(value),
                  ),
                ),
                6.sW,
                TextWidget(
                  "${controller.ratingVal}",
                  fontSize: 12.weight,
                  fontWeight: FontWeight.w400,
                ),
              ],
            )),
        20.sH,
        listAnimatedContaierWidget(controller),
        20.sH,
      ],
    ),
  );
}
