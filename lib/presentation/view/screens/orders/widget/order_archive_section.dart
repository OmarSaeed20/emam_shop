import '../../../../../index.dart';

class OrdersArchiveSection extends StatefulWidget {
  const OrdersArchiveSection({super.key});

  @override
  OrdersArchiveSectionState createState() => OrdersArchiveSectionState();
}

class OrdersArchiveSectionState extends State<OrdersArchiveSection>
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
      controller.archiRequestStatus,
      widget: ListView.builder(
        itemCount: controller.archiveOrders.length,
        itemBuilder: (context, i) {
          return ordersArchiveCard(
            controller: controller,
            data: controller.archiveOrders[i],
          );
        },
      ),
    );
  }

  Container ordersArchiveCard({
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
              const Divider(),

              myOrderText(
                  "Status : ${controller.printOrderStatus(data.status!)}"),
              myOrderText(
                  "Payment : ${controller.printPayment(data.paymentMethod!)}"),
              myOrderText(
                  "Order Type : ${controller.printOrderType(data.type!)}"),
              // myOrderText("Time :${calculationTime(list.datetime!)} "),
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
    );
  }
}
