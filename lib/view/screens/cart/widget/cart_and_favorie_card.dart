import '../../../../index.dart';

class CartAndFavoCard extends StatelessWidget {
  final String title;
  final String price;
  final String dicountPrice;
  final String image;
  final String? count;
  final String? discont;
  final VoidCallback? plus;
  final VoidCallback? minus;
  final double? bottom;
  final bool isCartPage;
  final VoidCallback? favTap;
  final VoidCallback? cartTap;
  final IconData? icon2;
  final bool? active2;
  final bool? active;

  const CartAndFavoCard({
    super.key,
    required this.title,
    required this.price,
    required this.dicountPrice,
    required this.image,
    this.count,
    this.discont,
    this.plus,
    this.minus,
    this.bottom,
    this.favTap,
    this.cartTap,
    this.icon2,
    this.active = false,
    this.active2 = false,
    this.isCartPage = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: paddingOnly(bottom: bottom ?? 6),
      child: Card(
        elevation: 4,
        color: AppColors.cardColor,
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(6.height),
        ),
        child: Padding(
          padding: paddingSymme(horizontal: 4, vertical: 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 95.height,
                width: 100.weight,
                padding: paddingSymme(horizontal: 3, vertical: 3),
                decoration: BoxDecoration(
                  color: AppColors.grey200,
                  borderRadius: BorderRadius.circular(6.height),
                  image: DecorationImage(
                    image: NetworkImage("${ApiLinks.imagLink}$image"),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              15.sW,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 87.height,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextWidget(
                            title,
                            fontSize: 14.weight,
                            maxLines: 3,
                            overFlow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w400,
                          ),
                          5.sH,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    TextWidget(
                                      '$dicountPrice \$',
                                      fontFamily: AppStrings.montserrat,
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    TextWidget(
                                      discont != "0" ? price : "",
                                      color: AppColors.greyDeep,
                                      fontFamily: AppStrings.montserrat,
                                      fontSize: 12.weight,
                                      fontWeight: FontWeight.w400,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ],
                                ),
                              ),
                              if (isCartPage)
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    height: 25.height,
                                    width: 90.weight,
                                    decoration: BoxDecoration(
                                      color: AppColors.grey200,
                                      borderRadius:
                                          BorderRadius.circular(6.height),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                          onTap: minus,
                                          child: Icon(
                                            Icons.remove,
                                            color: AppColors.primary,
                                            size: 22.weight,
                                          ),
                                        ),
                                        TextWidget(
                                          count!,
                                          fontFamily: AppStrings.montserrat,
                                        ),
                                        GestureDetector(
                                          onTap: plus,
                                          child: Icon(
                                            Icons.add,
                                            color: AppColors.primary,
                                            size: 22.weight,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              if (!isCartPage)
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      margin: paddingOnly(top: 2, right: 4),
                                      child: proCardIcon(
                                        active2!,
                                        icon: icon2,
                                        onTap: cartTap,
                                      ),
                                    ),
                                    Container(
                                      margin: paddingOnly(
                                          top: 2, right: 6, left: 10),
                                      alignment: Alignment.center,
                                      child: btnFavWidget(
                                        home: true,
                                        onTap: favTap!,
                                        active: active!,
                                      ),
                                    ),
                                  ],
                                ),
                            ],
                          )
                        ],
                      ),
                    ),
                    /* if (isCartPage)
                      Column(
                        children: [
                          10.sH,
                          Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: BtnWidget(
                                  "delet",
                                  height: 25.height,
                                  fontSize: 14,
                                  onPressed: delete!,
                                  backgroundColor: AppColors.white,
                                  color: AppColors.primary2,
                                  border: BorderSide(
                                    color: AppColors.primaryMid,
                                    width: .5.weight,
                                  ),
                                ),
                              ),
                              7.sW,
                              Expanded(
                                flex: 5,
                                child: BtnWidget(
                                  'Check Out',
                                  fontSize: 12.weight,
                                  height: 25.height,
                                  onPressed: checkout!,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ) */
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
