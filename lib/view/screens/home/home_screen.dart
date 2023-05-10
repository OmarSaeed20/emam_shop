import '/index.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImp>(
      builder: (controller) {
        return HandlingRequstView(controller.requestStatus, widget: body());
      },
    );
  }

  SingleChildScrollView body() {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            homeAppBar(),
            Padding(
              padding: paddingSymme(horizontal: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /* TextWidget(
                  // "Explore What Your Needs",
                  "What Would You Like \nTo Oredr",
                  fontSize: 30.weight,
                  fontWeight: FontWeight.w600,
                ) */
                  welcomeUser(),
                  10.sH,
                  banner(),
                  15.sH,
                  titleRow("Categories", onTap: () {}),
                  15.sH,
                  SizedBox(
                    height: 45.height,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        categoriesCard("Computers", AppImages.computer),
                        categoriesCard("Electronics", AppImages.electronics),
                        categoriesCard("Mobiles", AppImages.phone),
                        categoriesCard("SuperMarket", AppImages.supermarket),
                        categoriesCard("Home", AppImages.home),
                        categoriesCard("Sports", AppImages.sport),
                        categoriesCard("Fashion", AppImages.supermarket2),
                        categoriesCard("Books", AppImages.computer),
                      ],
                    ),
                  ),
                  15.sH,
                  titleRow("Product For you", onTap: () {}),
                  15.sH,
                  SizedBox(
                    height: 200.height,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) => forYouCard(),
                    ),
                  ),
                  15.sH,
                  SizedBox(
                    width: double.infinity,
                    // color: AppColors.awsmLight,
                    child: Column(children: [
                      titleRow("Popular", seeAll: false),
                    ]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Stack forYouCard() {
    return Stack(
      children: [
        Container(
          // height: 180.height,
          width: 175.weight,
          margin: paddingOnly(right: 10.weight),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.height),
            color: AppColors.grey,
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
                        child: Image.asset(
                          AppImages.emamLogoPng,
                          fit: BoxFit.fill,
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
                              "CappuccinosupTitleCappuccinosupTitleCappuccinosupTitles",
                              fontSize: 17.weight,
                              maxLines: 1,
                              overFlow: TextOverflow.ellipsis,
                            ),
                            TextWidget(
                              "sup TitlesupTitlesupTitlesupTitlesup Titlesup Titlesup Titlesup Title",
                              fontSize: 12.weight,
                              color: AppColors.grey,
                              fontWeight: FontWeight.w400,
                              maxLines: 2,
                              overFlow: TextOverflow.ellipsis,
                            ),
                            3.sH,
                            TextWidget(
                              "50 EG",
                              fontSize: 17.weight,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primary,
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
            bottom: 8,
            right: 16,
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
