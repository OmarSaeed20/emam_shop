import '/index.dart';

class ForYouCard extends StatelessWidget {
  const ForYouCard({
    super.key,
    required this.model,
    required this.onTap,
    this.favTap,
  });
  final ItemsModel model;
  final VoidCallback onTap;
  final VoidCallback? favTap;

  @override
  Widget build(BuildContext context) {
    // MyLocaleControllerImp controller = Get.find();

    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            height: 216.height,
            width: 155.weight,
            margin: paddingOnly(right: 2.weight),
            decoration: BoxDecoration(
              color: AppColors.trans,
              borderRadius: BorderRadius.circular(6.height),
            ),
            child: Card(
              color: AppColors.cardColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0.height),
              ),
              elevation: 5,
              child: Column(children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.height)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      productImage(
                        "${ApiLinks.imagLink}${model.image!}",
                        dic: "${int.parse(model.discount!)}",
                        height: 148.height,
                        fit: BoxFit.fitHeight,
                        borderRadius: BorderRadius.circular(6.height),
                      ),
                      productCardBody(
                        isHome: true,
                        padding: paddingOnly(right: 4, top: 2, left: 10),
                        name: translateDatabase(model.nameAr!, model.name!),
                        pric: "${model.price}",
                        oldPric: "${int.parse('${model.price}') + 80}",
                        favTap: favTap,
                      )
                    ],
                  ),
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
