import 'package:dartz/dartz.dart';

import '/index.dart';

class AppRepo {
  static AppRepo get to => Get.find();
  ApiClient api = ApiClient.to;

  Future<dynamic> getData() async {
    Either<RequestStatus, Map> requset = await api.postData(ApiLinks.test, {});
    return requset.fold((l) => l, (r) => r);
  }
}
