import '../../../index.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GetBuilder<CartControllerImp>(
        builder: (controller) => botNavigationBar(context, controller),
      ),
      body: SafeArea(
        child: Column(
          children: [
            TextWidget(
              'Cart'.toUpperCase(),
              fontSize: 22.weight,
              fontWeight: FontWeight.w700,
              spacing: 2,
              height: 2,
            ),
            GetBuilder<CartControllerImp>(
              builder: (controller) => HandlingRequstView(
                controller.isEmpty
                    ? RequestStatus.noData
                    : controller.requestStatus,
                widget: Expanded(
                  child: Container(
                    padding: paddingOnly(left: 10, right: 10),
                    child: ListView.builder(
                      itemCount: controller.listCart.length,
                      itemBuilder: (context, index) {
                        var listCa = controller.listCart[index];
                        return CartAndFavoCard(
                          /* checkout: () {
                          /* Get.bottomSheet(
                            bottomSheetWidget(
                              context,
                              count: controller.countpriceModel!.totalcont!,
                              supTotle: controller.countpriceModel!.totalprice!,
                              tax: '5.55',
                              delivery: "2.00",
                            ),
                            backgroundColor: AppColors.white,
                          ); */
                        },
                        delete: () => controller.deleteItem(listCa.itemsId!), */
                          plus: () => controller.increse(
                            isCartScrren: true,
                            add: true,
                            itemsId: listCa.itemsId!,
                            count: int.parse(listCa.countitems!),
                          ),
                          minus: () => controller.increse(
                            isCartScrren: true,
                            add: false,
                            itemsId: listCa.itemsId!,
                            count: int.parse(listCa.countitems!),
                          ),
                          count: listCa.countitems!,
                          image: listCa.itemsImage!,
                          discont: listCa.itemsDiscount!,
                          price:
                              "${int.parse(listCa.itemsPrice!) * int.parse(listCa.countitems!)}",
                          title: translateDatabase(
                            listCa.itemsNameAr!,
                            listCa.itemsName!,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  botNavigationBar(context, CartControllerImp controller) => AnimatedContainer(
        duration: const Duration(seconds: 1),
        curve: Curves.decelerate,
        height: controller.selectedIndexEnum == CheckOutEnum.check1
            ? 80.height
            : 280.height,
        width: double.infinity,
        color: AppColors.offWhite,
        child: controller.selectedIndexEnum == CheckOutEnum.check1
            ? checkOut1(controller)
            : bottomSheetWidget(
                context,
                count: controller.countpriceModel!.totalcount!,
                supTotle: controller.countpriceModel!.totalprice!,
                tax:
                    '${double.parse(controller.countpriceModel!.totalprice!) * (2.5 / 100)}',
                delivery:
                    "${double.parse(controller.countpriceModel!.totalprice!) * (.5 / 100)}",
                selectAddress: () {
                  Get.toNamed(RouteHelper.getDeliveryAddress());
                },
                cancel: () => controller.changeSelectedIndex(),
              ),
      );

  checkOut1(CartControllerImp controller) {
    return BtnWidget(
      'Check Out',
      padding: paddingOnly(top: 16, bottom: 20, right: 20, left: 20),
      height: 40.height,
      onPressed: () {
        if (controller.isEmpty != true) {
          controller.changeSelectedIndex();
        } else {
          snackBarMessage(msg: "No items in cart", title: "waring");
        }
      },
    );
  }
}
