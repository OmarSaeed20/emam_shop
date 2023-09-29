import '../../../../../index.dart';

class SupportAnDAboutBody extends StatelessWidget {
  final SettingControllerImp controller;

  const SupportAnDAboutBody({super.key, required this.controller});
  @override
  Widget build(BuildContext context) {
    return Column(
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
  }
}
