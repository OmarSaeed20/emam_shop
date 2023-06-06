import 'dart:async'; 

import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '/index.dart';

abstract class AddressController extends GetxController {
  // goToSelectNewAddress(AddresEnum addresEnum);
}

class AddressControllerImp extends AddressController {
  static AddressControllerImp get to => Get.find();

  AddressRepo repo = Get.find();
  DatabaseHelper database = Get.find();
  GetAddressDataControllerImp getAddrContro = Get.find();

  String? lang;
  String userId = DatabaseHelper.to.getString(EndPoint.userId);

  late RequestStatus _requestStatus;
  RequestStatus get requestStatus => _requestStatus;

  Completer<GoogleMapController>? completer;

  TextEditingController? editAddress;
  TextEditingController? editlandMark;
  TextEditingController? edituserName;
  TextEditingController? editTitle;
  Future<void> editInit() async {
    await getAddrContro.init(AdresEnm.edit);
    update();
  }

  init() async {
    _requestStatus = RequestStatus.loading;
    update();
    completer = Completer<GoogleMapController>();
    await getAddressView();
    update();
  }

  @override
  void onInit() {
    lang = database.getString(EndPoint.lang);
    init();
    super.onInit();
  }

  LabeledGlobalKey<ScaffoldState> scaffoldkey = LabeledGlobalKey("my_address");

  IconData icon = FontAwesome.github;
  IconData icon2 = Octicons.bold;

  AddressModel? editModel;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // @override
  goToSelectNewAddress({AdresEnm? addrEnum, AddressModel? model}) {
    debugPrint('goToSelectNewAddress >>>>  ?>>>? $addrEnum');

    getAddrContro.selectedIndexEnum = addrEnum;
    _requestStatus = RequestStatus.loading;
    update();
    try {
      if (addrEnum == AdresEnm.addAddres) {
        getAddrContro.init(AdresEnm.addAddres).then((value) {
          if (getAddrContro.cameraPosition != null) {
            Get.toNamed(RouteHelper.getSelectNewAddress());
          }
        });
        _requestStatus = RequestStatus.success;

        update();
      } else {
        getAddrContro.selectedIndexEnum = AdresEnm.edit;
        editModel = model;
        debugPrint("editModel??????????>>>>> $editModel");
        editInit().then((value) {
          debugPrint(
              'editInit getAddrContro.addrsEdit>>>>>>>>>${getAddrContro.addrsEdit}');
          editAddress =
              TextEditingController(text: "${getAddrContro.addrsEdit} ");
          editlandMark = TextEditingController(text: "${editModel!.landmark}");
          edituserName = TextEditingController(text: "${editModel!.fullName}");
          editTitle = TextEditingController(text: "${editModel!.title}");
          getAddrContro.lat = double.parse(editModel!.lat!);
          getAddrContro.long = double.parse(editModel!.long!);
          debugPrint('editInit  ?>>>? $addrEnum');

          Get.toNamed(RouteHelper.getSelectNewAddress());
        });

        _requestStatus = RequestStatus.success;

        update();
      }
    } catch (e) {
      debugPrint("$e");
      _requestStatus = RequestStatus.none;
      update();
    }
    // Get.toNamed(RouteHelper.getSelectNewAddress());
  }

  AddressModel? selectedAdressmodel;
  continueToCheckOut({required AddressModel addrModel}) {
    selectedAdressmodel = addrModel;
    debugPrint(selectedAdressmodel.toString());
    Get.back();
    update();
  }

  final List<AddressModel> _listaddress = [];
  List<AddressModel> get listaddress => _listaddress;

  Future<void> getAddressView() async {
    try {
      _requestStatus = RequestStatus.loading;
      update();
      final response = await repo.getAddressView(userId: userId);
      _requestStatus = handlingRespose(response);
      if (_requestStatus == RequestStatus.success) {
        if (response['status'] == 'success') {
          _listaddress.clear();
          List result = response["data"];
          _listaddress.addAll(result.map((e) => AddressModel.fromJson(e)));
          update();
        } else {
          _requestStatus = RequestStatus.noData;
          update();
        }
      }
      update();
    } catch (error) {
      debugPrint('error in get my cart ----> $error');
    } finally {
      _requestStatus = RequestStatus.none;
      update();
    }
  }

  Future<void> onTapAddAddress() async {
    _requestStatus = RequestStatus.loading;
    update();
    AddressModel model = AddressModel(
      addressId: '',
      usersid: userId,
      fullAddress: getAddrContro.getAddress!.text,
      fullName: getAddrContro.userName!.text,
      landmark: getAddrContro.landMark!.text,
      title: getAddrContro.adrressTitle!.text,
      lat: getAddrContro.lat == null
          ? "${getAddrContro.position!.latitude}"
          : "${getAddrContro.lat}",
      long: getAddrContro.long == null
          ? "${getAddrContro.position!.longitude}"
          : "${getAddrContro.long}",
    );
    debugPrint(model.toString());
    debugPrint("${getAddrContro.lat} -- -- -- ${getAddrContro.long}");

    final response = await repo.addAddress(body: model.toJson());
    _requestStatus = handlingRespose(response);
    if (_requestStatus == RequestStatus.success) {
      if (response['status'] == 'success') {
        debugPrint(' (success) ---> ${response["message"]}');
        getAddressView();
        update();
      } else {
        _requestStatus = RequestStatus.noData;
        debugPrint(' (success) ---> ${response["message"]}');
        update();
      }
    }
    update();
  }

  AddressModel? modelVl;
  Future<void> onTapEditAddress(String addressId) async {
    _requestStatus = RequestStatus.loading;
    update();
    AddressModel model = AddressModel(
      addressId: addressId,
      usersid: userId,
      fullAddress: "${editAddress!.text} ",
      fullName: "${edituserName!.text} ",
      landmark: "${editlandMark!.text} ",
      title: "${editTitle!.text} ",
      lat: getAddrContro.lat == null
          ? "${editModel!.lat}"
          : "${getAddrContro.lat}",
      long: getAddrContro.long == null
          ? "${editModel!..long}"
          : "${getAddrContro.long}",
    );
    modelVl = model;
    debugPrint(model.toString());
    debugPrint("${getAddrContro.lat} -- -- -- ${getAddrContro.long}");

    final response = await repo.editAddress(body: model.toJson());
    _requestStatus = handlingRespose(response);
    if (_requestStatus == RequestStatus.success) {
      if (response['status'] == 'success') {
        debugPrint(' (success) ---> ${response["message"]}');
        await getAddressView();
        update();
      } else {
        _requestStatus = RequestStatus.noData;
        debugPrint(' (success) ---> ${response["message"]}');
        update();
      }
    }
    update();
  }

  deleteAddress(String addressId) {
    repo.deleteAddress(addressId: addressId);
    listaddress.removeWhere((element) => element.addressId == addressId);
    snackBarSuccess(msg: "address deleted sccessfly");
    update();
  }
}

enum AdresEnm { addres, addAddres, cancel, edit }
