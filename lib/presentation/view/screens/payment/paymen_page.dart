import '../../../../index.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PaymentPage')),
      body: Center(
        child: Container(
          margin: paddingSymme(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextWidget('Payment', fontSize: 15),
              16.sH,
              Container(
                height: 366.height,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.grey100,
                  borderRadius: BorderRadius.circular(6.height),
                ),
                padding: paddingOnly(left: 15, right: 17, top: 6, bottom: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: const TextWidget(
                        "Add Credit / Debit Card",
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                      leading: const Icon(Icons.credit_card),
                      horizontalTitleGap: 0,
                      dense: true,
                      contentPadding: paddingOnly(),
                    ),
                    4.sH,
                    const PaymentTextInputWidget("Card Holder’s Name"),
                    10.sH,
                    const PaymentTextInputWidget("Card Number"),
                    16.sH,
                    const TextWidget(
                      'Expire Date',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    8.sH,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Expanded(
                          child: PaymentTextInputWidget("Month"),
                        ),
                        10.sW,
                        const Expanded(
                          child: PaymentTextInputWidget("Year"),
                        ),
                      ],
                    ),
                    30.sH,
                    Row(
                      children: [
                        SizedBox(
                          width: 150.weight,
                          child: const PaymentTextInputWidget("Security Code"),
                        ),
                        10.sW,
                        Icon(
                          Icons.info_outline,
                          color: AppColors.grey,
                          size: 20.weight,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
