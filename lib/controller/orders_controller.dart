import '../index.dart';

abstract class MyOrderController extends GetxController {}

class MyOrderControllerImp extends MyOrderController {
  static MyOrderControllerImp get to => Get.find();
  

  final DatabaseHelper database = Get.find();
  late String userId;
  late String userName;
  late String userEmail;
  late String userPhone;

  init() {
    userId = database.getString(EndPoint.userId);
    userName = database.getString(EndPoint.userName);
    userEmail = database.getString(EndPoint.userEmail);
    userPhone = database.getString(EndPoint.userPhone);
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }
}
