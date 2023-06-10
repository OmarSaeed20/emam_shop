import '../index.dart';

abstract class NotificationController extends GetxController {
  Future<dynamic> getNotificationData();
}

class NotificationControllerImp extends NotificationController {
  static NotificationControllerImp get to =>
      Get.find<NotificationControllerImp>();

  NotificationRepo repo = Get.find<NotificationRepo>();

  final DatabaseHelper database = Get.find();
  late String userId;
  late String userName;
  late String userEmail;
  late String userPhone;
  RequestStatus _requestStatu = RequestStatus.none;
  RequestStatus get requestStatu => _requestStatu;
  init() {
    userId = database.getString(EndPoint.userId);
    userName = database.getString(EndPoint.userName);
    userEmail = database.getString(EndPoint.userEmail);
    userPhone = database.getString(EndPoint.userPhone);
    getNotificationData();
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }

  final List<NotificationModel> _notificationList = [];
  List<NotificationModel> get notificationList => _notificationList;
  @override
  Future<dynamic> getNotificationData() async {
    _requestStatu = RequestStatus.loading;
    update();
    var response = await repo.getNotification(usersid: userId);
    _requestStatu = handlingRespose(response);
    if (_requestStatu == RequestStatus.success) {
      if (response["status"] == "success") {
        _notificationList.clear();
        List result = response["data"];
        _notificationList
            .addAll(result.map((e) => NotificationModel.fromJson(e)));
        update();
        debugPrint("Notification >> $_notificationList");
      } else {
        _requestStatu = RequestStatus.noData;
        debugPrint('message geNotification  =>>RequestStatus.noData');
        update();
      }
      update();
    } else if (_requestStatu == RequestStatus.serverFailure ||
        _requestStatu == RequestStatus.serverException) {
      snackBarMessage(title: "warning", msg: "Please try again");
      update();
    } else {}
  }
}
