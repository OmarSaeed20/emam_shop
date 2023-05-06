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
    Either<RequestStatus, Map> requset = await api
        .postData(ApiLinks.verfiySignUp, {"email": email, "verfiyCode": otp});
    return requset.fold((l) => l, (r) => r);
  }

  Future<dynamic> signin({
    required String email,
    required String password,
  }) async {
    Either<RequestStatus, Map> requset = await api
        .postData(ApiLinks.signin, {"email": email, "password": password});
    return requset.fold((l) => l, (r) => r);
  }

  Future<dynamic> foSetEmail({required String email}) async {
    Either<RequestStatus, Map> requset =
        await api.postData(ApiLinks.foSetEmail, {"email": email});
    return requset.fold((l) => l, (r) => r);
  }

  Future<dynamic> foSetOtp({required String email, required String otp}) async {
    Either<RequestStatus, Map> requset = await api
        .postData(ApiLinks.foSetOtp, {"email": email, "verfiyCode": otp});
    return requset.fold((l) => l, (r) => r);
  }

  Future<dynamic> foSetNewPass(
      {required String email, required String password}) async {
    Either<RequestStatus, Map> requset = await api.postData(
        ApiLinks.foSetNewPass, {"email": email, "password": password});
    return requset.fold((l) => l, (r) => r);
  }
}
