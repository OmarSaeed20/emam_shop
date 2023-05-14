import '/index.dart';

class ItemScreen extends StatelessWidget {
  const ItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => Scaffold(
        appBar: _categorieItemsAppBar(controller),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: paddingOnly(left: 12, right: 12, bottom: 15),
                child: searchBar(),
              ),
              HandlingRequstView(
                controller.requestStatus,
                widget: _body(controller),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _body(HomeControllerImp controller) {
    List<ItemsModel> itemsList = controller.itemsScreenList;
    return Container(
      padding: paddingSymme(horizontal: 6),
      width: double.infinity,
      child: GridView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: .67,
        ),
        children: List.generate(
          itemsList.length,
          (i) => ProductGridView(
            model: itemsList[i],
            onTap: () => controller.goToProductDetaile(itemsList[i]),
          ),
        ),
      ),
    );
  }
}

AppBar _categorieItemsAppBar(HomeControllerImp controller) {
  CategoriesModel? cateModel = Get.arguments["categoriesModel"];
  return AppBar(
    title: TextWidget(
      translateDatabase(cateModel!.nameAr!, cateModel.name!),
      fontSize: 18.weight,
    ),
    bottom: controller.requestStatus == RequestStatus.loading
        ? PreferredSize(
            preferredSize: Size(double.infinity, 2.height),
            child: const LinearProgressIndicator(),
          )
        : null,
    actions: [
      Padding(
        padding: paddingSymme(horizontal: 20.weight),
        child: const Icon(Icons.menu),
      )
    ],
  );
}
