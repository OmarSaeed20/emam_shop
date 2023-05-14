import '/index.dart';

class ForYouCard extends StatelessWidget {
  const ForYouCard({
    super.key,
    required this.model,
    required this.favTap,
    required this.onTap,
  });
  final ItemsModel model;
  final VoidCallback favTap;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    MyLocaleControllerImp controller = Get.find();
    // var price=int.parse(model.price!);

    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            height: 195.height,
            width: 160.weight,
            margin: paddingOnly(right: 2.weight),
            decoration: BoxDecoration(
              color: AppColors.trans,
              borderRadius: BorderRadius.circular(6.height),
            ),
            child: Card(
              color: AppColors.cardColor2,
              elevation: 5,
              child: Column(children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.height)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      productImage(
                        model.image,
                        favTap: favTap,
                        height: 120.height,
                        fit: BoxFit.fitWidth,
                        borderRadius: BorderRadius.circular(10.height),
                      ),
                      productCardBody(
                        padding:
                            paddingOnly(right: 4, top: 2, bottom: 2, left: 3),
                        name: controller.themeData == themeEN
                            ? model.name!
                            : model.nameAr!,
                        onTap: () {},
                        pric: "${model.price}",
                        // oldPric: "$oldPrice",
                        oldPric: "${int.parse('${model.price}') + 80}",
                      )
                    ],
                  ),
                )
              ]),
            ),
          ),
          discontPositined(dic: "${model.discount}"),
        ],
      ),
    );
  }
}
