import '../../../index.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('NotificationScreen')),
      body: const Center(child: TextWidget('NotificationScreen')),
    );
  }
}
