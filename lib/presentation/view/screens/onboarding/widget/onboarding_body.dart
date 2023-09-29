import '/index.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({
    super.key,
    required this.title,
    required this.img,
    required this.supTitle,
  });

  final String img;
  final String title;
  final String supTitle;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        margin: paddingOnly(top: 30.height, right: 14.weight, left: 14.weight),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextWidget(title, fontSize: 20, fontWeight: FontWeight.w700),
            65.sH,
            Image.asset(img, height: 300.height),
            80.sH,
            Padding(
              padding: paddingSymme(horizontal: 18),
              child: TextWidget(supTitle, textAlign: TextAlign.center),
            ),
            160.sH,
          ],
        ),
      ),
    );
  }
}
