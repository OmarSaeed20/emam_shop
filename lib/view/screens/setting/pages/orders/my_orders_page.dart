import '../../../../../index.dart';

class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MyOrdersPage')),
      body: const Center(child: TextWidget("text")),
    );
  }
}
