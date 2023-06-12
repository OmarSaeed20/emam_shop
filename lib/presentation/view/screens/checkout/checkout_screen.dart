import '../../../../index.dart';

class Checkoutscreen extends GetView<CartControllerImp> {
  const Checkoutscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: controller.securePaymentKey,
      appBar: AppBar(title: const Text('Secure Payment')),
      bottomNavigationBar: botNavigationBarCheckout(),
      body: GetBuilder<CartControllerImp>(
        builder: (controller) => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const OrderDetailsWidget(),
              16.sH,
              const DividerWidget(),
              ChosePaymenMethod(controller: controller),
              const DividerWidget(),
              ChoseDeliverytype(controller: controller),
              const DividerWidget(),
              OrderProductWidget(controller: controller),
              const DividerWidget(),
              16.sH,
            ],
          ),
        ),
      ),
    );
  }
}
