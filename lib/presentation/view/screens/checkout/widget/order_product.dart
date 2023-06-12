import '../../../../../index.dart';

class OrderProductWidget extends StatelessWidget {
  const OrderProductWidget({super.key, required this.controller});
  final CartControllerImp controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: paddingOnly(top: 16, bottom: 16, left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TextWidget('Items', fontSize: 15),
              Container(
                height: 15.height,
                padding: paddingSymme(horizontal: 15),
                margin: paddingOnly(right: 16),
                color: AppColors.whiteNice,
                alignment: Alignment.center,
                child: TextWidget(
                  "${controller.countpriceModel!.totalitems!} items",
                  fontSize: 12,
                  textAlign: TextAlign.center,
                  color: AppColors.greyDeep,
                ),
              ),
            ],
          ),
          16.sH,
          SizedBox(
            height: 120.height,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.listCart.length,
              itemBuilder: (context, i) {
                return Container(
                  height: 112.height,
                  width: 300.weight,
                  padding: paddingSymme(horizontal: 10, vertical: 10),
                  margin: paddingOnly(right: 14),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: .5.weight,
                      color: AppColors.grey,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 90.height,
                        width: 95.height,
                        color: AppColors.cardColor,
                        margin: paddingOnly(right: 10),
                        child: Image.network(
                          ApiLinks.imagLink +
                              controller.listCart[i].itemsImage!,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              translateDatabase(
                                controller.listCart[i].itemsNameAr!,
                                controller.listCart[i].itemsName!,
                              ),
                              maxLines: 1,
                              overFlow: TextOverflow.ellipsis,
                            ),
                            4.sH,
                            TextWidget(
                              translateDatabase(
                                  controller.listCart[i].itemsDessAr!,
                                  controller.listCart[i].itemsDesc!),
                              color: AppColors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              maxLines: 2,
                              overFlow: TextOverflow.ellipsis,
                            ),
                            15.sH,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextWidget(
                                    'Count : ${controller.listCart[i].countitems}'),
                                TextWidget(
                                  '\$ ${double.parse(controller.listCart[i].descountPrice!).toInt()}',
                                  color: AppColors.primary2,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
