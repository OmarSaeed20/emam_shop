import '../../../index.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SettingScreen')),
      body: const Center(child: TextWidget('SettingScreen')),
    );
  }
}
