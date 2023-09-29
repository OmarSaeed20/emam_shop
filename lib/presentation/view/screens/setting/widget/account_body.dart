import 'package:flutter/cupertino.dart';

import '../../../../../index.dart';

class AccountBody extends StatelessWidget {
  const AccountBody({super.key, required this.controller});
  final SettingControllerImp controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget("Account", spacing: 1.weight),
        6.sH,
        Container(
          margin: paddingOnly(right: 7),
          child: Card(
            elevation: 5,
            margin: paddingSymme(),
            color: AppColors.cardColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
            ),
            child: Column(
              children: [
                settingListTile(
                  Icons.person,
                  "Profile",
                  onTap: () => controller.goToProfile(),
                ),
                settingListTile(
                  Icons.payment,
                  "Payment Methods",
                  onTap: () => controller.goToPayMentMethods(),
                ),
                settingListTile(
                  Icons.pin_drop,
                  "Delivery Address",
                  onTap: () => controller.goToDeliveryAddress(),
                ),
                settingListTile(
                  CupertinoIcons.doc_text_fill,
                  "My Orders",
                  onTap: () => controller.goToMyOrders(),
                ),
                settingListTile(
                  Icons.notifications_active,
                  "Notifications",
                  onTap: () => controller.goToNotfications(),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
