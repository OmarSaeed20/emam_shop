import "dart:developer";

import "/index.dart";
import "core/function/handling_requset_view.dart";

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  initialData() async {
    bool isConnected = await checkInternetConnection();
    log("Is connected to internet: $isConnected");
  }

  @override
  void initState() {
    initialData();
    super.initState();
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
        child: GetBuilder<TestController>(builder: (controller) {
          // log(controller.requestStatus.toString());
          return HandlingRequstView(
            controller.requestStatus,
            widget: successState(controller),
          );
        }),
      )),
    );
  }

  Center successState(TestController controller) {
    return Center(
        child: Column(
      children: [
        TextWidget(controller.userData!.userName!),
        TextWidget(controller.userData!.userEmail!),
        TextWidget(controller.userData!.userPhone!),
        TextWidget(controller.userData!.userCreate!),
      ],
    ));
  }

  Center lodaingState() {
    return const Center(child: CircularProgressIndicator());
  }
}
//  Unhandled Exception: MissingPluginException(No implementation found for method check on channel plugins.flutter.io/connectivity)