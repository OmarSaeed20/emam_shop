import '../../../../../index.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('EditProfilePage')),
      body: const Center(child: TextWidget("text")),
    );
  }
}
