import "/index.dart";

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  initialData() async {
    bool isConnected = await checkInternetConnection();
    debugPrint("Is connected to internet: $isConnected");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const TextWidget('Test View Page', fontSize: 30),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: GetBuilder<TestController>(
            builder: (controller) {
              // log(controller.requestStatus.toString());
              return HandlingRequstView(
                controller.requestStatus,
                widget: controller.userData != null
                    ? successState(controller)
                    : lodaingState(),
              );
            },
          ),
        ),
      ),
    );
  }

  Center successState(TestController controller) {
    return Center(
      child: Column(
        children: [
          TextWidget(controller.userData!.userName!),
          TextWidget(controller.userData!.email!),
          TextWidget(controller.userData!.phone!),
          TextWidget(controller.userData!.dateCreate!),
          TextWidget(calculationTime(controller.userData!.dateCreate!)),
        ],
      ),
    );
  }

  Center lodaingState() {
    return const Center(child: CircularProgressIndicator());
  }
}

//  Unhandled Exception: MissingPluginException(No implementation found for method check on channel plugins.flutter.io/connectivity)