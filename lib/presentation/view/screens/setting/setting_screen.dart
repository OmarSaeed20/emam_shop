import 'package:flutter/cupertino.dart';

import '../../../../index.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return body(context);
  }
}

body(BuildContext context) {
  double baseWidth = Dimensions.screenWidth;
  double fem = MediaQuery.of(context).size.width / baseWidth;
  // double fem = Dimensions.screenWidth;

  return SingleChildScrollView(
    child: SizedBox(
      child: Column(
        children: [
          settingHeadder(fem),
          settingBody(),
        ],
      ),
    ),
  );
}

GetBuilder<SettingControllerImp> settingBody() =>
    GetBuilder<SettingControllerImp>(
      builder: (controller) => Container(
        padding: paddingOnly(left: 25, top: 10, right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            accountBody(controller),
            15.sH,
            supportAnDAboutBody(controller),
            15.sH,
            actionsBody(controller),
            100.sH,
          ],
        ),
      ),
    );

Column accountBody(SettingControllerImp controller) => Column(
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
                settingListTile(Icons.person, "Profile",
                    onTap: () => controller.goToProfile(),),
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

Column supportAnDAboutBody(SettingControllerImp controller) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget("Support & About", spacing: 1.weight),
        12.sH,
        Container(
          margin: paddingOnly(right: 7),
          child: Card(
            elevation: 5,
            color: AppColors.cardColor,
            margin: paddingSymme(),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
            ),
            child: Column(
              children: [
                settingListTile(
                  Icons.help_center,
                  "Help & Support",
                  onTap: () => controller.goToHelpSupport(),
                ),
                settingListTile(
                  Icons.quick_contacts_dialer_rounded,
                  "Contact us",
                  onTap: () => controller.goToContactus(),
                ),
                settingListTile(
                  Icons.gpp_maybe,
                  "Terms and Policies",
                  onTap: () => controller.goToTermsAndPolicies(),
                ),
              ],
            ),
          ),
        )
      ],
    );
Column actionsBody(SettingControllerImp controller) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget("Actions", spacing: 1.weight),
        12.sH,
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
                  Icons.flag,
                  "Report a problem",
                  onTap: () => controller.goToReoprtProblems(),
                ),
                settingListTile(
                  Icons.delete,
                  "Delete account",
                  onTap: () => controller.goToDeleteAccount(),
                ),
                settingListTile(
                  Icons.power_settings_new,
                  "Log out",
                  onTap: () => controller.goToLogout(),
                ),
              ],
            ),
          ),
        )
      ],
    );
