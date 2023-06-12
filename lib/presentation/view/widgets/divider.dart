import '../../../index.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key, this.height});
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 8.height,
      width: double.infinity,
      color: AppColors.grey200,
    );
  }
}
