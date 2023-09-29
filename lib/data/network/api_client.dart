import 'dart:convert';

import '/index.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  static ApiClient get to => Get.find();

  Future<Either<RequestStatus, Map>> postData(String uri, Map data) async {
    try {
      if (await checkInternetConnection()) {
        var response = await http
            .post(Uri.parse(uri), body: data)
            .timeout(const Duration(seconds: 60));
          debugPrint("<<<POST Data>>> ${response.statusCode}");
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map result = jsonDecode(response.body);
          debugPrint("<<<POST Data>>> ${response.body}");
          return Right(result);
        } else {
          debugPrint("<POST Data-->serverFailure>");
          return const Left(RequestStatus.serverFailure);
        }
      } else {
        debugPrint("<POST Data-->offLineFailure>");
        return const Left(RequestStatus.offLineFailure);
      }
    } catch (e) {
      debugPrint("catch<POST Data-->serverException> $e");
      return left(RequestStatus.serverException);
    }
  }

  Future<Either<RequestStatus, Map>> getData(String uri) async {
    try {
      if (await checkInternetConnection()) {
        var response = await http.post(Uri.parse(uri),
            body: {}).timeout(const Duration(seconds: 60));
          debugPrint("<<<get Data>>> ${response.statusCode}");
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map result = jsonDecode(response.body);
          debugPrint("<<<get Data>>> ${response.body}");
          return Right(result);
        } else {
          debugPrint("<get Data--> serverFailure >");
          return const Left(RequestStatus.serverFailure);
        }
      } else {
        debugPrint("<get Data--> offLineFailure >");
        return const Left(RequestStatus.offLineFailure);
      }
    } catch (e) {
      debugPrint("catch<get Data-->serverException> $e");
      return left(RequestStatus.serverException);
    }
  }
/* 
  Future<Either<Failure, dynamic>> postDataTest(String uri, Map data) async {
    try {
      if (await checkInternetConnection()) {
        var response = await http.post(Uri.parse(uri), body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map result = jsonDecode(response.body);
          debugPrint("<<<POST Data>>> ${response.body}");
          return Right(result);
        } else {
          debugPrint("<POST Data-->serverFailure>");
          snackBarMessage(msg: "${response.statusCode}");
          return Left(Failure(response.statusCode, "server Failure"));
        }
      } else {
        debugPrint("<POST Data--> offLine Failure>");
        return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
      }
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      debugPrint("catch<POST Data--> server Exception> $e");
      return left(ErrorHandler.handle(e).failure);
    }
  }

  Future<Either<Failure , dynamic>> postDataTest2(
      String uri, Map data) async {
    try {
      http.Response response = await http.post(Uri.parse(uri), body: data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map result = jsonDecode(response.body);
        debugPrint("<<<POST Data>>> ${response.body}");
        return Right(result);
      } else {
        debugPrint("<POST Data-->serverFailure>");
        snackBarMessage(msg: "${response.statusCode}");
        return Left(DataSource.NOT_FOUND.getFailure());
      }
    } on SocketException catch (e) {
      throw SocketException("SocketException>>>>>>>>>$e");
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      debugPrint("catch<POST Data--> server Exception> $e");
      return left(ErrorHandler.handle(e).failure);
    }
  } */
}
