import '../../../../../index.dart';

Column listAnimatedContaierWidget(ItemsControllerImp controller) {
  List<Widget> productDs = [
    productDescreption(controller.itemsModePro!),
    productColor(),
    productDescreption(controller.itemsModePro!),
    reviews(),
  ];
  return Column(
    children: [
      /* Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...List.generate(
              controller.productDis.length,
              (index) => GestureDetector(
                onTap: () => controller.changeSelectedIndex(index),
                child: AnimatedContainer(
                  duration: const Duration(seconds: 2),
                  curve: Curves.fastLinearToSlowEaseIn,
                  height: 37.height,
                  width: index == controller.selectedIndex
                      ? 107.weight
                      : 85.weight,
                  margin: paddingOnly(right: 4),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.height),
                    color: index == controller.selectedIndex
                        ? AppColors.primarylight
                        : AppColors.offWhite,
                  ),
                  child: TextWidget(
                    controller.productDis[index],
                    textAlign: TextAlign.center,
                    color: index == controller.selectedIndex
                        ? AppColors.primary
                        : AppColors.grey,
                    fontSize: 14.weight,
                  ),
                ),
              ),
            )
          ],
        ), */
      SizedBox(
        height: 40.height,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.productDis.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => controller.changeSelectedIndex(index),
              child: AnimatedContainer(
                duration: const Duration(seconds: 2),
                curve: Curves.fastLinearToSlowEaseIn,
                height: 37.height,
                width:
                    index == controller.selectedIndex ? 107.weight : 85.weight,
                margin: paddingOnly(right: 6),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.height),
                  color: index == controller.selectedIndex
                      ? AppColors.primarylight
                      : AppColors.offWhite,
                ),
                child: TextWidget(
                  controller.productDis[index],
                  textAlign: TextAlign.center,
                  color: index == controller.selectedIndex
                      ? AppColors.primary
                      : AppColors.grey,
                  fontSize: 14.weight,
                ),
              ),
            );
          },
        ),
      ),
      10.sH,
      GetBuilder<ItemsControllerImp>(
        builder: (controller) => AnimatedContainer(
          duration: const Duration(seconds: 1),
          curve: Curves.easeOutBack,
          height: contaheight(controller.selectedIndex),
          width: double.infinity,
          margin: paddingOnly(right: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.height),
          ),
          child: productDs[controller.selectedIndex!],
        ),
      ),
    ],
  );
}

contaheight(int? index) {
  switch (index) {
    case 0:
      return 160.height;
    case 1:
      return 85.height;
    case 2:
      return 150.height;
    case 3:
      return 300.height;
    default:
      150.height;
  }
}

productDescreption(ItemsModel model) {
  return SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextWidget(
          translateDatabase(model.descreptionAr!, model.descreption!),
          fontSize: 13.weight,
          maxLines: 8,
          textAlign: TextAlign.start,
          fontWeight: FontWeight.w400,
        ),
        /* GestureDetector(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextWidget("more", fontSize: 14.weight),
              3.sW,
              Icon(
                MyLocaleControllerImp.to.themeData == themeEN
                    ? Icons.keyboard_double_arrow_right_rounded
                    : Icons.keyboard_double_arrow_left_rounded,
                // CupertinoIcons.chevron_right_2,
                size: 16.weight,
                color: AppColors.primary,
              ),
            ],
          ),
        ), */
      ],
    ),
  );
}

Container productColor() {
  return Container(
    height: 100.height,
    width: double.infinity,
    padding: paddingSymme(),
    alignment: Alignment.center,
    child: Row(
      children: [
        ...List.generate(
          colors.length,
          (index) => Container(
            height: 40.height,
            width: 40.height,
            margin: paddingSymme(horizontal: 6),
            padding: paddingSymme(horizontal: 7),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.height),
              border: Border.all(
                color: index == 0 ? AppColors.primary : AppColors.grey,
                width: index == 0 ? 2 : .5,
              ),
            ),
            child: CircleAvatar(
              backgroundColor: Color(int.parse(colors[index]['colorCode'])),
            ),
          ),
        )
      ],
    ),
  );
}

List<Map> colors = [
  {"name": "red", "id": "1", "active": "0", "colorCode": "0xFFBE2623"},
  {"name": "orang", "id": "2", "active": "0", "colorCode": "0xFFF1916D"},
  {"name": "blue", "id": "3", "active": "0", "colorCode": "0xFF287094"},
  {"name": "blak", "id": "4", "active": "0", "colorCode": "0xFF000000"},
];
