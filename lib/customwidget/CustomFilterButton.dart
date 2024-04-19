import 'package:flutter/material.dart';
import 'package:flutterprojects/colors/Colors.dart';

class CustomFilterButton extends StatelessWidget {
  final String btnText;
  final TextStyle textStyle;
  final EdgeInsets padding;
  final Color bgColor;
  const CustomFilterButton({super.key, required this.btnText,required this.callback,
    required this.textStyle,required this.padding, required this.bgColor});
  final VoidCallback callback;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback,
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        padding: padding,
        backgroundColor: bgColor,
      ),
      child: Text(
        style: textStyle ,
        btnText,
      ),
    );
  }
}
