import 'dart:convert';
import 'dart:developer';

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
        log("<POST Data-->offLineFailure>");
        return const Left(RequestStatus.offLineFailure);
      }
    } catch (e) {
      log("catch<POST Data-->serverException> $e");
      return left(RequestStatus.serverException);
    }
  }
  
  Future<Either<RequestStatus, Map>> getData(String uri) async {
    try {
      if (await checkInternetConnection()) {
        var response = await http.post(Uri.parse(uri), body: {});
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map result = jsonDecode(response.body);
          debugPrint("<<<get Data>>> ${response.body}");
          return Right(result);
        } else {
          debugPrint("<get Data--> serverFailure >");
          return const Left(RequestStatus.serverFailure);
        }
      } else {
        log("<get Data--> offLineFailure >");
        return const Left(RequestStatus.offLineFailure);
      }
    } catch (e) { 
      log("catch<get Data-->serverException> $e");
      return left(RequestStatus.serverException);
    }
  }
}
