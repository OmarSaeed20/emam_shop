import '../../../index.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: botNavigationBar(context),
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

  botNavigationBar(context) => Container(
        height: 80.height,
        width: double.infinity,
        color: AppColors.offWhite,
        padding: paddingOnly(top: 16, bottom: 20, right: 20, left: 20),
        child: GetBuilder<CartControllerImp>(
          builder: (controller) => BtnWidget(
            'Check Out',
            height: 40.height,
            onPressed: () {
              if (controller.isEmpty != true) {
                Get.bottomSheet(
                  bottomSheetWidget(
                    context,
                    count: controller.countpriceModel!.totalcount!,
                    supTotle: controller.countpriceModel!.totalprice!,
                    tax: '5.55',
                    delivery: "2.00",
                  ),
                  backgroundColor: AppColors.white,
                );
              } else {
                snackBarMessage(msg: "No items in cart", title: "waring");
              }
            },
          ),
        ),
      );
/*   GestureDetector getPromoCode(BuildContext context) {
    return GestureDetector(
      onTap: () {
        var formKey = GlobalKey<FormState>();
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Enter The points '),
            content: Form(
              key: formKey,
              child: TextFormField(
                cursorColor: Colors.black,
                validator: (v) {
                  if (v!.isEmpty) {
                    return 'this is required';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: 'enter points',
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
            ),
            actions: [
              BtnWidget(
                'get code',
                width: 100.weight,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.pop(context);
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text(
                            'Check it out before expiring in a week'),
                        content: Row(
                          children: const [
                            Text(
                              'Discount Code: ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SelectableText('14673ERT'),
                          ],
                        ),
                        actions: [
                          MaterialButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            color: AppColors.primary,
                            child: const Text(
                              'OK',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        );
      },
      child: Container(
        width: 60.weight,
        decoration: BoxDecoration(
          color: AppColors.awsm,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(6.height),
            bottomLeft: Radius.circular(12.height),
          ),
        ),
        child: const TextWidget(
          'get promo Code',
          maxLines: 3,
          textAlign: TextAlign.center,
          color: AppColors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  } */
}
