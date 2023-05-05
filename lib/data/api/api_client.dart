import 'dart:convert';

import '/index.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  static ApiClient get to => Get.find();

  Future<Either<RequestStatus, Map>> postData(String uri, Map data) async {
    try {
      if (await checkInternetConnection()) {
        var response = await http.post(Uri.parse(uri), body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map result = jsonDecode(response.body);
          debugPrint("<<<POST Data>>> ${response.body}");
          return Right(result);
        } else {
          debugPrint("<POST Data-->serverFailure>");
          return const Left(RequestStatus.serverFailure);
        }
      } else {
        return const Left(RequestStatus.offLineFailure);
      }
    } catch (e) {
      debugPrint("catch<POST Data-->serverFailure> $e");
      return left(RequestStatus.serverFailure);
    }
  }
}
