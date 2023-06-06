import '../index.dart';

abstract class MyOrderController extends GetxController {}

class MyOrderControllerImp extends MyOrderController {
  static MyOrderControllerImp get to => Get.find();
  MyOrderRepo repo = Get.find<MyOrderRepo>();

  final DatabaseHelper database = Get.find();
  late String userId;
  late String userName;
  late String userEmail;
  late String userPhone;

  RequestStatus _requestStatus = RequestStatus.none;
  RequestStatus get requestStatus => _requestStatus;

  init() {
    userId = database.getString(EndPoint.userId);
    userName = database.getString(EndPoint.userName);
    userEmail = database.getString(EndPoint.userEmail);
    userPhone = database.getString(EndPoint.userPhone);
    getPendingOrder();
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }

  final List<MyOrdersModel> _myOrders = [];
  List<MyOrdersModel> get myOrders => _myOrders;

  Future<void> getPendingOrder() async {
    _requestStatus = RequestStatus.loading;
    update();
    var response = await repo.getOrderPending(userId);
    _requestStatus = handlingRespose(response);
    if (_requestStatus == RequestStatus.success) {
      if (response["status"] == "success") {
        _myOrders.clear();
        _requestStatus = RequestStatus.success;
        List result = response["data"];
        _myOrders.addAll(result.map((e) => MyOrdersModel.fromJson(e)));
      } else {
        _requestStatus = RequestStatus.noData;
        snackBarMessage(title: "warning", msg: response["data"]);
      }
      update();
    }
  }
}
