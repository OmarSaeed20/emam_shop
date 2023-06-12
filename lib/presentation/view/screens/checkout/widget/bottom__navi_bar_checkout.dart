 
import '../../../../../index.dart';

botNavigationBarCheckout() {
  return GetBuilder<CartControllerImp>(
    builder: (controller) {
      return Container(
        height: 110.height,
        width: double.infinity,
        color: AppColors.offWhite,
        padding: paddingOnly(top: 12, bottom: 16, right: 20, left: 20),
        child: GetBuilder<CartControllerImp>(builder: (controller) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 40.height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextWidget("total", fontSize: 14),
                        TextWidget(
                          "\$ ${controller.totalPrice}",
                          color: AppColors.awsm,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                  ),
                  10.sW,
                  BtnWidget(
                    "Pay Now",
                    height: 40.height,
                    width: 165.weight,
                    isLoading: controller.requestStatus == RequestStatus.loading
                        ? true
                        : false,
                    onPressed: () {
                      debugPrint('>>>>>>>>>>>>>>>>>');
                      controller.onTapCheckout();
                    },
                  )
                ],
              ),
              10.sH,
              SizedBox(
                height: 28.height,
                child: const TextWidget(
                  "This is the final step, after you touching Pay Now button, the payment will be transaction",
                  fontSize: 12,
                  color: AppColors.grey,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          );
        }),
      );
    },
  );
}
