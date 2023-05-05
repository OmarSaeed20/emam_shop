// import 'dart:developer';

import 'dart:developer';

import '../data/model/user_model.dart';
import '/index.dart';

class TestController extends GetxController {
  AppRepo repo = Get.find();

  RequestStatus? requestStatus;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  UserModel? _userdata;
  UserModel? get userData => _userdata;
  Future<dynamic> getData() async {
    requestStatus = RequestStatus.loading;

    var response = await repo.getData();
    requestStatus = handlingRespose(response);

    if (requestStatus == RequestStatus.success) {
      if (response["status"] == "success") {
        _userdata = UserModel.fromJson(response["data"][0]);
        log(_userdata.toString());
        // _userdata.addAll(requst);
      } else {
        requestStatus = RequestStatus.noData;
      }
    }
    update();
  }
}
