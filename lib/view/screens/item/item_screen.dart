import '/index.dart';

class ItemScreen extends StatefulWidget {
  const ItemScreen({super.key});

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  void initState() {
    scaffoldKey = GlobalKey<ScaffoldState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String? val;
    return Scaffold(
      key: scaffoldKey,
      appBar: _categorieItemsAppBar(),
      body: GetBuilder<ItemsControllerImp>(
        builder: (controller) => SingleChildScrollView(
          child: Column(
            children: [
              if (controller.requestStatu == RequestStatus.loading)
                PreferredSize(
                  preferredSize: Size(double.infinity, 2.height),
                  child: const LinearProgressIndicator(),
                )
              else
                Container(),
              Container(
                padding: paddingOnly(left: 12, right: 12, bottom: 15),
                child: searchBar(
                  onPressed: () => val!.isNotEmpty
                      ? controller.getItemsByNameBinary(val!)
                      : null,
                  onChanged: (String value) => val = value,
                ),
              ),
              HandlingRequstView(
                controller.requestStatu,
                widget: _body(controller),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _body(ItemsControllerImp controller) {
    List<ItemsModel> itemsList = controller.itemsScreenList;
    FavoriteControllerImp favController = Get.find();
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
          (i) {
            favController.isFavor[itemsList[i].id] = itemsList[i].favorite;
            return ProductGridView(
              active: favController.isFavor[itemsList[i].id] == "1"
                  ? true
                  : false,
              itemsModel: itemsList[i],
              onTap: () => controller.goToProductDetaile(itemsList[i]),
            );
          },
        ),
      ),
    );
  }
}

AppBar _categorieItemsAppBar() {
  CategoriesModel? cateModel = Get.arguments["cateModel"];
  return AppBar(
    title: TextWidget(
      translateDatabase(cateModel!.nameAr!, cateModel.name!),
      fontSize: 18.weight,
    ),
    actions: [
      Padding(
        padding: paddingSymme(horizontal: 20.weight),
        child: const Icon(Icons.menu),
      )
    ],
  );
}
