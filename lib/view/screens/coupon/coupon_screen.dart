import 'dart:developer';

import 'package:ecommerce/index.dart';

class CouponScreen extends StatelessWidget {
  const CouponScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget("Coupon"),
      ),
      body: GetBuilder<CouponControllerImp>(
        builder: (controller) => Column(
          children: [
            couponAppBar(
              onChanged: (val) {
                log("$val--- ${controller.search!.text}");
              },
              applyTap: () => controller.getCoupon(),
              searchController: controller.search!,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: controller.listCoupons.length,
                itemBuilder: (context, index) {
                  return couponsContainerWidget(controller, index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container couponsContainerWidget(CouponControllerImp controller, index) {
    CouponModel list = controller.listCoupons[index];
    DateTime date = DateTime.parse(list.couponExpireDate!);
    return Container(
      padding: paddingOnly(bottom: 20, right: 8, left: 8),
      child: Column(
        children: [
          InkWell(
            onTap: () => controller.getCoupon(couponName: "${list.couponName}"),
            child: SizedBox(
              height: 74.height,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Checkbox(
                    value: controller.isChecked,
                    onChanged: (value) => controller.isCheckeds(value!),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 28.height,
                          width: double.infinity,
                          padding: paddingOnly(right: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextWidget("${list.couponName}",
                                  fontSize: 14.weight),
                              TextWidget(
                                list.couponCount != "0"
                                    ? "Not applicable"
                                    : "applicable",
                                textAlign: TextAlign.right,
                                color: AppColors.grey,
                                fontSize: 14.weight,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          ),
                        ),
                        10.sH,
                        /*  TextWidget(
                          "${list.couponId}",
                          fontSize: 14.weight,
                          fontWeight: FontWeight.w400,
                        ), */
                        TextWidget(
                          "SAVE ₹${list.couponDiscount}",
                          color: AppColors.success,
                          fontSize: 14.weight,
                          fontWeight: FontWeight.w400,
                        ),
                        TextWidget(
                          date.isBefore(controller.now!)
                              ? "The date has passed"
                              : "Valid till Date ${list.couponExpireDate}",
                          // : "The date has passed",
                          color: AppColors.grey,
                          fontSize: 12.weight,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: paddingSymme(horizontal: 16),
            child: const Divider(color: AppColors.grey200),
          )
        ],
      ),
    );
  }
}
