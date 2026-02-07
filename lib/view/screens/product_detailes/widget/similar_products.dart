import 'package:ecommerce/index.dart';

Container similarProducts() {
  return Container(
    padding: paddingOnly(top: 10, bottom: 40, left: 20),
    child: GetBuilder<ItemsControllerImp>(
      builder: (controller) => Column(
        children: [
          24.sH,
          titleRow("Similar products", seeAll: false),
          15.sH,
          SizedBox(
            height: 225.height,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.itemsScreenList.length,
              itemBuilder: (context, i) => ForYouCard(
                 favTap: () => controller.onfavoriteUpdat(), 
                model: controller.itemsScreenList[i],
                onTap: () {
                  snackBarSuccess();
                  if (controller.itemsScreenList[i].id !=
                      controller.itemsModePro!.id) {
                    return controller
                        .goToProductDetaile(controller.itemsScreenList[i]);
                  }
                },
              ),
            ),
          ),
          24.sH,
        ],
      ),
    ),
  );
}
