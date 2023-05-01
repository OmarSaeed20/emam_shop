import '/index.dart';

class CustomPinCodeField extends StatelessWidget {
  const CustomPinCodeField(
      {Key? key, this.onCompleted, required this.onChanged})
      : super(key: key);
  final void Function(String)? onCompleted;
  final void Function(String) onChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: PinCodeTextField(
        appContext: context,
        // autoFocus: true,enableActiveFill: true,
        onCompleted: onCompleted,
        onChanged: onChanged,
        cursorColor: AppColors.grey,
        keyboardType: TextInputType.phone,
        length: 4,
        obscureText: !true,
        animationType: AnimationType.scale,
        textStyle:
            TextStyle(color: AppColors.secondaryColor, fontSize: 30.weight),
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(10.0),
          fieldHeight: getProportionateScreenHeight(80.0),
          fieldWidth: getProportionateScreenWidth(60.0),
          borderWidth: 0.8,
          activeColor: AppColors.primary,
          inactiveColor: AppColors.primary.withOpacity(0.4),
          inactiveFillColor: AppColors.white,
          activeFillColor: AppColors.white,
          selectedColor: AppColors.red,
          selectedFillColor: AppColors.white,
        ),
        // animationDuration: const Duration(milliseconds: 200),
        //  backgroundColor: kTransparentColor,
      ),
    );
  }
}
