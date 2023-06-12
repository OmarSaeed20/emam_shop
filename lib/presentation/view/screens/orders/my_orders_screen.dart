import '../../../../index.dart';

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
                  widget: myOrdersCard(controller, controller.myOrders[i]),
                );
              });
        },
      ),
    );
  }

  Container myOrdersCard(MyOrderControllerImp controller, OrdersModel? list) {
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
              Padding(
                padding: paddingSymme(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ...List.generate(
                      controller.orderStatus.length,
                      (index) => Container(
                        height: 35.height,
                        width: 35.weight,
                        alignment: Alignment.center,
                        padding: paddingSymme(horizontal: 4, vertical: 4),
                        //     paddingOnly(top: 5, bottom: 5, left: 5, right: 8),
                        decoration: BoxDecoration(
                          color: double.parse(list!.status!).toInt() >= index
                              ? AppColors.success
                              : AppColors.offWhite,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.secondary,
                            width: .5.weight,
                          ),
                        ),
                        child: double.parse(list.status!).toInt() >= index
                            ? Image.asset(
                                controller.orderStatus[index].img,
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                controller.orderStatus[index].img,
                                fit: BoxFit.cover,
                              ).animate().saturate(),
                      ),
                    )
                  ],
                ),
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    "ID : #${list!.id}",
                    color: AppColors.primaryMid,
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
              // myOrderText(
              //     "Status : ${controller.printOrderStatus(list.status!)}"),
              myOrderText(
                  "Payment : ${controller.printPayment(list.paymentMethod!)}"),
              myOrderText(
                  "Order Type : ${controller.printOrderType(list.type!)}"),
              // myOrderText("Time :${calculationTime(list.datetime!)} "),
              myOrderText("Price : ${list.price} \$"),
              myOrderText("Delivery Price : ${list.deliveryPrice} \$"),
              const Divider(),
              totalPriceAndRowBtns(list, controller),
            ],
          ),
        ),
      ),
    );
  }

  Row totalPriceAndRowBtns(OrdersModel list, MyOrderControllerImp controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: TextWidget(
            "Total Price : ${list.totalPrice} \$",
            fontFamily: AppStrings.montserrat,
            fontWeight: FontWeight.w600,
            color: AppColors.awsm,
          ),
        ),
        Row(
          children: [
            list.status == "0"
                ? Container(
                    height: 30.height,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      border: Border.all(
                        width: .5.weight,
                        color: AppColors.redlight,
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () => controller.onTapRemoveOrder(list.id),
                      child: const Icon(
                        Icons.delete_forever_outlined,
                        color: AppColors.red,
                      ),
                    ),
                  )
                : Container(
                    height: 30.height,
                    decoration: BoxDecoration(
                      border: Border.all(width: .5.weight),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: const Icon(
                      Icons.delete_forever_outlined,
                      // color: AppColors.red,
                    ),
                  ).animate().saturate(),
            12.sW,
            BtnWidget(
              "Details",
              height: 30,
              width: 95.weight,
              backgroundColor: AppColors.trans,
              border: BorderSide(width: .5.weight, color: AppColors.awsm),
              color: AppColors.awsm,
              onPressed: () => controller.goToDetailsScreen(list),
            ),
          ],
        )
      ],
    );
  }

  myOrderText(text) =>
      TextWidget(text, fontSize: 14, fontWeight: FontWeight.w400);
}
