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
        body: SafeArea(
          child:
              controller.getcurrentScreen.elementAt(controller.getCurrentIndex),
        ),
      ),
    );
  }
}
