
import '/index.dart';

class BottomNavigatiBar extends StatelessWidget {
  const BottomNavigatiBar({super.key, required this.controller});

  final MainControllerImp controller;

  @override
  Widget build(BuildContext context) {
    var curr = controller.getCurrentIndex;
    return Container(
      padding: paddingSymme(horizontal: 5, vertical: 10),
      margin: paddingSymme(horizontal: 28, vertical: 18),
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.circular(6.height),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ...List.generate(
            controller.icon.length,
            (index) => customMateIcon(
              onTap: () => controller.getCurrentScreen(index),
              icon: curr == index
                  ? controller.activeIcon[index]
                  : controller.icon[index],
              isSelect: curr == index ? true : false,
            ),
          )
        ],
      ),
    );
  }
}