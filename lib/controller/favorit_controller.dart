import 'package:flutter/cupertino.dart';

import '../index.dart';

abstract class FavoriteController extends GetxController {
  Future<void> onTapAddFavo(String itemsId);

  Future<void> onTapRemovefavo(String itemsId);

  Future<void> getFavourite();
}

class FavoriteControllerImp extends FavoriteController {
  static FavoriteControllerImp get to => Get.find();
  final RepositoryImp _repo = Get.find<RepositoryImp>();

  final DatabaseHelper database = Get.find();
  String userId = DatabaseHelper.to.getString(EndPoint.userId);
  @override
  void onInit() {
    getFavourite();
    super.onInit();
  }



  RequestStatus _requestStatus = RequestStatus.none;
  RequestStatus get requestStatus => _requestStatus;
  
  final List<String> _favoList = [];
  List<String> get favoList => _favoList;


  
  Map isFavor = {};
  void onTapSetFavorite(String id, String val) {
    debugPrint("isFavor>>>val>>>  $val");
    isFavor[id] = val;
    update();
  }

  onTapfavorit(String? itmId) {
    debugPrint(itmId.toString());
    if (isFavor[itmId] == "1") {
      onTapSetFavorite(itmId!, '0');
      onTapRemovefavo(itmId);
      update();
    } else {
      onTapSetFavorite(itmId!, '1');
      onTapAddFavo(itmId);
      update();
    }
  }

  late ResponseModel _response;

  Future<ResponseModel> _addFavo(itemsId) async {
    try {
      _requestStatus = RequestStatus.loading;
      update();
      final response = await _repo.addFavo(itemsId: itemsId, usersId: userId);
      _requestStatus = handlingRespose(response);
      if (_requestStatus == RequestStatus.success) {
        if (response['status'] == 'success') {
          _favoList.add(response['data']['itemsId']);
          _response = ResponseModel(true, response['message']);
          update();
        } else {
          _requestStatus = RequestStatus.noData;
          _response = ResponseModel(false, response['message']);
          update();
        }
      }
      update();
    } catch (error) {
      debugPrint('error in insert favourite ----> $error');
    } finally {
      if (_requestStatus != RequestStatus.none) {
        _requestStatus = RequestStatus.none;
        update();
      }
    }
    return _response;
  }

  @override
  Future<void> onTapAddFavo(itemsId) async {
    ResponseModel response = await _addFavo(itemsId);
    if (response.isSuccess) {
      debugPrint('message (success) ---> ${response.message}');
    } else {
      debugPrint('message (failure) ---> ${response.message}');
    }
  }

  Future<ResponseModel> _removeFavo(itemsId) async {
    try {
      _requestStatus = RequestStatus.loading;
      update();
      final response =
          await _repo.removeFavo(itemsId: itemsId, usersId: userId);
      _requestStatus = handlingRespose(response);
      if (_requestStatus == RequestStatus.success) {
        if (response['status'] == 'success') {
          _response = ResponseModel(true, response['message']);
        } else {
          _requestStatus = RequestStatus.noData;
          _response = ResponseModel(false, response['message']);
        }
      }
      update();
    } catch (error) {
      debugPrint('error in remove favourite ----> $error');
    } finally {
      if (_requestStatus != RequestStatus.none) {
        _requestStatus = RequestStatus.none;
        update();
      }
    }
    return _response;
  }

  @override
  Future<void> onTapRemovefavo(itemsId) async {
    ResponseModel response = await _removeFavo(itemsId);
    if (response.isSuccess) {
      _favoList.remove(itemsId);
    } else {
      debugPrint('message (failure) ---> ${response.message}');
    }
  }

  final List<FavoriteModel> _getFavList = [];
  List<FavoriteModel> get getFavList => _getFavList;
  @override
  Future<void> getFavourite() async {
    try {
      _getFavList.clear();
      _requestStatus = RequestStatus.loading;
      update();
      final response = await _repo.getFavo(userId: userId);
      _requestStatus = handlingRespose(response);
      if (_requestStatus == RequestStatus.success) {
        if (response['status'] == 'success') {
          List result = response["data"];
          _getFavList.addAll(result.map((e) => FavoriteModel.fromJson(e)));
          /* response['data'].forEach(
            (element) {
              _favouriteList.add(element['product_id']);
              for (var product in HomeControllerImp.to.allItems) {
                if (product.id == element['product_id']) {
                  _products.add(product);
                }
              }
            },
          ); */
        } else {
          _requestStatus = RequestStatus.noData;
        }
      }
      update();
    } catch (error) {
      debugPrint('error in get my favourite ----> $error');
    }
  }

  deleteFavourite(String favId) {
    _repo.deleteFromFavo(favId: favId);
    getFavList.removeWhere((element) => element.favoriteId == favId);
    update();
  }

  bool pain = false;
  IconData painIcon = CupertinoIcons.cart_badge_plus;
  void onAddPinUpdat() {
    debugPrint("$pain");
    pain = !pain;
    painIcon =
        !pain ? CupertinoIcons.cart_badge_plus : CupertinoIcons.cart_fill;
    update();
  }
}
