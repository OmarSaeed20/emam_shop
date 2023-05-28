import '../../../index.dart';

class MyAddressPage extends StatelessWidget {
  const MyAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: AddressControllerImp.to.scaffoldkey,
      appBar: AppBar(title: const Text('Delivery address')),
      bottomNavigationBar: botNavigationBar(),
      body: GetBuilder<AddressControllerImp>(
        builder: (controller) => HandlingRequstView(
          controller.requestStatus,
          widget: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.location_searching,
                      color: AppColors.greyDeep),
                  title: TextWidget(
                    'Choose Current Location',
                    fontSize: 12.weight,
                    fontWeight: FontWeight.w400,
                  ),
                  onTap: () => controller.goToSelectNewAddress(
                    addrEnum: AdresEnm.addAddres,
                  ),
                  trailing: Icon(
                    controller.lang == EndPoint.enCode
                        ? Icons.keyboard_arrow_right_sharp
                        : Icons.keyboard_arrow_left_sharp,
                    color: AppColors.primary2,
                  ),
                ),
                Container(
                  height: 1.height,
                  width: double.infinity,
                  margin: paddingSymme(horizontal: 16, vertical: 16),
                  color: AppColors.grey200,
                ),
                ...List.generate(
                  controller.listaddress.length,
                  (index) => ListTile(
                      onTap: () {
                        controller.goToSelectNewAddress(
                          addrEnum: AdresEnm.edit,
                          model: controller.listaddress[index],
                        );
                      },
                      leading: const Icon(Icons.location_on,
                          color: AppColors.greyDeep),
                      title: TextWidget(
                          '${controller.listaddress[index].title}',
                          fontSize: 12.weight),
                      style: ListTileStyle.drawer,
                      subtitle: TextWidget(
                        '${controller.listaddress[index].fullAddress}',
                        fontSize: 9.weight,
                        fontWeight: FontWeight.w400,
                      ),
                      horizontalTitleGap: 0,
                      trailing: IconButton(
                        onPressed: () => controller.deleteAddress(
                            controller.listaddress[index].addressId!),
                        icon: Icon(
                          Icons.delete,
                          color: AppColors.red,
                          size: 20.weight,
                        ),
                      )
                      /* TextWidget(
                      "100 m",
                      fontSize: 10.weight,
                      fontWeight: FontWeight.w400,
                      fontFamily: AppStrings.montserrat,
                    ), */
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  botNavigationBar() {
    return Container(
      height: 85.height,
      width: double.infinity,
      color: AppColors.offWhite,
      padding: paddingOnly(top: 16, bottom: 25, right: 20, left: 20),
      child: BtnWidget(
        AppStrings.coontinue.tr,
        height: 40.height,
        onPressed: () {},
      ),
    );
  }
/*   IconButton floatingActionButtm() {
    return IconButton(
      onPressed: () {},
      icon: Container(
        width: 80.weight,
        decoration: BoxDecoration(
          // shape: BoxShape.circle,
          border: Border.all(width: .7.weight, color: AppColors.primary),
          borderRadius: BorderRadius.circular(6.height),
          color: AppColors.white,
        ),
        padding: paddingSymme(horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const TextWidget('select'),
            Container(
              padding: paddingSymme(vertical: 4),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                // borderRadius: BorderRadius.circular(6.height),
                // color: AppColors.primary,
              ),
              child: const Icon(
                Icons.add_location_alt_outlined,
                // size: 35.weight,
                color: AppColors.primary2,
              ),
            ),
          ],
        ),
      ),
    );
  } */
}
