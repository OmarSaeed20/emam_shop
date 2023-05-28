import '../../../../index.dart';

bottomSheetWidget(
  BuildContext context, {
  required String count,
  required String supTotle,
  required String tax,
  required String delivery,
  required VoidCallback selectAddress,
  required VoidCallback cancel,
  // required int totle,
}) =>
    SingleChildScrollView(
      child: Container(
        height: 270.height,
        padding: paddingOnly(top: 8, left: 20, right: 20, bottom: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: cancel,
                child: const Icon(Icons.cancel, color: AppColors.red),
              ),
            ),
            SizedBox(
              height: 170.height,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => applyPromoCode(context),
                    child: const TextWidget(
                      "coupon code",
                      decoration: TextDecoration.underline,
                      color: AppColors.primaryMid,
                    ),
                  ),
                  SizedBox(
                    height: 100.height,
                    child: Column(
                      children: [
                        cartCheckoutListTile("Count", count),
                        cartCheckoutListTile("SubTotle", "$supTotle \$"),
                        cartCheckoutListTile("Tax and Fees", "$tax \$"),
                        cartCheckoutListTile("Delivery", "$delivery \$"),
                      ],
                    ),
                  ),
                  Container(
                    height: .5,
                    width: double.infinity,
                    color: AppColors.grey,
                  ),
                  cartCheckoutListTile(
                    "Totle",
                    "${double.parse(supTotle) + double.parse(tax) + double.parse(delivery)} \$",
                    color: AppColors.primary2,
                    fontSize: 16.weight,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
            ),
            BtnWidget(
              "select address",
              fontWeight: FontWeight.w400,
              fontSize: 16.weight,
              width: 200.weight,
              height: 40.height,
              onPressed: selectAddress,
            )
          ],
        ),
      ),
    );

cartCheckoutListTile(
  String title,
  String num, {
  double? fontSize,
  FontWeight? fontWeight,
  Color? color,
}) {
  return SizedBox(
    height: 20.height,
    child: ListTile(
      title: TextWidget(
        title,
        fontSize: fontSize ?? 14.weight,
        fontWeight: fontWeight ?? FontWeight.w600,
        color: color,
      ),
      horizontalTitleGap: 0,
      trailing: TextWidget(
        num,
        fontFamily: AppStrings.montserrat,
        fontWeight: fontWeight ?? FontWeight.w600,
        color: color,
        fontSize: fontSize,
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
