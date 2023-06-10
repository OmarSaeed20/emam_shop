import 'package:dartz/dartz.dart';
import 'package:ecommerce/index.dart';

class NotificationRepo {
  static NotificationRepo get to => Get.find();
  ApiClient api = ApiClient.to;

  Future<dynamic> getNotification({required String usersid}) async {
    Either<RequestStatus, Map> requset =
        await api.postData(ApiLinks.notification, {"user_id": usersid});
    return requset.fold((l) => l, (r) => r);
  }
}
