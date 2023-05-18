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
            height: 3,
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
            padding: paddingSymme(horizontal: 14, vertical: 5),
            child: Row(
              children: [
                Container(
                  height: 120.height,
                  width: 140.weight,
                  decoration: BoxDecoration(
                    color: AppColors.offWhite3,
                    borderRadius: BorderRadius.circular(6.height),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6.height),
                    child: Image.network(
                      list[i].itemsImage!,
                      fit: BoxFit.fill,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                      height: 100.height,
                      width: double.infinity,
                      padding: paddingOnly(right: 2, left: 4, bottom: 2),
                      decoration: BoxDecoration(
                          color: AppColors.cardColor,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(6.height),
                            bottomRight: Radius.circular(6.height),
                          ),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(-1, 4),
                              color: AppColors.secondaryLight,
                            ),
                            BoxShadow(
                              offset: Offset(2, 2),
                              color: AppColors.secondaryLight,
                            )
                          ]),
                      child: productCardBody(
                        isFavoritScreen: true,
                        name: translateDatabase(
                          list[i].itemsNameAr!,
                          list[i].itemsName!,
                        ),
                        favTap: () =>
                            controller.deleteFavourite(list[i].favoriteId!),
                        cartTap: () => controller.onAddPinUpdat(),
                        pric: list[i].itemsPrice!,
                        oldPric: "${int.parse(list[i].itemsPrice!) + 100}",
                        active: true,
                        active2: controller.pain,
                        icon2: controller.painIcon,
                      )),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
