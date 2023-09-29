import '../../../../index.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: botNavigationBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              GetBuilder<ItemsControllerImp>(
                builder: (controller) => HandlingRequstView(
                  controller.requestStatu,
                  widget: Column(
                    children: [
                      productDetailseImage(controller),
                      productDetailes(controller),
                    ],
                  ),
                ),
              ),
              Container(height: 4.height, color: AppColors.grey200),
              similarProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
