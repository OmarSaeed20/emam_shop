import 'dart:async'; 

import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import '/index.dart';

abstract class GetAddressDataController extends GetxController {}

class GetAddressDataControllerImp extends GetAddressDataController {
  static GetAddressDataControllerImp get to => Get.find();

  DatabaseHelper database = Get.find();
  String? lang;
  // String? userName;

  RequestStatus _requestStatus = RequestStatus.loading;
  RequestStatus get requestStatus => _requestStatus;

  Completer<GoogleMapController>? completer;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();

  String addrsEdit = "";
  TextEditingController? getAddress;
  TextEditingController? landMark;
  TextEditingController? userName;
  TextEditingController? adrressTitle;

  _inittControllers() {
    debugPrint("inittControllers selectedIndexEnum  $selectedIndexEnum");
    landMark = TextEditingController();
    userName =
        TextEditingController(text: database.getString(EndPoint.userName));
    adrressTitle = TextEditingController();
  }

  close() {
    Get.delete<GetAddressDataControllerImp>();
    /*   getAddress.dispose();
    userName!.dispose();
    landMark.dispose();
    adrressTitle.dispose(); */
  }

  Future<void> init(AdresEnm enm) async {
    selectedIndexEnum = enm;
    completer = Completer<GoogleMapController>();
    debugPrint("init >>>>>>>> $enm  ");

    if (enm == AdresEnm.addAddres) {
      _requestStatus = RequestStatus.loading;
      update();
      _inittControllers();
      await getCurrentPostion();
      debugPrint("$_requestStatus 11");
      await getCurrentAddress();
      debugPrint("$_requestStatus 22");
      update();
    }
    if (enm == AdresEnm.edit) {
      _requestStatus = RequestStatus.loading;
      update();
      debugPrint("$_requestStatus 1e");
      await getCurrentAddress();
      debugPrint("$_requestStatus 2e");
      _requestStatus = RequestStatus.none;
      update();
    }
  }

  @override
  void onInit() {
    lang = database.getString(EndPoint.lang);
    super.onInit();
  }

  // if there is no location permission then we that
  Future<Position> getCurrentPostion() async {
    LocationPermission? permission;
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        snackBarMessage(title: "Error", msg: "Location permission are denied");
        return Future.error('Location permission are denied');
      }
    }
    return Geolocator.getCurrentPosition();
  }

  // get location
  LatLng? cameraPosition;
  Position? _position;
  Position? get position => _position;
  Future<void> getCurrentAddress({LatLng? latLng}) async {
    _requestStatus = RequestStatus.loading;
    update();
    try {
      _position = await getCurrentPostion();
      latLng = LatLng(
        selectedIndexEnum == AdresEnm.addAddres
            ? _position!.latitude
            : double.parse(AddressControllerImp.to.editModel!.lat!),
        selectedIndexEnum == AdresEnm.addAddres
            ? _position!.longitude
            : double.parse(AddressControllerImp.to.editModel!.long!),
      );
      debugPrint("latLng ????  >>>>>>>>>>>> $latLng");
      debugPrint(" getCurrentAddress Enum ????  > >>>>>>>> $selectedIndexEnum");
      if (selectedIndexEnum != AdresEnm.edit) {
        debugPrint("_position ${_position!.latitude} || ${_position!.longitude}");
        cameraPosition = LatLng(latLng.latitude, latLng.longitude);
        await getLocationFromLatLong(latLng.latitude, latLng.longitude);
        _requestStatus = RequestStatus.success;
        update();
      } else {
        await getLocationFromLatLong(latLng.latitude, latLng.longitude);
        cameraPosition = LatLng(latLng.latitude, latLng.longitude);
        _requestStatus = RequestStatus.success;
        update();
      }
    } catch (error) {
      debugPrint('error in get current address ---> $error');
      update();
    }
    debugPrint(" cameraPosition >>>>>  $cameraPosition");
    _requestStatus = RequestStatus.success;
    update();
  }

  Future<void> addOtherAddress({LatLng? latLng}) async {
    _requestStatus = RequestStatus.loading;
    update();
    try {
      debugPrint("latLng ????  >>>>>>>>>>>> $latLng");
      await getLocationFromLatLong(latLng!.latitude, latLng.longitude);
      cameraPosition = LatLng(latLng.latitude, latLng.longitude);

      update();
    } catch (error) {
      debugPrint('error in get current address ---> $error');
      update();
    }
    _requestStatus = RequestStatus.none;
    debugPrint(" cameraPosition >>>>>  $cameraPosition");
    update();
  }

  // get address from lat long
  // String? getAddress;
  // String? get getAddress => _getAddress;
  Future<void> getLocationFromLatLong(lat, long) async {
    _requestStatus = RequestStatus.loading;
    update();
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
      Placemark place = placemarks[0];
      if (place.administrativeArea!.isNotEmpty) {
        debugPrint(" getLocationFromLatLong Enum>>>>> $selectedIndexEnum");
        if (selectedIndexEnum == AdresEnm.addAddres) {
          getAddress = TextEditingController(
              text:
                  '${place.administrativeArea}/ ${place.subAdministrativeArea}/ ${place.locality}/ ${place.name}');
          debugPrint(" getAddress>>>>> $getAddress");
        }
        addrsEdit =
            '${place.administrativeArea}/ ${place.subAdministrativeArea}/ ${place.locality}/ ${place.name}';
        AddressControllerImp.to.editAddress =
            TextEditingController(text: "$addrsEdit ");
        debugPrint(" addrsEdit   >>>>> $addrsEdit");

        _requestStatus = RequestStatus.success;
        update();
      } else {
        _requestStatus = RequestStatus.noData;
        update();
      }
    } catch (error) {
      debugPrint('error in get current Lat, Long ---> $error');
    } finally {
      _requestStatus = RequestStatus.none;
      update();
    }
  }

  onTapMap(LatLng latLng) {
    allMarker(latLng);
    addOtherAddress(latLng: latLng);
    update();
  }

  AdresEnm? selectedIndexEnum;
  changeSelectedIndex({String? addressId}) async {
    debugPrint(">>>>>>>>>>>> $selectedIndexEnum");
    AddressControllerImp addrController = AddressControllerImp.to;
    if (selectedIndexEnum == AdresEnm.addAddres) {
      if (formKey.currentState!.validate()) {
        debugPrint("contuie");
        selectedIndexEnum = AdresEnm.addres;
        update();
      }
    } else if (selectedIndexEnum == AdresEnm.addres) {
      debugPrint("add");
      addrController.onTapAddAddress().then((value) {
        snackBarSuccess();
        Get.delete<GetAddressDataControllerImp>();
        Get.offNamed(RouteHelper.getDeliveryAddress());
      });
      update();
    } else if (selectedIndexEnum == AdresEnm.cancel) {
      selectedIndexEnum = AdresEnm.addAddres;
      update();
    } else if (selectedIndexEnum == AdresEnm.edit) {
      if (addrController.formKey.currentState!.validate()) {
        if (addrController.modelVl != addrController.editModel) {
          await addrController.onTapEditAddress(addressId!).then((value) {
            snackBarSuccess();
            Get.delete<GetAddressDataControllerImp>();
            Get.offNamed(RouteHelper.getDeliveryAddress());
          });
          update();
        } else {
          Get.back();
        }
      }
    }
    update();
  }

  double? lat;
  double? long;
  List<Marker> marker = <Marker>[];
  allMarker(LatLng? latLng) {
    marker.clear();
    marker.add(Marker(
      markerId: const MarkerId("1"),
      position: latLng!,
    ));
    lat = latLng.latitude;
    long = latLng.longitude;

    update();
  }
}
