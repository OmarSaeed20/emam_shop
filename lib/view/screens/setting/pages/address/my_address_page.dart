import '../../../../../index.dart';

class MyAddressPage extends StatelessWidget {
  const MyAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MyAddressPage')),
      body: const Center(child: TextWidget("text")),
    );
  }
}
