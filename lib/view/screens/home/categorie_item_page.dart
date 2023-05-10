import '/index.dart';

class CategorieItemPage extends StatelessWidget {
  const CategorieItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CategoriesModel model = Get.arguments;
    return Scaffold(
      appBar: AppBar(title: Text('${model.name}')),
      body: Container(),
    );
  }
}
