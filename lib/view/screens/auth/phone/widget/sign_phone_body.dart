import 'package:flutter/cupertino.dart';

import '/index.dart';

class TextFormSignPhoneBody extends StatelessWidget {
  const TextFormSignPhoneBody({super.key, required this.controller});
  final PhoneControllerImp controller;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.phoneForm,
      onChanged: () => controller.onChangedSignWithPhone(),
      child: Column(
        children: [
          TextInputWidget(
            "phone",
            prefixIcon: Icons.local_phone_sharp,
            type: const TextInputType.numberWithOptions(decimal: true),
            suffixIconColor: controller.isEmptyFeild != true
                ? Colors.green.shade600
                : AppColors.grey,
            suffixIcon: CupertinoIcons.checkmark_alt_circle_fill,
            controller: controller.phone,
            validator: (val) =>valiedInput(val: val!, InputType.phone),
          ),
        ],
      ),
    );
  }
}
