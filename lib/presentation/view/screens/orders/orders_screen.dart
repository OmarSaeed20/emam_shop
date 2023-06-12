import '../../../../index.dart';

class MyOrdersScreen extends GetView<MyOrderControllerImp> {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: GetBuilder<MyOrderControllerImp>(
        builder: (controller) {
          return TabBarView(
            controller: controller.tabController,
            children: const [
              OrdersPendingSection(),
              OrdersArchiveSection(),
            ],
          );
        },
      ),
    );
  }

  AppBar appBar() => AppBar(
        title: const Text('My Orders'),
        bottom: TabBar(
          controller: controller.tabController,
          enableFeedback: true,
          tabs: [
            Tab(
              icon: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.ballot_rounded, color: AppColors.primary),
                  10.sW,
                  const TextWidget("Orders", fontSize: 14),
                ],
              ),
            ),
            Tab(
              icon: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.archive, color: AppColors.primary),
                  10.sW,
                  const TextWidget("Archive", fontSize: 14),
                ],
              ),
            ),
          ],
        ),
      );
}
