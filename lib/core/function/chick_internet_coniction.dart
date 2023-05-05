import 'package:connectivity/connectivity.dart';

import '/index.dart';
/* 
chickInternetConiction() async {
  try {
    var result = await InternetAddress.lookup("google.com");
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      log("success conect");
      // Get.back();
      return true;
    }
  } on SocketException catch (_) {
    // Get.back();
    snackBarInternetError();
    return false;
  }
} */

Future<bool> checkInternetConnection() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile ||
      connectivityResult == ConnectivityResult.wifi) {
    // snackBarSuccess(msg: "connected wifi successflly");
    return true;
  } else {
    snackBarChickInternetConnection(false);
    return false;
  }
}

Future<bool> retryCheckInternetConnection() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile ||
      connectivityResult == ConnectivityResult.wifi) {
    snackBarChickInternetConnection(true);
    return true;
  } else {
    snackBarChickInternetConnection(false);
    return false;
  }
}
