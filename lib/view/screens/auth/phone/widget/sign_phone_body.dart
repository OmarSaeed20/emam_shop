import 'package:flutter/cupertino.dart';

import '/index.dart';

class TextFormSignPhoneBody extends StatelessWidget {
  const TextFormSignPhoneBody({super.key, required this.controller});
  final PhoneControllerImp controller;

  @override
  Widget build(BuildContext context) {
    return Form(
      onChanged: () => controller.onChangedSignWithPhone(),
      child: Column(
        children: [
          TextInputWidget(
            AppStrings.phone.tr,
            prefixIcon: Icons.phone,
            type: TextInputType.phone,
            suffixIconColor: controller.isEmptyFeild != true
                ? Colors.green.shade600
                : AppColors.grey,
            suffixIcon: CupertinoIcons.checkmark_alt_circle_fill,
            controller: controller.phone,
            validator: (val) => GetUtils.isLengthEqualTo(val, 11)
                ? null
                : 'The phone field is required.',
          ),
        ],
      ),
    );
  }
}
