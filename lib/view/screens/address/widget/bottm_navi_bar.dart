import '../../../../index.dart';

bottmNaviBarAdd() {
  return GetBuilder<GetAddressDataControllerImp>(
    builder: (controller) {
      handleAddressEnum(AdresEnm addresEnum) {
        switch (addresEnum) {
          case AdresEnm.addres:
            return addres(controller);
          case AdresEnm.addAddres:
            return addAddres(controller);
          case AdresEnm.cancel:
            return addres(controller);
          default:
        }
      }

      return AnimatedContainer(
        duration: const Duration(seconds: 1),
        curve: Curves.decelerate,
        height: controller.selectedIndexEnum == AdresEnm.addres
            ? 190.height
            : 550.height,
        width: double.infinity,
        child: handleAddressEnum(controller.selectedIndexEnum!),
      );
    },
  );
}

addres(GetAddressDataControllerImp controller) => Container(
      padding: paddingOnly(top: 16, right: 16, left: 16, bottom: 12),
      child: Column(
        children: [
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              ListTile(
                contentPadding: paddingSymme(),
                horizontalTitleGap: 0,
                leading: const Icon(Icons.pin_drop, color: AppColors.primary2),
                title: TextWidget('Your location', fontSize: 15.weight),
                trailing: TextButton(
                  onPressed: () {
                    controller.selectedIndexEnum = AdresEnm.cancel;
                    controller.changeSelectedIndex();
                  },
                  child: const TextWidget('CHANGE'),
                ),
              ),
              TextWidget(
                controller.getAddress!.text,
                fontSize: 15.weight,
                color: AppColors.greyDeep,
                fontWeight: FontWeight.w400,
              ),
            ]),
          ),
          BtnWidget(
            'CONFIRM LOCATION',
            height: 40.height,
            onPressed: () => controller.changeSelectedIndex(),
          ),
        ],
      ),
    );

addAddres(GetAddressDataControllerImp controller) {
  return Container(
    padding: paddingOnly(top: 10, right: 16, left: 16, bottom: 12),
    child: Form(
      key: controller.formKey,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(
                    contentPadding: paddingSymme(),
                    horizontalTitleGap: 0,
                    leading:
                        const Icon(Icons.pin_drop, color: AppColors.primary2),
                    title: TextWidget('Edit location', fontSize: 15.weight),
                    /* trailing: TextButton(
                      onPressed: onPressed,
                      child: const TextWidget('CHANGE'),
                    ), */
                  ),
                  TextInputWidget(
                    "Address*",
                    type: TextInputType.name,
                    fontSize: 12.weight,
                    controller: controller.getAddress,
                    validator: (vl) {
                      return addressValied(AddressType.address, val: vl!);
                    },
                  ),
                  16.sH,
                  TextInputWidget(
                    "Landmark",
                    type: TextInputType.name,
                    fontSize: 12.weight,
                    hintText: "e.g. Near ABC School",
                    controller: controller.landMark,
                    validator: (vl) =>
                        addressValied(AddressType.landMark, val: vl!),
                  ),
                  16.sH,
                  Row(
                    children: [
                      Expanded(
                        child: TextInputWidget(
                          "Name*",
                          type: TextInputType.name,
                          fontSize: 12.weight,
                          controller: controller.userName,
                          validator: (vl) {
                            return addressValied(AddressType.address, val: vl!);
                          },
                        ),
                      ),
                      16.sW,
                      Expanded(
                        child: TextInputWidget(
                          "Address Title*",
                          hintText: "e.g. Home.",
                          fontSize: 12.weight,
                          validator: (vl) =>
                              addressValied(AddressType.adTitle, val: vl!),
                          controller: controller.adrressTitle,
                        ),
                      ),
                    ],
                  ),
                  16.sH,
                ],
              ),
            ),
          ),
          BtnWidget(
            'SAVE ADDRESS',
            height: 40.height,
            onPressed: () => controller.changeSelectedIndex(),
          ),
        ],
      ),
    ),
  );
}
