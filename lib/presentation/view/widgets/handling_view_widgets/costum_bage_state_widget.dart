import '../../../../index.dart';
import 'package:lottie/lottie.dart';

class CustomBageStateWidget extends StatelessWidget {
  const CustomBageStateWidget({
    super.key,
    this.image,
    required this.title,
    required this.supTitle,
    this.lottie,
    this.isImage = true,
    this.fitImg,
    this.fitLot,
    this.isLoading = false,
  });
  final String? image;
  final String title;
  final String supTitle;
  final BoxFit? fitImg;
  final BoxFit? fitLot;
  final String? lottie;
  final bool? isImage;
  final bool? isLoading;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isLoading == true
              ? PreferredSize(
                  preferredSize: Size(double.infinity, .2.height),
                  child: LinearProgressIndicator(
                    backgroundColor: AppColors.secondary.withOpacity(.5),
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(AppColors.awsm),
                  ),
                )
              : const Center(),
          Align(
            alignment: Alignment.center,
            child: isImage == true
                ? Image.asset(
                    image!,
                    fit: fitImg ?? BoxFit.contain,
                    height: 400.height,
                    width: 300.weight,
                  )
                : Column(
                    children: [
                      150.sH,
                      Lottie.asset(
                        lottie!,
                        height: 250.height,
                        fit: fitLot ?? BoxFit.fitWidth,
                        width: 300.weight,
                      ),
                    ],
                  ),
          ),
          15.sH,
          TextWidget(title, fontSize: 16.weight),
          TextWidget(
            supTitle,
            fontSize: 14.weight,
            textAlign: TextAlign.center,
            color: AppColors.grey,
          ),
          25.sH,
        ],
      ),
    );
  }
}
