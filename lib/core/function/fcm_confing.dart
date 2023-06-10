import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

import '../../index.dart';

requestSendNorificationPermission() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  debugPrint(
      'User granted permission: >>>>>>>>>>?  ${settings.authorizationStatus}');
}

fcmConfing() {
  FirebaseMessaging.onMessage.listen((message) {
    debugPrint("================= Notification =================");
    debugPrint("title =================>>  ${message.notification!.title}");
    debugPrint("body  =================>>  ${message.notification!.body}");
    refreshPageNotification(message.data);

    FlutterRingtonePlayer.playNotification();
    Get.snackbar(
        "${message.notification!.title}", " ${message.notification!.body}");
  });
}

refreshPageNotification(Map<String, dynamic> data) {
  debugPrint("pageid ======>>>>>>>>>>>>>${data["pageid"]}");
  debugPrint("pagename ======>>>>>>>>>>>>>${data["pagename"]}");
  debugPrint("currentRoute ======>>>>>>>>>>>>>${Get.currentRoute}"); 
  handleNotificationEnum(data["pagename"]);
  if (Get.currentRoute == RouteHelper.getNotifications()) {
    NotificationControllerImp.to.getNotificationData();
  }
}

handleNotificationEnum(String pageName) {
  switch (pageName) {
    case "order":
      return orderRefesh();
    case "addres":
      return addressRefesh();
    case "profile":
      return profileRefesh();
    default:
  }
}

profileRefesh() {}

addressRefesh() {}

orderRefesh() {
  if (Get.currentRoute == RouteHelper.getMyOrders()) {
    MyOrderControllerImp.to.getPendingOrder1();
  }
}
