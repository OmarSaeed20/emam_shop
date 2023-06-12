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
              cartTap: () => controller.goToCart(),
              notfTap: () => Get.toNamed(RouteHelper.getNotifications()),
            ),
            Padding(
              padding: paddingSymme(horizontal: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  5.sH,
                  welcomeUser(),
                  5.sH,
                  HomeBanner(controller),
                  15.sH,
                  titleRow(
                    "Categories",
                    onTap: () => controller.goToAllCategories(),
                  ),
                  SizedBox(
                    height: 45.height,
                    child: ListView.builder(
                      itemCount: cate!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, i) => categoriesCard(
                        model: controller.categories![i],
                        onTap: () => controller.goToItemScreen(
                          i,
                          controller.categories![i].id!,
                        ),
                      ),
                    ),
                  ),
                  15.sH,
                  titleRow("Product For you", onTap: () {}),
                  SizedBox(
                    height: 225.height,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.allItems.length,
                      itemBuilder: (context, i) => ForYouCard(
                        model: controller.allItems[i],
                        onTap: () {
                          controller.goToProductDeScreen(
                            controller.allItems[i],
                            controller.allItems[i].categoriesId,
                          );
                        },
                      ),
                    ),
                  ),
                  15.sH,
                  titleRow("Popular", seeAll: false),
                  15.sH,
                  SizedBox(
                    height: 225.height,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.allItems.length,
                      itemBuilder: (context, i) => ForYouCard(
                        model: controller.allItems[i],
                        onTap: () {
                          /*  controller
                            .goToProductDetaile(controller.allItems[i]) */
                        },
                      ),
                    ),
                  ),
                  124.sH,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}