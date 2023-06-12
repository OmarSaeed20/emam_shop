import '../../../../../index.dart';

Container listTileItems(HomeControllerImp controller, int index) {
  return Container(
    margin: paddingSymme(vertical: 5, horizontal: 12),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(6.height),
    ),
    child: InkWell(
      onTap: () => controller.goToItemScreen(
        index,
        controller.categories![index].id!,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6.height),
        child: ListTile(
          leading: Container(
            height: 45.height,
            width: 55.weight,
            padding: paddingOnly(top: 5, bottom: 5, left: 5, right: 8),
            decoration: BoxDecoration(
              color: AppColors.secondaryLight,
              borderRadius: BorderRadius.circular(6.height),
              border: Border.all(
                color: AppColors.secondary,
                width: .5.weight,
              ),
            ),
            child: Image.network(
              "${ApiLinks.baseUri}/uplode/${controller.categories![index].image}",
              fit: BoxFit.contain,
              height: 30.height,
              color: AppColors.primary,
            ),
          ),
          title: TextWidget(
            translateDatabase(
              controller.categories![index].nameAr!,
              controller.categories![index].name!.toUpperCase(),
            ),
          ),
          trailing: Icon(
            controller.lang == EndPoint.enCode
                ? Icons.keyboard_arrow_right_sharp
                : Icons.keyboard_arrow_left_sharp,
            color: AppColors.primary2,
          ),
        ),
      ),
    ),
  );
}
