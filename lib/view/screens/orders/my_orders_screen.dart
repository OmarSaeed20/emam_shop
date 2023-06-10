import '../../../index.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Orders')),
      body: GetBuilder<MyOrderControllerImp>(
        builder: (controller) {
          return ListView.builder(
              itemCount: controller.myOrders.length,
              itemBuilder: (context, i) {
                return HandlingRequstView(
                  controller.requestStatus,
                  widget: listOrdersCard(controller, controller.myOrders[i]),
                );
              });
        },
      ),
    );
  }

  Container listOrdersCard(MyOrderControllerImp controller, OrdersModel? list) {
    return Container(
      margin: paddingSymme(horizontal: 12, vertical: 4),
      child: Card(
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
        elevation: 5,
        color: AppColors.cardColor,
        child: Container(
          padding: paddingSymme(horizontal: 12, vertical: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      TextWidget(
                        "ID : #${list!.id}",
                        color: AppColors.primary2,
                        fontWeight: FontWeight.w600,
                      ),
                      12.sW,
                      TextWidget(
                        calculationTime(list.datetime!),
                        color: AppColors.greyDeep,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.cancel,
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
              const Divider(),
              myOrderText(
                  "Status : ${controller.printOrderStatus(list.status!)}"),
              myOrderText(
                  "Payment : ${controller.printPayment(list.paymentMethod!)}"),
              myOrderText(
                  "Order Type : ${controller.printOrderType(list.type!)}"),
              // myOrderText("Time :${calculationTime(list.datetime!)} "),
              myOrderText("Price : ${list.price} \$"),
              myOrderText("Delivery Price : ${list.deliveryPrice} \$"),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    "Total Price : ${list.totalPrice} \$",
                    fontFamily: AppStrings.montserrat,
                    fontWeight: FontWeight.w600,
                    color: AppColors.awsm,
                  ),
                  BtnWidget(
                    "Details",
                    height: 30,
                    width: 95.weight,
                    backgroundColor: AppColors.trans,
                    border: BorderSide(width: .5.weight, color: AppColors.awsm),
                    color: AppColors.awsm,
                    onPressed: () => controller.goToDetailsScreen(list),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  myOrderText(text) =>
      TextWidget(text, fontSize: 14, fontWeight: FontWeight.w400);
}
