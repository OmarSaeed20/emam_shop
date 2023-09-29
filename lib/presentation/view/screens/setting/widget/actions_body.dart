import '../../../../../index.dart';

class ActionsBody extends StatelessWidget {
  const ActionsBody({super.key, required this.controller});
  final SettingControllerImp controller;

  @override
  Widget build(BuildContext context) {
    return Column(
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
  }
}
