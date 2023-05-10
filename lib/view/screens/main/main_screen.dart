import '/index.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainControllerImp>(
        builder: (controller) => Scaffold(
              extendBody: true,
              bottomNavigationBar: BottomNavigatiBar(controller: controller),
              key: controller.getkey,
              appBar: controller.getAppBar[controller.getCurrentIndex],
              body: PageStorage(
                bucket: controller.getBucket,
                child: controller.getcurrentScreen,
              ),
            ));
  }
}

class BottomNavigatiBar extends StatelessWidget {
  const BottomNavigatiBar({super.key, required this.controller});

  final MainControllerImp controller;

  @override
  Widget build(BuildContext context) {
    var curr = controller.getCurrentIndex;
    return Container(
      padding: paddingSymme(horizontal: 5, vertical: 10),
      margin: paddingSymme(horizontal: 28, vertical: 18),
      decoration: BoxDecoration(
          color: AppColors.darkCardColor,
          // color: AppColors.primaryMid,
          borderRadius: BorderRadius.all(Radius.circular(6.height))),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        homeMateIcon(
          isSelect: curr == 0 ? true : false,
          onTap: () => controller.getCurrentScreen(index: 0),
        ),
        favvMateIcon(
          onTap: () => controller.getCurrentScreen(index: 3),
          isSelect: curr == 3 ? true : false,
        ),
        cartMateIcon(
          isSelect: curr == 2 ? true : false,
          onTap: () => controller.getCurrentScreen(index: 2),
        ),
        walletMateIcon(
          isSelect: curr == 1 ? true : false,
          onTap: () => controller.getCurrentScreen(index: 1),
        ),
        settingMateIcon(
          isSelect: curr == 4 ? true : false,
          onTap: () => controller.getCurrentScreen(index: 4),
        )
      ]),
    );
  }
}
