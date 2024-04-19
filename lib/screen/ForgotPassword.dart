import 'package:flutter/material.dart';
import 'package:flutterprojects/customwidget/CustomTextField.dart';
import 'package:flutterprojects/customwidget/CustomeButton.dart';
import 'package:flutterprojects/customwidget/LabelWidget.dart';
import 'package:flutterprojects/routes/Routes.dart';
import 'package:flutterprojects/statictext/StaticText.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.toNamed(Routes.login);
            },
            icon: const Icon(Icons.chevron_left, size: 30),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.all(34),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // const SizedBox(height: 20),
              // _iconInTop(context),
              const SizedBox(height: 30),
              _header(context),
              const SizedBox(height: 60),
              _inputField(context)
            ],
          ),
        ));
  }

  _iconInTop(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InkWell(
            onTap: () {
              Get.toNamed('/Login');
            },
            child: const Image(
              image: AssetImage("assets/images/loginpage/backbutton.png"),
              height: 30,
              width: 30,
            ))
      ],
    );
  }

  _header(context) {
    return const Column(
      children: [
        Text(
          StaticText.forgotHeaderTopName,
          style: TextStyle(
            fontSize: 28,
            fontFamily: 'AirbnbCereal',
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center, // Center the text horizontally
        ),
        SizedBox(height: 8),
        Text(
          StaticText.forgotHeaderTitleName,
          style: TextStyle(
            fontFamily: 'AirbnbCereal',
          ),
          textAlign: TextAlign.center, // Center the text horizontally
        ),
      ],
    );
  }

  _inputField(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const LabelWidget(labelName: StaticText.labelUserName),
        const SizedBox(height: 6),
        const CustomTextField(hintText: StaticText.labelUserName,),
        const SizedBox(height: 10),
        CustomButton(
          btnText: StaticText.forgotButtonName,
          callback: () => print("onclick"),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
