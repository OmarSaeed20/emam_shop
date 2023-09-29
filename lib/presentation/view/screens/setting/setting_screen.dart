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
            AccountBody(controller: controller),
            15.sH,
            SupportAnDAboutBody(controller: controller),
            15.sH,
            ActionsBody(controller: controller),
            100.sH,
          ],
        ),
      ),
    );
