import '/index.dart';

class ProductGridViewCard extends StatelessWidget {
  const ProductGridViewCard({
    super.key,
    required this.model,
    required this.onTap,
    required this.active,
  });
  final ItemsModel model;
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
                    "${ApiLinks.imagLink}${model.image!}",
                    dic: "${int.parse(model.discount!)}",
                    fit: BoxFit.fitHeight,
                  ),
                  Divider(height: 1.height),
                  GetBuilder<FavoriteControllerImp>(
                    builder: (favController) => productCardBody(
                      name: translateDatabase(model.nameAr!, model.name!),
                      favTap: () => favController.onTapfavorit(model.id!),
                      pric: "${int.parse(model.price!)}",
                      oldPric: "${int.parse(model.price!) + 266}",
                      active:
                          favController.isFavor[model.id] == "1" ? true : false,
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
