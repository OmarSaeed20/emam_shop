import 'package:dartz/dartz.dart';

import '../index.dart';

abstract class OffersController extends GetxController {
  Future<Either<RequestStatus, List<ItemsModel>>> getOffers();
}

class OffersControllerImp extends OffersController {
  static OffersControllerImp get to => Get.find();
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
    getOffers();
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }

  final List<ItemsModel> _offersList = [];
  List<ItemsModel> get offersList => _offersList;
  @override
  getOffers() async {
    _requestStatus = RequestStatus.loading;

    update();
    var response = await repo.getOffers(userId);
    _requestStatus = handlingRespose(response);

    if (_requestStatus == RequestStatus.success) {
      if (response["status"] == "success") {
        _offersList.clear();
        List result = response["data"];
        _offersList.addAll(result.map((e) => ItemsModel.fromJson(e)));
        _offersList.sort((a, b) => b.discount!.compareTo(a.discount!));

        update();
        return right(_offersList);
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
