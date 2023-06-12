import '../../../../../../index.dart';

class HelpSupportPage extends StatelessWidget {
  const HelpSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HelpSupportPage')),
      body: const Center(child: TextWidget("text")),
    );
  }
}
