import 'package:flutter/material.dart';
import 'package:flutterprojects/colors/Colors.dart';
import 'package:flutterprojects/customwidget/CustomeButton.dart';

class CustomPageIndicator extends StatefulWidget {
  final int index;
  final String btnText;
  final VoidCallback callback;
  const CustomPageIndicator({super.key,required this.index,required this.btnText,required this.callback});
  @override
  State<CustomPageIndicator> createState() => _CustomPageIndicatorState();
}

class _CustomPageIndicatorState extends State<CustomPageIndicator> {
  getDivider(){
    return const Divider(
        thickness: 5,
        height: 10,
        indent : 10,
        endIndent : 5,
        color: ShoesColors.loginButtonColor
    );
  }
  getEmptyDots(){
    return Padding(
      padding: const EdgeInsets.only(left:5.0,right: 5.0),
      child: ClipRRect(borderRadius: BorderRadius.circular(50),
          child: Container(width:10, height: 10, color: Colors.grey,)),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:20,right: 20),
      child: Row(
          children:[
            widget.index == 0?SizedBox(width:60, child: getDivider(),): getEmptyDots(),
            widget.index == 1?SizedBox(width:60, child: getDivider(),): getEmptyDots(),
            widget.index == 2?SizedBox(width:60, child: getDivider(),): getEmptyDots(),
            const Expanded(child: SizedBox()),
            SizedBox(width: 150,child:CustomButton(btnText: widget.btnText,
                callback: widget.callback)),
          ]
      ),
    );
  }
}
