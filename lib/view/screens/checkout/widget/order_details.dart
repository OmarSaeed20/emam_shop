import '../../../../index.dart';

class OrderDetailsWidget extends StatelessWidget {
  const OrderDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final CartControllerImp cartcontroller = Get.find();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: paddingSymme(horizontal: 16),
          child: const TextWidget('Shoping', fontSize: 15),
        ),
        16.sH,
        GetBuilder<AddressControllerImp>(
          builder: (controller) => Container(
            height:
                controller.selectedAdressmodel != null ? 140.height : 95.height,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.grey100,
              borderRadius: BorderRadius.circular(6.height),
            ),
            padding: paddingSymme(horizontal: 14, vertical: 16),
            margin: paddingSymme(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  controller.selectedAdressmodel != null
                      ? "${controller.selectedAdressmodel!.fullName}"
                      : cartcontroller.usernaem,
                  fontSize: 14,
                ),
                8.sH,
                TextWidget(
                  "${cartcontroller.userEmail}\n${cartcontroller.userPhone}",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                if (controller.selectedAdressmodel != null)
                  Column(
                    children: [
                      8.sH,
                      TextWidget(
                        "${controller.selectedAdressmodel!.fullAddress}",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  )
                else
                  Container()
              ],
            ),
          ),
        )
      ],
    );
  }
}
