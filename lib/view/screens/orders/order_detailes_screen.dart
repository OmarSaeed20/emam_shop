import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../index.dart';

class OrdersDetailesScreen extends StatelessWidget {
  const OrdersDetailesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Orders Detailes')),
      body: Container(
          padding: paddingSymme(horizontal: 12, vertical: 6),
          child: GetBuilder<MyOrderControllerImp>(
            builder: (controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        "ID : #${controller.orderData!.id}",
                        color: AppColors.primary2,
                        fontWeight: FontWeight.w600,
                      ),
                      // myOrderText(controller.printOrderStatus(data.status!)),
                    ],
                  ),
                  const Divider(),
                  tableSection(controller),
                  const Divider(),
                  10.sH,
                  addressSection(controller),
                ],
              );
            },
          )),
    );
  }

  addressSection(MyOrderControllerImp controller) {
    OrdersModel? data = controller.orderData;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget("Address", spacing: 1.weight),
        10.sH,
        Card(
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          color: AppColors.whiteNice,
          elevation: 5,
          child: Container(
            width: double.infinity,
            padding: paddingOnly(top: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: paddingOnly(left: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget("Title : ${data!.addressTitle}", fontSize: 14),
                      5.sH,
                      TextWidget(
                        "Full Address : ${data.fullAddress}",
                        fontSize: 14,
                      ),
                    ],
                  ),
                ),
                6.sH,
                SizedBox(
                  height: 235.height,
                  width: double.infinity,
                  child: GoogleMap(
                    mapType: MapType.normal,
                    markers: controller.marker.toSet(),
                    initialCameraPosition: CameraPosition(
                      target: LatLng(controller.lat!, controller.long!),
                      zoom: 14.4746,
                    ),
                    onMapCreated: (GoogleMapController controll) {
                      controller.allMarker();
                      controller.completer!.complete(controll);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  tableSection(MyOrderControllerImp controller) {
    List<OrderDetailsModel> data = controller.orderDetails;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget("Order", spacing: 1.weight),
        10.sH,
        Card(
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          color: AppColors.whiteNice,
          elevation: 5,
          child: Padding(
            padding: paddingOnly(top: 6, left: 6, right: 6, bottom: 10),
            child: Column(
              children: [
                Table(
                  children: [
                    TableRow(
                      children: [
                        myOrderText("Item"),
                        myOrderText("QTY"),
                        myOrderText("Price"),
                      ],
                    ),
                    ...List.generate(
                      data.length,
                      (i) => TableRow(
                        children: [
                          TextWidget(
                            "${data[i].itemsName}",
                            maxLines: 2,
                            overFlow: TextOverflow.ellipsis,
                            fontSize: 14,
                          ),
                          TextWidget(
                            "${data[i].countitems}",
                            textAlign: TextAlign.center,
                            color: AppColors.awsm,
                            overFlow: TextOverflow.ellipsis,
                            fontSize: 14,
                          ),
                          TextWidget(
                            "${data[i].discountPrice} \$",
                            textAlign: TextAlign.center,
                            overFlow: TextOverflow.ellipsis,
                            color: AppColors.awsm,
                            fontSize: 14,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                10.sH,
                Center(
                  child: TextWidget(
                    "Total Price : ${controller.orderData!.totalPrice} \$",
                    fontFamily: AppStrings.montserrat,
                    fontWeight: FontWeight.w600,
                    color: AppColors.awsm,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  myOrderText(text) {
    return TextWidget(
      text,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      textAlign: TextAlign.center,
      color: AppColors.primary,
    );
  }
}
