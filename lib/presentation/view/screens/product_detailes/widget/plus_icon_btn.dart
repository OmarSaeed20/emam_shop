import"/index.dart";

GestureDetector plusAndMinsBtn({
  required VoidCallback onTap,
  bool isPlus = true,
}) =>
    GestureDetector(
      onTap: onTap,
      child: Container(
        height: 24.height,
        width: 24.weight,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.weight,
            color: AppColors.primaryMid,
          ),
          borderRadius: BorderRadius.circular(6.height),
          shape: BoxShape.rectangle,
        ),
        alignment: Alignment.center,
        child: TextWidget(
          isPlus == true ? "+" : "-",
          textAlign: TextAlign.center,
          fontSize: 18.weight,
          color: AppColors.primary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );