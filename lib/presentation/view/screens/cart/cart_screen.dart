import '../../../../index.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: controller.cartKey,
      appBar: AppBar(
        title: TextWidget(
          'Cart'.toUpperCase(),
          fontSize: 22.weight,
          fontWeight: FontWeight.w700,
          spacing: 2,
          height: 2,
        ),
      ),
      bottomNavigationBar: GetBuilder<CartControllerImp>(
        builder: (controller) =>
            controller.requestStatus != RequestStatus.loading &&
                    controller.isEmpty != true
                ? botNavigationBar(context, controller)
                : const TextWidget(''),
      ),
      body: SafeArea(
        child: Column(
          children: [
            GetBuilder<CartControllerImp>(
              builder: (controller) {
                return HandlingRequstView(
                  controller.isEmpty == true
                      ? RequestStatus.noData
                      : controller.requestStatus,
                  widget: Expanded(
                    child: Container(
                      padding: paddingOnly(left: 10, right: 10),
                      child: ListView.builder(
                        itemCount: controller.listCart.length,
                        itemBuilder: (context, index) {
                          var listCa = controller.listCart[index];
                          var price =
                              "${(double.parse(listCa.itemsPrice!) * double.parse(listCa.countitems!)).toInt()}";
                          // var dicountPrice = listCa.descountPrice!;
                          return CartAndFavoCard(
                            count: listCa.countitems,
                            image: listCa.itemsImage!,
                            discont: listCa.itemsDiscount,
                            price: price,
                            dicountPrice: listCa.descountPrice!,
                            // '${double.parse(calculatingPrice(listCa.itemsPrice!, listCa.itemsDiscount!)).toInt() * double.parse(listCa.countitems!).toInt()}',
                            plus: () => controller.increse(
                              add: true,
                              itemsId: listCa.itemsId!,
                              count: int.parse(listCa.countitems!),
                            ),
                            minus: () => controller.increse(
                              add: false,
                              itemsId: listCa.itemsId!,
                              count: int.parse(listCa.countitems!),
                            ),
                            title: translateDatabase(
                              listCa.itemsNameAr!,
                              listCa.itemsName!,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  botNavigationBar(context, CartControllerImp controller) {
    double tax0 =
        double.parse(controller.countpriceModel!.totalprice!) * (2.5 / 100);
    int tax = tax0.toInt();
    return Container(
      height: 350.height,
      width: double.infinity,
      color: AppColors.offWhite,
      child: bottomSheetWidget(
        context,
        controller: controller,
        count: controller.countpriceModel!.totalcount!,
        supTotle:
            "${double.parse(controller.countpriceModel!.totalprice!).toInt()}",
        tax: '$tax',
        delivery:
            "${double.parse(controller.countpriceModel!.totalprice!).toInt() * .5 ~/ 100}",
        coupon: controller.couponControl.couponModel == null
            ? "0"
            : "${controller.couponControl.couponModel!.couponDiscount}",
        totaldiscount: controller.countpriceModel!.totaldiscount!,
        continueTap: () => controller.goToCheckoutScreen(),
        couponTap: () => controller.goToCouponScreen(),
        couponTitle: controller.couponControl.couponModel != null
            ? "${controller.couponControl.couponModel!.couponName}"
            : "coupon code",
      ),
    );
  }
}
