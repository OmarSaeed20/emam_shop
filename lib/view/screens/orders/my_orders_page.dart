import '../../../index.dart';

class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Orders')),
      body: GetBuilder<MyOrderControllerImp>(
        builder: (controller) {
          return ListView.builder(
              itemCount: controller.myOrders.length,
              itemBuilder: (context, index) {
                var list = controller.myOrders[index];
                return listOrdersCard(list);
              });
        },
      ),
    );
  }

  Container listOrdersCard(MyOrdersModel list) {
    return Container(
      margin: paddingSymme(horizontal: 12, vertical: 4),
      child: Card(
        shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(6.height)),
        elevation: 3,
        color: AppColors.cardColor,
        child: Container(
          padding: paddingSymme(horizontal: 12, vertical: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget("ID : #${list.ordersId}"),
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(Icons.cancel),
                  ),
                ],
              ),
              TextWidget("Status : ${list.status}"),
              TextWidget(
                  "Payment : ${list.paymentMethod == "0" ? "Cash" : "Payment Card"}"),
              TextWidget(
                  "Order Type : ${list.ordersType == "0" ? "Delivery" : "Recive"}"),
              TextWidget("Time : ${calculationTime(list.datetime!)}"),
              TextWidget("Price : ${list.ordersPrice} \$"),
              TextWidget("Delivery Price : ${list.deliveryPrice} \$"),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    "Total Price : ${list.totalprice} \$",
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary2,
                  ),
                  BtnWidget(
                    "Details",
                    height: 30,
                    width: 95.weight,
                    backgroundColor: AppColors.trans,
                    border: BorderSide(width: .5.weight, color: AppColors.awsm),
                    color: AppColors.primary2,
                    onPressed: () {},
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
