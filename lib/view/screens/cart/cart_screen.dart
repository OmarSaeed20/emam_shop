import '../../../index.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CartScreen')),
      body: const Center(child: TextWidget('CartScreen')),
    );
  }
}