import 'package:ecommerce/index.dart';

class RadioListTileWiget extends StatelessWidget {
  const RadioListTileWiget({
    super.key,
    required this.img,
    required this.title,
    required this.vlu,
    required this.groupVlu,
    required this.onChanged,
  });
  final String img;
  final String title;
  final Object vlu;
  final Object groupVlu;
  final void Function(Object?) onChanged;
  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      title: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 35.height,
              width: 38.weight,
              decoration:
                  BoxDecoration(image: DecorationImage(image: AssetImage(img))),
            ),
            6.sH,
            TextWidget(title, fontSize: 12),
          ],
        ),
      ),
      value: vlu,
      groupValue: groupVlu,
      onChanged: onChanged,
    );
  }
}
