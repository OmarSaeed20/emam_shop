import '/index.dart';

customMateIcon({
  required void Function()? onTap,
  required IconData? icon,
  required bool? isSelect,
}) =>
    GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Positioned(
              bottom: 0,
              right: 2,
              left: 2,
              child: Container(
                height: 2,
                decoration: BoxDecoration(
                  color: isSelect == true ? AppColors.awsm : AppColors.trans,
                ),
              )),
          SizedBox(
            height: 40.height,
            width: 40.weight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isSelect == true
                    ? Icon(icon, size: 30.weight)
                        .animate()
                        .fadeIn(curve: Curves.easeInOutCirc)
                        .scaleX()
                        .shimmer(delay: 500.ms, colors: <Color>[
                        AppColors.primary,
                        const Color(0xff5b0060),
                        const Color(0xff870160),
                        const Color(0xffac255e),
                        const Color(0xffca485c),
                        const Color(0xffe16b5c),
                        const Color(0xfff39060),
                        const Color(0xffffb56b),
                      ]).scale(delay: const Duration(milliseconds: 100))
                    : Icon(icon, size: 23.weight, color: AppColors.secondary.withOpacity(.7),),
              ],
            ),
          ),
        ],
      ),
    );
