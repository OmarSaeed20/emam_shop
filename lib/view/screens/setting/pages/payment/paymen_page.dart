import '../../../../../index.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PaymentPage')),
      body: const Center(child: TextWidget("text")),
    );
  }
}
