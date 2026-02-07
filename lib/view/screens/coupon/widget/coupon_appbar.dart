import 'package:ecommerce/index.dart';

couponAppBar({required void Function()? applyTap,void Function(String)? onChanged,TextEditingController? searchController}) {
  return Row(
    children: [
      Expanded(
        child: Container(
          width: double.infinity,
          margin: paddingOnly(left: 16, right: 16, bottom: 10),
          child: TextField(
            keyboardType: TextInputType.name,
            controller: searchController,
            style: TextStyle(color: AppColors.black, fontSize: 16.weight),
            decoration: InputDecoration(
              contentPadding: paddingOnly(left: 10, top: 15, bottom: 15),
              hintText: "Have a coupon code?",
              hintStyle: TextStyle(color: AppColors.grey, fontSize: 12.weight),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: AppColors.grey150,
            ),
            onChanged: onChanged,
          ),
        ),
      ),
      Container(
        height: 40.height,
        width: 65.weight,
        alignment: Alignment.centerLeft,
        child: GestureDetector(
          onTap: applyTap,
          child: TextWidget(
            "apply".toUpperCase(),
            fontSize: 15.weight,
            fontWeight: FontWeight.w400,
          ),
        ),
      )
    ],
  );
}
