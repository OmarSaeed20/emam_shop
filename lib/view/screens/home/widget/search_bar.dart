import 'package:ecommerce/index.dart';
import 'package:flutter/cupertino.dart';

Widget searchBar({
  required void Function()? onPressed,
  required void Function(String)? onChanged,
  bool showFilter = true,
}) =>
    Row(
      children: [
        Expanded(
          child: TextField(
            keyboardType: TextInputType.name,
            style: TextStyle(color: AppColors.black, fontSize: 16.weight),
            decoration: InputDecoration(
              contentPadding: EdgeInsetsDirectional.fromSTEB(
                  10.weight, 15.height, 0.0, 15.weight),
              hintText: "Find for food or phone",
              hintStyle: TextStyle(color: AppColors.grey, fontSize: 12.weight),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: AppColors.grey150,
              prefixIcon: IconButton(
                onPressed: onPressed,
                icon: const Icon(CupertinoIcons.search),
              ),
            ),
            onChanged: onChanged,
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

Container searchOnly({
  required void Function()? onPressed,
  required void Function(String)? onChanged,
}) {
  return Container(
    width: double.infinity,
    margin: paddingOnly(left: 16, right: 16, bottom: 10),
    child: TextField(
      keyboardType: TextInputType.name,
      style: TextStyle(color: AppColors.black, fontSize: 16.weight),
      decoration: InputDecoration(
        contentPadding: EdgeInsetsDirectional.fromSTEB(
            10.weight, 15.height, 0.0, 15.weight),
        hintText: "home.., books!",
        hintStyle: TextStyle(color: AppColors.grey, fontSize: 12.weight),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: AppColors.grey150,
        prefixIcon: IconButton(
          onPressed: onPressed,
          icon: const Icon(CupertinoIcons.search),
        ),
      ),
      onChanged: onChanged,
    ),
  );
}
