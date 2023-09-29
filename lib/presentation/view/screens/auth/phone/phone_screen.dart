import 'package:ecommerce/presentation/view/screens/auth/phone/widget/bootm_navig_bar.dart';
import 'package:flutter/cupertino.dart';

import '/index.dart';

class PhoneScreen extends StatelessWidget {
  const PhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GetBuilder<PhoneControllerImp>(
        builder: (controller) => PhBottomNavigationBar(controller: controller),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: GetBuilder<PhoneControllerImp>(
            builder: (controller) {
              return SizedBox(
                // padding: paddingSymme(horizontal: 25),
                width: double.infinity,
                child: Column(
                  children: [const IconAndTextBack(), _body(controller)],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

_body(PhoneControllerImp controller) => Padding(
      padding: paddingSymme(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: screenPick(
              icon: CupertinoIcons.phone,
              text: AppStrings.phoneNum.tr,
            ),
          ),
          30.sH,
          authTitle("set your ${AppStrings.phone.tr} !"),
          10.sH,
          TextFormSignPhoneBody(controller: controller),
          20.sH
        ],
      ),
    );
