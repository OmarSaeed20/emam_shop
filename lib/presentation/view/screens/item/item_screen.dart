import 'package:responsive_builder/responsive_builder.dart';

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
    final String cateId = Get.arguments["cateId"];
    return Scaffold(
      key: scaffoldKey,
      appBar: _categorieItemsAppBar(),
      body: GetBuilder<ItemsControllerImp>(
        builder: (controller) => SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: paddingOnly(left: 12, right: 12, bottom: 15),
                child: searchBar(
                  onChanged: (String val) => val.isNotEmpty
                      ? controller.getItemsSearch(val)
                      : controller.getItemsData(cateId),
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
          itemsList.length,
          (i) {
            favController.isFavor[itemsList[i].id] = itemsList[i].favorite;
            return ProductGridViewCard(
              active:
                  favController.isFavor[itemsList[i].id] == "1" ? true : false,
              model: itemsList[i],
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
        // child: Icon(Icons.),
      )
    ],
  );
}

class MyAnimatedIcon extends StatefulWidget {
  const MyAnimatedIcon({super.key, required this.icon});
  final AnimatedIconData icon;
  @override
  MyAnimatedIconState createState() => MyAnimatedIconState();
}

class MyAnimatedIconState extends State<MyAnimatedIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_animationController.status == AnimationStatus.completed) {
          _animationController.reverse();
        } else {
          _animationController.forward();
        }
      },
      child: AnimatedIcon(
        icon: widget.icon,
        progress: _animationController,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
