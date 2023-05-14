import '/index.dart';

Row titleRow(String title,
        {VoidCallback? onTap, double? foSiz, bool seeAll = true}) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TextWidget(
            title,
            fontSize: foSiz ?? 17.weight,
            fontWeight: FontWeight.w700,
          ),
        ),
        if (seeAll)
          TextButton(
            onPressed: onTap ?? () {},
            child: Row(
              children: [
                TextWidget("See all", fontSize: 14.weight),
                3.sW,
                Icon(
                  MyLocaleControllerImp.to.themeData == themeEN
                      ? Icons.keyboard_double_arrow_right_rounded
                      : Icons.keyboard_double_arrow_left_rounded,
                  // CupertinoIcons.chevron_right_2,
                  size: 16.weight,
                  color: AppColors.primary,
                ),
              ],
            ),
          ),
      ],
    );
