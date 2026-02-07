import '../../../../index.dart';

bottmNaviBarEdit() {
  return GetBuilder<AddressControllerImp>(
    builder: (controller) {
      return AnimatedContainer(
        duration: const Duration(seconds: 1),
        curve: Curves.decelerate,
        height: 550.height,
        width: double.infinity,
        child: editAddres(controller),
      );
    },
  );
}

editAddres(AddressControllerImp controller) {
  GetAddressDataControllerImp getAddresscontr = Get.find();

  return controller.editModel != null
      ? Container(
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
                          leading: const Icon(
                            Icons.pin_drop,
                            color: AppColors.primary2,
                          ),
                          title:
                              TextWidget('Edit location', fontSize: 15.weight),
                          /* trailing: TextButton(
                      onPressed: onPressed,
                      child: const TextWidget('CHANGE'),
                    ), */
                        ),
                        TextInputWidget(
                          "Address*",
                          type: TextInputType.name,
                          fontSize: 12.weight,
                          controller: controller.editAddress,
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
                          controller: controller.editlandMark,
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
                                controller: controller.edituserName,
                                validator: (vl) {
                                  return addressValied(
                                    AddressType.address,
                                    val: vl!,
                                  );
                                },
                              ),
                            ),
                            16.sW,
                            Expanded(
                              child: TextInputWidget(
                                "Address Title*",
                                hintText: "e.g. Home.",
                                fontSize: 12.weight,
                                validator: (vl) => addressValied(
                                  AddressType.adTitle,
                                  val: vl!,
                                ),
                                controller: controller.editTitle,
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
                  onPressed: () {
                    if (controller.formKey.currentState!.validate()) {
                      getAddresscontr.selectedIndexEnum = AdresEnm.edit;
                      getAddresscontr.changeSelectedIndex(
                        addressId: controller.editModel!.addressId,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        )
      : Container();
}
