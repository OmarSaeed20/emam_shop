import '/index.dart';

class HomeLoadingPage extends StatelessWidget {
  const HomeLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           const TextWidget(
              "Loading ...",
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
           const TextWidget("Please Wait"),
            25.sH,
            const Center(child: CircularProgressIndicator()),
          ],
        ));
  }
}
