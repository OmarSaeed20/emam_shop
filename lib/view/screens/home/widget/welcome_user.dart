import '/index.dart';

Widget welcomeUser() => TextWidget(
      "Good morning, ${DatabaseHelper.to.getString(EndPoint.userName)}",
      fontWeight: FontWeight.w600,
      fontSize: 20,
    )
        .animate()
        .fadeIn(curve: Curves.easeInCirc)
        .shimmer(delay: 2000.ms, colors: <Color>[
          AppColors.black,
          const Color(0xff5b0060),
          const Color(0xff870160),
          const Color(0xffac255e),
          const Color(0xffca485c),
          const Color(0xffe16b5c),
          const Color(0xfff39060),
          const Color(0xffffb56b),
          AppColors.awsm
        ])
        .swap(
          delay: const Duration(seconds: 4),
          builder: (context, child) => TextWidget(
            "What Would You Like To Oredr Today?",
            fontSize: 17.weight,
            fontWeight: FontWeight.w600,
          ).animate().shimmer(delay: 2000.ms, colors: <Color>[
            AppColors.black,
            const Color(0xff5b0060),
            const Color(0xff870160),
            const Color(0xffac255e),
            const Color(0xffca485c),
            const Color(0xffe16b5c),
            const Color(0xfff39060),
            const Color(0xffffb56b),
            AppColors.awsm
          ]),
        )
        // .flip(curve: Curves.bounceIn)
        .shake();
