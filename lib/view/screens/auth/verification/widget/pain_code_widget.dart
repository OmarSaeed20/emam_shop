import '/index.dart';

class CustomPinCodeField extends StatelessWidget {
  const CustomPinCodeField({
    Key? key,
    this.onCompleted,
    required this.onChanged,
  }) : super(key: key);
  final void Function(String)? onCompleted;
  final void Function(String) onChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: PinCodeTextField(
        // autoFocus: true,enableActiveFill: true,
        appContext: context,
        onCompleted: onCompleted,
        onChanged: onChanged,
        cursorColor: AppColors.grey,
        keyboardType: TextInputType.number,
        length: 4,
        obscureText: !true,
        animationType: AnimationType.slide,
        textStyle: TextStyle(color: AppColors.primary, fontSize: 35.weight),
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(6.0),
          fieldHeight: getProportionateScreenHeight(85.0),
          fieldWidth: getProportionateScreenWidth(60.0),
          borderWidth: 1,
          activeColor: AppColors.secondaryColor,
          inactiveColor: AppColors.primarylight,
          inactiveFillColor: AppColors.white,
          activeFillColor: AppColors.white,
          selectedColor: AppColors.primary,
          selectedFillColor: AppColors.white,
        ),
        // animationDuration: const Duration(milliseconds: 200),
        //  backgroundColor: kTransparentColor,
      ),
    );
  }
}
