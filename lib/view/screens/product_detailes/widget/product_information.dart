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
              SizedBox(
                height: 24.height,
                width: 84.weight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    plusAndMinsBtn(
                      isPlus: false,
                      onTap: () => controller.increse(add: false),
                    ),
                    TextWidget("${controller.count}")
                        .animate()
                        .scale(delay: const Duration(microseconds: 600)),
                    plusAndMinsBtn(
                      onTap: () => controller.increse(add: true),
                    ),
                  ],
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
                  /* ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Color(0xFFFFC107),
                    ),
                  ), */
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
                      onRatingUpdate: (value) =>
                          controller.onRatingUpdat(value),
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