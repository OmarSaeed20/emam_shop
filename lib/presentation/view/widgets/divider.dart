import '../../../index.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key, this.height, this.color});
  final double? height;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 8.height,
      width: double.infinity,
      color: color ?? AppColors.grey200,
    );
  }
}
