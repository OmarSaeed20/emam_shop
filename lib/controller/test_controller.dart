// import 'dart:developer';

import 'dart:developer';

import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/octicons_icons.dart';

import '/index.dart';

class TestController extends GetxController {
  RepositoryImp repo = Get.find();

  RequestStatus requestStatus = RequestStatus.none;
  final DatabaseHelper database = Get.find();
  late String userId;
  late String userName;
  late String userEmail;
  late String userPhone;

  init() {
    requestStatus = RequestStatus.loading;
    userId = database.getString(EndPoint.userId);
    userName = database.getString(EndPoint.userName);
    userEmail = database.getString(EndPoint.userEmail);
    userPhone = database.getString(EndPoint.userPhone);
    getData();
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }

  UserModel? _userdata;
  UserModel? get userData => _userdata;
  Future<dynamic> getData() async {
    requestStatus = RequestStatus.loading;
    update(); 
    var response = await repo.getUserData(userid: userId);
    requestStatus = handlingRespose(response);
    debugPrint("++++++++++++++>>>>>>>$requestStatus");

    if (requestStatus == RequestStatus.success) {
      if (response["status"] == "success") {
        _userdata = UserModel.fromJson(response["data"]);
        log(_userdata.toString());
        // _userdata.addAll(requst);
      } else {
        requestStatus = RequestStatus.noData;
      }
    }
    update();
  }

//////////////////////////////  Binary   ///////////////////////////
  /* // List<CategoriesModel>? categories = HomeControllerImp.to.categories;

  CategoriesModel? getCategoryByIdLinear2(int id) {
    // Use linear search to find a category by its ID
    for (var i = 0; i < categories!.length; i++) {
      categories!.sort();
      if (int.parse(categories![i].id!) == id) {
        return categories![i];
      }
    }
    return null;
  }

  CategoriesModel? getCategoryByIdLinear(int id) {
    // Use linear search to find a category by its ID
    return categories!.firstWhere(
      (category) => int.parse(category.id!) == id,
      orElse: () => const CategoriesModel(),
    );
  }

  CategoriesModel? getCategoryByIdBinary(int id) {
    // Use binary search to find a category by its ID
    var start = 0;
    var end = categories!.length - 1;
    while (start <= end) {
      var mid = (start + end) ~/ 2;
      if (int.parse(categories![mid].id!) == id) {
        return categories![mid];
      } else if (int.parse(categories![mid].id!) < id) {
        start = mid + 1;
      } else {
        end = mid - 1;
      }
    }
    return null;
  }

  CategoriesModel? getCategoryByNameBinary(String name) {
    // Use binary search to find a category by its name
    log('start');
    var left = 0;
    var right = categories!.length - 1;
    while (left <= right) {
      var mid = (left + right) ~/ 2;
      if (categories![mid].name == name) {
        log('categories![mid]');
        return categories![mid];
      } else if (categories![mid].name!.compareTo(name) < 0) {
        log('left');
        left = mid + 1;
      } else {
        log('right');
        right = mid - 1;
      }
    }
    return null;
  }
 */
  ///////////////////////// Sort

  List<int> listint = [4, 5, 8, 0, 1, 7, 9, 7, 12, 3, 2];
  void bubbleSort(List<int> list) {
    int n = list.length;

    for (int i = 0; i < n - 1; i++) {
      for (int j = 0; j < n - i - 1; j++) {
        if (list[j] > list[j + 1]) {
          // swap arr[j] and arr[j+1]
          int temp = list[j];
          list[j] = list[j + 1];
          list[j + 1] = temp;
        }
      }
    }
  }

  IconData icon = FontAwesome.github;
  IconData icon2 = Octicons.bold;
}
