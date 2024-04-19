import 'package:flutter/material.dart';

class LabelWidget extends StatelessWidget {
  final String labelName;
  const LabelWidget({super.key, required this.labelName});

  @override
  Widget build(BuildContext context) {
    return Text(
      labelName,
      style:const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
