import '../../../../index.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextWidget(
            'Favorite'.toUpperCase(),
            fontSize: 22.weight,
            fontWeight: FontWeight.w700,
            spacing: 2,
            height: 2,
          ),
          GetBuilder<FavoriteControllerImp>(
            builder: (controller) => HandlingRequstView(
              controller.requestStatus,
              widget: _body(controller),
            ),
          ),
        ],
      ),
    );
  }

  _body(FavoriteControllerImp controller) {
    return Expanded(
      child: ListView.builder(
        itemCount: controller.getFavList.length,
        itemBuilder: (context, i) {
          FavoriteModel list = controller.getFavList[i];
          controller.isFavor[list.itemsId] = list.favoriteId;
          return Padding(
            padding: paddingSymme(horizontal: 10),
            child: CartAndFavoCard(
              title: translateDatabase(
                list.itemsNameAr!,
                list.itemsName!,
              ),
              isCartPage: false,
              price: list.itemsPrice!,
              image: list.itemsImage!,
              favTap: () => controller.deleteFavourite(list.favoriteId!),
              active: true,
              discont: list.itemsDiscount,
              active2: controller.pain,
              icon2: controller.painIcon,
              cartTap: () => controller.onAddPinUpdat(),
              dicountPrice:
                  '${calculatingPrice(list.itemsPrice!, list.itemsDiscount!)}',
            ),
          );
        },
      ),
    );
  }
}
