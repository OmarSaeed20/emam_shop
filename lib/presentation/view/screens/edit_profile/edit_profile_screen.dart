import 'package:ecommerce/presentation/view/widgets/handling_view_widgets/loading_state_widget.dart';

import '../../../../index.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double widthC = MediaQuery.of(context).size.width * 100;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const TextWidget("Profile"),
        flexibleSpace: Container(color: AppColors.trans),
      ),
      body: SingleChildScrollView(
        child: GetBuilder<UserControllerImp>(
          builder: (controller) {
            return HandlingRequstView(
              controller.requestStatus,
              widget: controller.userdata == null
                  ? const LoadingStateWidget()
                  : Column(
                      children: <Widget>[
                        buildHeader(),
                        _buildMainInfo(context, widthC, controller),
                        _buildInfo(context, widthC, controller),
                      ],
                    ),
            );
          },
        ),
      ),
    );
  }

  _buildMainInfo(
      BuildContext context, double width, UserControllerImp controller) {
    return Container(
      width: width,
      margin: const EdgeInsets.all(10),
      alignment: AlignmentDirectional.center,
      child: TextWidget(
        controller.userdata!.userName ?? "",
        fontSize: 18,
        color: AppColors.primary,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  _buildInfo(BuildContext context, double width, UserControllerImp controller) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Card(
        child: Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.email, color: AppColors.primary),
                    title: const TextWidget("E-Mail", fontSize: 14),
                    subtitle: TextWidget(
                      controller.userdata!.email ?? "",
                      fontSize: 14,
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.phone, color: AppColors.primary),
                    title: const TextWidget("Phone Number", fontSize: 14),
                    subtitle: TextWidget(
                      controller.userdata!.phone ?? "",
                      fontSize: 14,
                    ),
                  ),
                  const Divider(),
                  const ListTile(
                    leading: Icon(Icons.person, color: AppColors.primary),
                    title: TextWidget("About", fontSize: 14),
                    subtitle: TextWidget(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                        fontSize: 14),
                  ),
                  const Divider(),
                  const ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    leading: Icon(Icons.my_location, color: AppColors.primary),
                    title: TextWidget("Location", fontSize: 14),
                    subtitle: TextWidget("Canada", fontSize: 14),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
