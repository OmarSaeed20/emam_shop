import '/index.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({super.key, required this.list});

  final OnBoardingModel list;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        margin:
            EdgeInsets.only(top: 30.height, right: 14.weight, left: 14.weight),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextWidget(list.title!, fontSize: 20, fontWeight: FontWeight.bold),
            65.sH,
            Image.asset(list.image!, height: 300.height),
            80.sH,
            TextWidget(
              list.supTitle!,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w400,
            ),
            160.sH,
          ],
        ),
      ),
    );
  }
}
