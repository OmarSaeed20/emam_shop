import '../../../../../../index.dart';

class ContactusPage extends StatelessWidget {
  const ContactusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contactus')),
      body: GetBuilder<SettingControllerImp>(
        builder: (controller) {
          return HandlingRequstView(
            RequestStatus.success,
            widget: ListView.builder(
              itemCount: controller.contactusListData.length,
              itemBuilder: (context, index) {
                ContactusData data = controller.contactusListData[index];
                return ListTileWidget(
                  dense: false,
                  horizontalTitleGap: 4,
                  onTap: () {
                    controller.launchUrll(data.url);
                  },
                  leadingImg: data.img,
                  title: data.title,
                  subtitle: data.supTitle,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
