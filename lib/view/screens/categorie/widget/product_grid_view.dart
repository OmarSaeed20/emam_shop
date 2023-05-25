import 'dart:developer';

import '/index.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({
    super.key,
    required this.itemsModel,
    required this.onTap,
    required this.active,
  });
  final ItemsModel itemsModel;
  final VoidCallback onTap;
  final bool active;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Card(
            color: AppColors.cardColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0.height),
            ),
            elevation: 5,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.height),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  productImage(
                    itemsModel.image!,
                    dic: "${int.parse(itemsModel.discount!)}",
                    fit: BoxFit.fitHeight,
                  ),
                  Divider(height: 1.height),
                  GetBuilder<FavoriteControllerImp>(
                    builder: (favController) => productCardBody(
                      name: translateDatabase(
                          itemsModel.nameAr!, itemsModel.name!),
                      favTap: () {
                        log(itemsModel.id!);
                        if (favController.isFavor[itemsModel.id] == "1") {
                          favController.onTapSetFavorite(itemsModel.id!, '0');
                          favController.onTapRemovefavo(itemsModel.id!);
                        } else {
                          favController.onTapSetFavorite(itemsModel.id!, '1');
                          favController.onTapAddFavo(itemsModel.id!);
                        }
                      },
                      pric: "${int.parse(itemsModel.price!)}",
                      oldPric: "${int.parse(itemsModel.price!) + 266}",
                      active: favController.isFavor[itemsModel.id] == "1"
                          ? true
                          : false,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
