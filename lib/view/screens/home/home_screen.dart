import '/index.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImp>(
      builder: (contr) {
        return HandlingRequstView(contr.requestStatus, widget: body(contr));
      },
    );
  }

  SingleChildScrollView body(HomeControllerImp controller) {
    var cate = controller.categories;
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            homeAppBar(
              searchTap: () {},
              notfTap: () {},
            ),
            Padding(
              padding: paddingSymme(horizontal: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  welcomeUser(),
                  10.sH,
                  banner(),
                  15.sH,
                  titleRow("Categories", onTap: () {}),
                  SizedBox(
                    height: 45.height,
                    child: ListView.builder(
                      itemCount: cate!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, i) => categoriesCard(
                        model: cate[i],
                        onTap: () => controller.goToCategorieItem(i),
                      ),
                    ),
                  ),
                  15.sH,
                  titleRow("Product For you", onTap: () {}),
                  SizedBox(
                    height: 220.height,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.items!.length,
                      itemBuilder: (context, i) => forYouCard(
                        model: controller.items![i],
                      ),
                    ),
                  ),
                  15.sH,
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        titleRow("Popular", seeAll: false),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Stack forYouCard({required ItemsModel model}) {
    MyLocaleControllerImp controller = Get.find();
    return Stack(
      children: [
        Container(
          // height: 180.height,
          width: 175.weight,
          margin: paddingOnly(right: 10.weight),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.height),
          ),
          child: Card(
            margin: paddingSymme(horizontal: 0, vertical: 0),
            child: Column(children: [
              Container(
                padding: paddingSymme(horizontal: 2, vertical: 2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.height)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 110.height,
                      width: 170.weight,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.height),
                        child: Image.network(
                          model.itemsImage!,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    Container(
                      padding:
                          paddingOnly(right: 20, top: 2, bottom: 2, left: 4),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              controller.themeData == themeEN
                                  ? model.itemsName!
                                  : model.itemsNameAr!,
                              fontSize: 17.weight,
                              maxLines: 1,
                              overFlow: TextOverflow.ellipsis,
                            ),
                            TextWidget(
                              controller.themeData == themeEN
                                  ? model.itemsDesc!
                                  : model.itemsDessAr!,
                              fontSize: 12.weight,
                              color: AppColors.grey,
                              fontWeight: FontWeight.w400,
                              maxLines: 2,
                              overFlow: TextOverflow.ellipsis,
                            ),
                            3.sH,
                            TextWidget(
                              "${model.itemsPrice} EG",
                              fontSize: 17.weight,
                              fontFamily: AppStrings.montserrat,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primary,
                            ),
                            TextWidget(
                              "${int.parse('${model.itemsPrice}') + 80} EG",
                              fontSize: 13.weight,
                              fontFamily: AppStrings.montserrat,
                              color: AppColors.grey,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ]),
                    )
                  ],
                ),
              )
            ]),
          ),
        ),
        Positioned(
            top: 0,
            right: 10,
            child: Container(
              height: 15.height,
              width: 45.weight,
              padding: paddingSymme(horizontal: 8),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12.height),
                  bottomLeft: Radius.circular(20.height),
                ),
              ),
              child: TextWidget(
                "${model.itemsDiscount}%",
                textAlign: TextAlign.center,
                fontSize: 12.weight,
                color: AppColors.white,
              ),
            )),
        Positioned(
            bottom: 12,
            right: 18,
            child: GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.arrow_circle_right_rounded,
                  color: AppColors.primary,
                  size: 35,
                ))),
      ],
    );
  }
}
