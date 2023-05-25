import '../../../index.dart';

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
          List<FavoriteModel> list = controller.getFavList;
          controller.isFavor[list[i].itemsId] = list[i].favoriteId;
          return Padding(
            padding: paddingSymme(horizontal: 10),
            child: CartAndFavoCard(
              title: translateDatabase(
                list[i].itemsNameAr!,
                list[i].itemsName!,
              ),
              isCartPage: false,
              price: list[i].itemsPrice!,
              image: list[i].itemsImage!,
              favTap: () => controller.deleteFavourite(list[i].favoriteId!),
              active: true,
              active2: controller.pain,
              icon2: controller.painIcon,
              cartTap: () => controller.onAddPinUpdat(),
            ),
          );
        },
      ),
    );
  }
}
