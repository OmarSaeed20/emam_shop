import 'package:flutter/cupertino.dart';

import '/index.dart';

Row titleRow(String title,
        {VoidCallback? onTap, double? foSiz, bool seeAll = true}) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TextWidget(
            title,
            fontSize: foSiz ?? 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        if (seeAll)
          GestureDetector(
            onTap: onTap ?? () {},
            child: Row(
              children: [
                TextWidget("See all",
                    color: AppColors.awsm, fontSize: 14.weight),
                4.sW,
                Icon(
                  Icons.keyboard_double_arrow_right_rounded,
                  size: 14.height,
                  color: AppColors.awsm,
                )
              ],
            ),
          ),
      ],
    );
