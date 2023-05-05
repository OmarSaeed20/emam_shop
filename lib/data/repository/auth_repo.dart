import 'package:dartz/dartz.dart';

import '/index.dart';

class AuthRepo {
  static AuthRepo get to => Get.find();
  ApiClient api = ApiClient.to;

  Future<dynamic> getData() async {
    Either<RequestStatus, Map> requset = await api.postData(ApiLinks.test, {});
    return requset.fold((l) => l, (r) => r);
  }

  Future<dynamic> signUp({required SignUpModel body}) async {
    Either<RequestStatus, Map> requset =
        await api.postData(ApiLinks.signUp, body.toJson());
    return requset.fold((l) => l, (r) => r);
  }

  Future<dynamic> verifyOtp({
    required String email,
    required String otp,
  }) async {
    Either<RequestStatus, Map> requset =
        await api.postData(ApiLinks.verfiySignUp, {
      "email": email,
      "verfiyCode": otp,
    });
    return requset.fold((l) => l, (r) => r);
  }
}
