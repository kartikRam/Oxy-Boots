import 'package:flutter/material.dart';
import 'package:flutterprojects/colors/Colors.dart';

class CustomButton extends StatelessWidget {
  final String btnText;
  const CustomButton({super.key, required this.btnText,required this.callback});
  final VoidCallback callback;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback,
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(vertical: 16),
        backgroundColor: ShoesColors.loginButtonColor,
      ),
      child: Text(
        style: const TextStyle(fontSize: 20,color: ShoesColors.textBg),
        "${btnText}",
      ),
    );
  }
}
