import 'package:get/get_connect/http/src/response/response.dart';

class Failure {
  int code; // 200, 201, 400, 303..500 and so on
  String message; // error , success

  Failure(this.code, this.message);
}

class ApiResponse {
  final Response? response;
  final dynamic error;

  ApiResponse(this.response, this.error);

  ApiResponse.withError(dynamic errorValue)
      : response = null,
        error = errorValue;

  ApiResponse.withSuccess(Response responseValue)
      : response = responseValue,
        error = null;
}
