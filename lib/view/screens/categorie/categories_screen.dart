import '/index.dart';

class CategorigsScreen extends StatelessWidget {
  const CategorigsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          "Categories",
          fontSize: 20.weight,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: GetBuilder<HomeControllerImp>(
        builder: (controller) => HandlingRequstView(
          controller.requestStatus,
          widget: _body(controller),
        ),
      ),
    );
  }

  SafeArea _body(HomeControllerImp controller) {
    return SafeArea(
      child: ListView.builder(
        itemCount: controller.categories!.length,
        itemBuilder: (context, index) {
          return listTileItems(controller, index);
        },
      ),
    );
  }
}

/* screenAppbar(String title) => Padding(
      padding: paddingSymme(horizontal: 6.weight),
      child: ListTile(
        leading: GestureDetector(
            onTap: () => Get.back(),
            child:
                const Icon(Icons.arrow_back_rounded, color: AppColors.primary)),
        title: TextWidget(
          title,
          // textAlign: TextAlign.center,
          fontSize: 20.weight,
          fontWeight: FontWeight.w600,
        ),
      ),
    ); */
