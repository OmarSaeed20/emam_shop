import 'package:ecommerce/core/constant/static.dart';
import 'package:ecommerce/view/widgets/btn_widget.dart';

import "/index.dart";

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
      itemCount: Static.onBoardingList.length,
      itemBuilder: (context, index) {
        final list = Static.onBoardingList[index];
        return Container(
          height: Dimensions.screenHeight,
          width: Dimensions.screenWidth,
          margin: EdgeInsets.only(
            top: getProportScrHeight(30),
            right: getProportionateScreenWidth(14),
            left: getProportionateScreenWidth(14),
          ),
          child: SafeArea(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextWidget(
                list.title,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              sizeHei(80),
              Image.asset(list.image),
              sizeHei(80),
              TextWidget(
                list.supTitle,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w400,
              ),
              const Spacer(),
              BtnWidget('data', onPressed: () {}),
              TextButton(onPressed: () {}, child: const TextWidget('data')),
            ],
          )),
        );
      },
    ));
  }
}
