import 'package:dartz/dartz.dart';

import '../index.dart';

abstract class UserController extends GetxController {
  Future<Either<RequestStatus, UserModel>> getUserData();
}

class UserControllerImp extends UserController {
  static UserControllerImp get to => Get.find();
  RepositoryImp repo = Get.find<RepositoryImp>();

  final DatabaseHelper database = Get.find();
  late String userId;
  late String userName;
  late String userEmail;
  late String userPhone;

  late RequestStatus _requestStatus;
  RequestStatus get requestStatus => _requestStatus;

  init() {
    _requestStatus = RequestStatus.loading;
    userId = database.getString(EndPoint.userId);
    userName = database.getString(EndPoint.userName);
    userEmail = database.getString(EndPoint.userEmail);
    userPhone = database.getString(EndPoint.userPhone);
    getUserData();
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }

  UserModel? _userdata;
  UserModel? get userdata => _userdata;
  @override
  getUserData() async {
    _requestStatus = RequestStatus.loading;

    update();
    var response = await repo.getUserData(userid: userId);
    _requestStatus = handlingRespose(response);

    if (_requestStatus == RequestStatus.success) {
      if (response["status"] == "success") {
        var result = response["data"];
        _userdata = UserModel.fromJson(result);
        update();
        return right(_userdata!);
      } else {
        debugPrint('no : $_requestStatus');
        snackBarMessage(title: "warning", msg: response["data"]);
        update();
        return const Left(RequestStatus.noData);
      }
    } else {
      debugPrint("<Left  -->serverException>");
      update();
      return const Left(RequestStatus.serverException);
    }
  }
}
