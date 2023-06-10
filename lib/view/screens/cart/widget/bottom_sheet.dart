import '../../../../index.dart';

bottomSheetWidget(
  BuildContext context, {
  required CartControllerImp controller,
  required String count,
  required String supTotle,
  required String totaldiscount,
  required String couponTitle,
  required String tax,
  required String coupon,
  required String delivery,
  required VoidCallback continueTap,
  required VoidCallback couponTap,
}) {
  String totalPreic =
      "${double.parse("${double.parse(calculatingPrice(supTotle, coupon)) + double.parse(tax) + double.parse(delivery)}").toInt()}";
  controller.totalPrice = totalPreic;
  double savingPrice0 = double.parse(controller.countpriceModel!.savingPrice!) +
      (double.parse(supTotle) > double.parse(totalPreic)
          ? (double.parse(supTotle) - double.parse(totalPreic))
          : 0);
  int savingPrice = savingPrice0.toInt();

  controller.ordersPrice =
      "${int.parse(calculatingPrice(supTotle, coupon)) + double.parse(tax)}";
  controller.deliveryPrice = "${int.parse(delivery)}";
  controller.totalOldPrice = "${calculatingPrice(totalPreic, totaldiscount)}";
  return SingleChildScrollView(
    child: Container(
      height: 345.height,
      padding: paddingOnly(top: 8, bottom: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextWidget("PAYMENT DETAILS".toLowerCase()),
          Container(
            height: 200.height,
            padding: paddingOnly(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      cartCheckoutListTile("Count", count),
                      cartCheckoutListTile("Coupon", "$coupon \$"),
                      cartCheckoutListTile("SubTotle", "$supTotle \$"),
                      cartCheckoutListTile("Tax and Fees", "$tax \$"),
                      cartCheckoutListTile("Delivery", "$delivery \$"),
                    ],
                  ),
                ),
                15.sH,
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Container(
                        height: .5,
                        width: double.infinity,
                        color: AppColors.grey,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            cartCheckoutListTile(
                              "TOTAL",
                              "$totalPreic \$",
                              color: AppColors.primary2,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                            Container(
                              height: 20.height,
                              width: double.infinity,
                              color: AppColors.grey150,
                              child: TextWidget(
                                "You’re saving ₹$savingPrice on this order!",
                                fontSize: 12,
                                textAlign: TextAlign.center,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 45.height,
            alignment: Alignment.center,
            child: ListTileWidget(
              title: couponTitle,
              isSubtitle: false,
              trailing: const Icon(
                Icons.add,
                color: AppColors.primary2,
              ),
              leadingIc: Icons.percent_sharp,
              onTap: couponTap,
              leadcolor: const Color(0xFFF0BC68),
            ),
          ),
          Container(
            padding: paddingOnly(left: 20, right: 20),
            child: BtnWidget(
              AppStrings.coontinue.tr,
              fontWeight: FontWeight.w500,
              fontSize: 16.weight,
              height: 40.height,
              onPressed: continueTap,
            ),
          )
        ],
      ),
    ),
  );
}

applyPromoCode(BuildContext context) {
  var formKey = GlobalKey<FormState>();
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      // title: const TextWidget('Coupon Code '),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0.height),
        side: BorderSide(color: AppColors.awsm, width: .5.weight),
      ),
      backgroundColor: AppColors.cardColor,
      content: Form(
        key: formKey,
        child: TextFormField(
          cursorColor: Colors.black,
          validator: (v) {
            if (v!.isEmpty) {
              return 'this is required';
            }
            return null;
          },
          decoration: const InputDecoration(
              labelText: 'Insert your coupon code',
              labelStyle: TextStyle(color: Colors.black),
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.secondaryPro),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.grey),
              )),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              Get.back();
            }
          },
          child: const TextWidget(
            "apply",
            fontWeight: FontWeight.w600,
            color: AppColors.primary2,
          ),
        ),
        /* BtnWidget(
          'apply',
          height: 30.height,
          width: 90.weight,
          onPressed: () {
            if (formKey.currentState!.validate()) {
              Get.back();
              /* showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const TextWidget(
                    'Check it out before expiring in a week',
                  ),
                  content: Row(
                    children: const [
                      TextWidget(
                        'Discount Code: ',
                        fontWeight: FontWeight.bold,
                      ),
                      SelectableText('14673ERT'),
                    ],
                  ),
                  actions: [
                    BtnWidget(
                      'apply',
                      height: 30.height,
                      width: 90.weight,
                      onPressed: () => Get.back(),
                    ),
                  ],
                ),
              ); */
            }
          },
        ), */
      ],
    ),
  );
}
