import 'package:ecommerce/index.dart';

categoriesCard(String tit, String img, {Color? color}) => Padding(
      padding: paddingOnly(right: 5),
      child: Card(
        child: Container(
          constraints: BoxConstraints(minWidth: 105.weight),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(50.height),
                child: Container(
                  padding: paddingOnly(top: 5, bottom: 5, left: 5, right: 8),
                  child: Image.asset(
                    img,
                    fit: BoxFit.fill,
                    height: 50.height,
                    color: AppColors.darkBackgroundColor,
                  ),
                )),
            Padding(
              padding: paddingOnly(right: 8),
              child: TextWidget(
                tit,
                fontSize: 12.weight,
                overFlow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
                color: AppColors.black,
              ),
            ),
            10.sH,
          ]),
        ),
      ),
    );