import 'package:flutter/material.dart';
import 'package:flutterprojects/colors/Colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText ;
  final TextEditingController? textContreller;
  const CustomTextField({super.key, required this.hintText, this.textContreller});
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textContreller,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        // labelText: StaticText.labelUserName,
          hintText: hintText,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none),
          fillColor: ShoesColors.textBg,
          filled: true,
          floatingLabelStyle: const TextStyle(
            fontSize: 25,
          )
        // prefixIcon: const Icon(Icons.person)
      ),
    );
  }
}
