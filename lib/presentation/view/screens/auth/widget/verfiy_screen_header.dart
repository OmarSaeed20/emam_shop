import 'package:ecommerce/index.dart';

verfiyScreenHeader(String email) => Column(
      children: [
        screenPick(
          icon: Icons.hourglass_empty_rounded,
          text: AppStrings.verificationCode.tr,
        ),
        40.sH,
        TextWidget(
          AppStrings.otpsent.tr,
          color: AppColors.grey,
          fontWeight: FontWeight.w600,
        ),
        TextWidget(
          email,
          fontWeight: FontWeight.bold,
          fontSize: 12.weight,
          color: AppColors.awsm,
        ),
      ],
    );