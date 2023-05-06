import '/index.dart';
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
    appBar: AppBar(title: const Text('MainScreen'),centerTitle: true),

    body: const Center(
      child: TextWidget("Main Screen",fontWeight: FontWeight.bold)
      ),
    );
  }
}