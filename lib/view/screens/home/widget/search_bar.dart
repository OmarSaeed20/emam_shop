import 'package:ecommerce/index.dart';
import 'package:flutter/cupertino.dart';

Widget searchBar() => Row(
      children: [
        Expanded(
          child: TextField(
            keyboardType: TextInputType.text,
            style: TextStyle(color: AppColors.black, fontSize: 16.weight),
            decoration: InputDecoration(
                contentPadding: EdgeInsetsDirectional.fromSTEB(
                    10.weight, 15.height, 0.0, 15.weight),
                hintText: "Find for food or phone",
                hintStyle:
                    TextStyle(color: AppColors.grey, fontSize: 12.weight),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: AppColors.grey200,
                prefixIcon: const Icon(CupertinoIcons.search)),
          ),
        ),
        Container(
          height: 45.height,
          width: 45.weight,
          padding: paddingSymme(horizontal: 2),
          margin: paddingOnly(left: 10),
          child: Image.asset(
            height: 35.height,
            width: 35.weight,
            AppImages.filter2,
          ),
        ),
      ],
    );
