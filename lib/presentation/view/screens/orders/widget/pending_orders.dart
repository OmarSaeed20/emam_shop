import '../../../../../index.dart';

class OrdersPendingSection extends StatefulWidget {
  const OrdersPendingSection({super.key});

  @override
  OrdersPendingSectionState createState() => OrdersPendingSectionState();
}

class OrdersPendingSectionState extends State<OrdersPendingSection>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GetBuilder<MyOrderControllerImp>(
      builder: (controller) => Padding(
        padding: EdgeInsets.only(top: getProportionateScreenHeight(10)),
        child: _OrdersArchiveView(controller: controller),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _OrdersArchiveView extends StatelessWidget {
  const _OrdersArchiveView({required this.controller});
  final MyOrderControllerImp controller;
  @override
  Widget build(BuildContext context) {
    return HandlingRequstView(
      controller.requestStatus,
      widget: ListView.builder(
        itemCount: controller.myOrders.length,
        itemBuilder: (context, i) {
          return pendingOrdersCard(
            controller: controller,
            data: controller.myOrders[i],
          );
        },
      ),
    );
  }

  Container pendingOrdersCard({
    required MyOrderControllerImp controller,
    required OrdersModel? data,
  }) {
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                    controller.orderStatus.length,
                    (index) => SizedBox(
                      height: 35.height,
                      width: 60.weight,
                      child: Row(
                        children: [
                          Container(
                            height: 35.height,
                            width: 35.weight,
                            alignment: Alignment.center,
                            padding: paddingSymme(horizontal: 5),
                            decoration: BoxDecoration(
                              color:
                                  double.parse(data!.status!).toInt() >= index
                                      ? AppColors.success
                                      : AppColors.offWhite,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.secondary,
                                width: .5.weight,
                              ),
                            ),
                            child: double.parse(data.status!).toInt() >= index
                                ? Image.asset(
                                    controller.orderStatus[index].img,
                                    fit: BoxFit.contain,
                                  )
                                : Image.asset(
                                    controller.orderStatus[index].img,
                                    fit: BoxFit.cover,
                                  )
                                    .animate()
                                    .shimmer(curve: Curves.bounceInOut),
                          ),
                          if (index != 4)
                            Expanded(
                              child: Container(
                                height: 4.height,
                                color:
                                    double.parse(data.status!).toInt() >= index
                                        ? AppColors.success
                                        : AppColors.secondary,
                              ),
                            )
                          else
                            Container()
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    "ID : #${data!.id}",
                    color: AppColors.primaryMid,
                    fontWeight: FontWeight.w600,
                  ),
                  12.sW,
                  TextWidget(
                    calculationTime(data.datetime!),
                    color: AppColors.greyDeep,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
              // myOrderText(
              //     "Status : ${controller.printOrderStatus(list.status!)}"),
              myOrderText(
                  "Payment : ${controller.printPayment(data.paymentMethod!)}"),
              myOrderText(
                  "Order Type : ${controller.printOrderType(data.type!)}"),
              myOrderText("Price : ${data.price} \$"),
              myOrderText("Delivery Price : ${data.deliveryPrice} \$"),
              const Divider(),
              totalPriceAndRowBtns(data, controller),
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
              isAnimation: true,
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
}

myOrderText(text) =>
    TextWidget(text, fontSize: 14, fontWeight: FontWeight.w400);
