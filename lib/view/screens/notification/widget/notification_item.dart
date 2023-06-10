import 'package:ecommerce/index.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    Key? key,
    required this.time,
    required this.content,
    required this.title,
  }) : super(key: key);
  final String content;
  final String title;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingSymme(horizontal: 10),
      child: Container(
        constraints: const BoxConstraints(maxWidth: double.infinity),
        padding: paddingOnly(bottom: 5, right: 10, left: 10),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 40.height,
                  width: 45.weight,
                  padding: paddingOnly(top: 5, bottom: 5, left: 5, right: 8),
                  decoration: BoxDecoration(
                    color: AppColors.secondaryLight,
                    borderRadius: BorderRadius.circular(6.height),
                    border: Border.all(
                      color: AppColors.secondary,
                      width: .5.weight,
                    ),
                  ),
                  child: Image.asset(
                    title == "Order"
                        ? AppImages.dilvery
                        : AppImages.cashOnDelivery,
                    fit: BoxFit.contain,
                  ),
                ),
                10.sW,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextWidget(title, fontWeight: FontWeight.w600),
                          TextWidget(
                            calculationTime(time),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                      4.sH,
                      TextWidget(
                        content,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(color: AppColors.offWhite3),
          ],
        ),
      ),
    );
  }
}
