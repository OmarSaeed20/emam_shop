import 'package:dartz/dartz.dart';
import 'package:ecommerce/index.dart';

class MyOrderRepo {
  static MyOrderRepo get to => Get.find();
  ApiClient api = Get.find<ApiClient>();

  Future<dynamic> getOrderPending(String userId) async {
    Either<RequestStatus, Map> requset =
        await api.postData(ApiLinks.ordersPending, {"user_id": userId});
    return requset.fold((l) => l, (r) => r);
  }

  Future<dynamic> getOrderDetails(String orderId) async {
    Either<RequestStatus, Map> requset =
        await api.postData(ApiLinks.ordersdetails, {"orders_id": orderId});
    return requset.fold((l) => l, (r) => r);
  }
}
