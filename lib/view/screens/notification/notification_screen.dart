import '../../../index.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: GetBuilder<NotificationControllerImp>(
        builder: (controller) => ListView.builder(
          itemCount: controller.notificationList.length,
          itemBuilder: (context, i) => NotificationItem(
            title: controller.notificationList[i].title!,
            content: controller.notificationList[i].body!,
            time: controller.notificationList[i].datatime!,
          ),
        ),
      ),
    );
  }
}
