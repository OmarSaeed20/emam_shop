import 'package:flutter/cupertino.dart';

import '../../../../index.dart';

class ChosePaymenMethod extends StatelessWidget {
  const ChosePaymenMethod({super.key, required this.controller});
  final CartControllerImp controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: controller.selectCredit ? 170.height : 100.height,
      margin: paddingSymme(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: paddingSymme(horizontal: 6),
            child: const TextWidget('Payment Method', fontSize: 15),
          ),
          16.sH,
          selectPaytype(),
          if (controller.selectCredit)
            cardData()
          /*  addUserData(
              onTap: () {},
              title: "Add Credit Card",
              img: AppImages.mastercard,
            ) */
          else
            Container(),
        ],
      ),
    );
  }

  selectPaytype() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: RadioListTileWiget(
              img: AppImages.creditCard,
              title: "Credit Card",
              vlu: false,
              groupVlu: controller.selectCredit,
              onChanged: (value) => controller.changePaymentVal(value),
            ),
          ),
          Expanded(
            child: RadioListTileWiget(
              img: AppImages.pay,
              title: "Cash",
              vlu: true,
              groupVlu: controller.selectCredit,
              onChanged: (value) => controller.changePaymentVal(value),
            ),
          ),
        ],
      ),
    );
  }
}

cardData() {
  return Container(
    color: AppColors.grey100,
    child: ListTile(
      title: const TextWidget(
        "My Virtual Debit Card",
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      subtitle: Row(
        children: [
          ...List.generate(
            3,
            (index) => Padding(
              padding: paddingOnly(right: 4),
              child: CircleAvatar(
                  radius: 4.height, backgroundColor: AppColors.black),
            ),
          ),
          const TextWidget("8553", fontSize: 14)
        ],
      ),
      leading: Container(
        height: 35.height,
        width: 38.weight,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(AppImages.mastercard)),
        ),
      ),
      trailing: const Icon(
        CupertinoIcons.checkmark_alt_circle_fill,
        color: AppColors.success,
      ),
    ),
  ).animate().shimmer();
}
