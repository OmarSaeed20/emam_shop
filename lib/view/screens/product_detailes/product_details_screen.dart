import '../../../index.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final ItemsModel? itemsModel = Get.arguments['items_model'];
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: GetBuilder<HomeControllerImp>(
            builder: (controller) => Column(
              children: [
                productDetailseImage(controller),
                Container(
                  padding: paddingSymme(horizontal: 20),
                  child: Column(
                    children: [
                      15.sH,
                      TextWidget(
                        translateDatabase(
                          controller.itemsModePro!.nameAr!,
                          controller.itemsModePro!.name!,
                        ),
                        fontSize: 19.weight,
                        fontWeight: FontWeight.w500,
                      ),
                      8.sH,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextWidget(
                            "${controller.itemsModePro!.price!}\$",
                            fontSize: 20.weight,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                          ),
                          SizedBox(
                            height: 24.height,
                            width: 84.weight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                plusAndMinsBtn(
                                  isPlus: false,
                                  onTap: () {},
                                ),
                                const TextWidget("1"),
                                plusAndMinsBtn(
                                  onTap: () {},
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      10.sH,
                      Container(
                          alignment: Alignment.centerLeft,
                          height: 22.height,
                          // color: AppColors.awsm,
                          child: Row(
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: 5,
                                itemBuilder: (context, index) => const Icon(
                                  Icons.star,
                                  color: Color(0xFFFFC107),
                                ),
                              ),
                              6.sW,
                              TextWidget(
                                "4.6",
                                fontSize: 12.weight,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          )),
                      20.sH,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...List.generate(
                            3,
                            (index) => Container(
                              height: 37.height,
                              width: 107.weight,
                              margin: paddingOnly(right: 4),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.height),
                                color: index == 0
                                    ? AppColors.primarylight
                                    : AppColors.offWhite,
                              ),
                              child: TextWidget(
                                "Description",
                                textAlign: TextAlign.center,
                                color: index == 0
                                    ? AppColors.primary
                                    : AppColors.grey,
                                fontSize: 14.weight,
                              ),
                            ),
                          )
                        ],
                      ),
                      20.sH,
                      TextWidget(
                        translateDatabase(
                          controller.itemsModePro!.descreptionAr!,
                          controller.itemsModePro!.descreption!,
                        ),
                        fontSize: 14.weight,
                        color: AppColors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                      20.sH,
                    ],
                  ),
                ),
                Container(height: 4.height, color: AppColors.grey200),
                Container(
                  padding: paddingSymme(horizontal: 20),
                  child: Column(
                    children: [
                      24.sH,
                      titleRow("Similar products", seeAll: false),
                      15.sH,
                      SizedBox(
                        height: 205.height,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.items.length,
                          itemBuilder: (context, i) => ForYouCard(
                            model: controller.items[i],
                            onTap: () {},
                            favTap: () {},
                          ),
                        ),
                      ),
                      24.sH,
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

GestureDetector plusAndMinsBtn({
  required VoidCallback onTap,
  bool isPlus = true,
}) =>
    GestureDetector(
      onTap: onTap,
      child: Container(
        height: 24.height,
        width: 24.weight,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.weight,
            color: AppColors.primaryMid,
          ),
          borderRadius: BorderRadius.circular(6.height),
          shape: BoxShape.rectangle,
        ),
        alignment: Alignment.center,
        child: TextWidget(
          isPlus == true ? "+" : "-",
          textAlign: TextAlign.center,
          fontSize: 18.weight,
          color: AppColors.primary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );

Card productDetailseImage(HomeControllerImp controller) => Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: AppColors.secondaryLight,
      margin: const EdgeInsets.all(0),
      child: Container(
        height: 260.height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.cardColor,
          borderRadius:
              BorderRadius.vertical(bottom: Radius.circular(12.height)),
        ),
        child: Image.network(
          controller.itemsModePro!.image!,
          filterQuality: FilterQuality.medium,
          fit: BoxFit.contain,
        ),
      ),
    );
