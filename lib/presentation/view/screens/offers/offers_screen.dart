import 'package:responsive_builder/responsive_builder.dart';

import '../../../../index.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final String cateId = Get.arguments["cateId"];
    ItemsControllerImp itemsControllerImp = Get.find<ItemsControllerImp>();
    return Scaffold(
      appBar: AppBar(title: const TextWidget('Offers')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: paddingOnly(left: 12, right: 12, bottom: 15),
              child: searchBar(
                onChanged: (String val) => val.isNotEmpty
                    ? itemsControllerImp.getItemsSearch(val)
                    : OffersControllerImp.to.getOffers(),
              ),
            ),
            body(context, itemsControllerImp),
          ],
        ),
      ),
    );
  }

  GetBuilder<OffersControllerImp> body(
    BuildContext context,
    ItemsControllerImp itemsControllerImp,
  ) {
    return GetBuilder<OffersControllerImp>(
      builder: (controller) {
        FavoriteControllerImp favController = Get.find();
        List<ItemsModel> list = controller.offersList;
        return HandlingRequstView(
          controller.requestStatus,
          widget: Container(
            padding: paddingSymme(horizontal: 6),
            margin: paddingOnly(bottom: 10),
            width: double.infinity,
            child: GridView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: getValueForScreenType<int>(
                  context: context,
                  mobile: 2,
                  tablet: 4,
                  desktop: 5,
                ),
                childAspectRatio: getValueForScreenType<double>(
                  context: context,
                  mobile: .67,
                  tablet: 1.2,
                  desktop: .96,
                ),
              ),
              children: List.generate(
                list.length,
                (i) {
                  favController.isFavor[list[i].id] = list[i].favorite;
                  return ProductGridViewCard(
                    active:
                        favController.isFavor[list[i].id] == "1" ? true : false,
                    model: list[i],
                    onTap: () => itemsControllerImp.goToProductDetaile(list[i]),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
