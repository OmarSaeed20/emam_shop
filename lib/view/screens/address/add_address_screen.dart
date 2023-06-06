 
import '/index.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SelectNewAddress extends GetView<GetAddressDataControllerImp> {
  const SelectNewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint(controller.selectedIndexEnum.toString());
    return Scaffold(
      key: controller.scaffoldkey,
      bottomNavigationBar: controller.selectedIndexEnum == AdresEnm.addAddres
          ? bottmNaviBarAdd()
          : bottmNaviBarEdit(),
      appBar: AppBar(title: const Text('Select New Address')),
      body: GetBuilder<GetAddressDataControllerImp>(
        builder: (controller) {
          return GoogleMap(
            mapType: MapType.normal,
            markers: controller.marker.toSet(),
            onTap: (latLng) => controller.onTapMap(latLng),
            initialCameraPosition: CameraPosition(
              target: controller.selectedIndexEnum == AdresEnm.addAddres ||
                      controller.selectedIndexEnum == AdresEnm.addres
                  ? LatLng(
                      controller.position!.latitude,
                      controller.position!.longitude,
                    )
                  : LatLng(
                      double.parse(AddressControllerImp.to.editModel!.lat!),
                      double.parse(AddressControllerImp.to.editModel!.long!),
                    ),
              zoom: 14.4746,
            ),
            onMapCreated: (GoogleMapController controll) {
              controller.allMarker(
                controller.selectedIndexEnum == AdresEnm.addAddres
                    ? LatLng(
                        controller.position!.latitude,
                        controller.position!.longitude,
                      )
                    : LatLng(
                        double.parse(AddressControllerImp.to.editModel!.lat!),
                        double.parse(AddressControllerImp.to.editModel!.long!),
                      ),
              );
              // controller.completer!.complete(controll);
            },
          );
          /* controller.requestStatus != RequestStatus.loading
              ? GoogleMap(
                  mapType: MapType.normal,
                  markers: controller.marker.toSet(),
                  onTap: (latLng) => controller.onTapMap(latLng),
                  initialCameraPosition: CameraPosition(
                    target: controller.cameraPosition!,
                    zoom: 16.4746,
                  ),
                  onMapCreated: (GoogleMapController controll) {
                    controller.allMarker(
                      controller.selectedIndexEnum == AdresEnm.edit
                          ? LatLng(
                              double.parse(
                                  AddressControllerImp.to.editModel!.lat!),
                              double.parse(
                                  AddressControllerImp.to.editModel!.long!),
                            )
                          : LatLng(
                              controller.position!.latitude,
                              controller.position!.longitude,
                            ),
                    );
                    controller.completer.complete(controll);
                  },
                )
              : const Center(child: CircularProgressIndicator()); */
        },
      ),
    );
  }
}
