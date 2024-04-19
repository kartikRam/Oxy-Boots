import 'package:flutter/material.dart';
import 'package:flutterprojects/colors/Colors.dart';
import 'package:flutterprojects/customwidget/CustomTextField.dart';
import 'package:flutterprojects/customwidget/LabelWidget.dart';
import 'package:flutterprojects/routes/Routes.dart';
import 'package:flutterprojects/statictext/StaticText.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left,size: 30,),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text('Profile'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Image(image: AssetImage("assets/images/profile/editicon.png"),width: 20,height: 20,),
            onPressed: () {
              Get.toNamed(Routes.accountSetting);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Circle Avatar with Image and Icon
                Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: ShoesColors.profileBgColor,
                  ),
                  child: const Stack(
                    children: [
                      Image( image:AssetImage('assets/images/profile/profileimage.png')),
                      Positioned(
                        top: 75,
                        right: 23,
                        child:Image(image: AssetImage("assets/images/profile/cameraimg.png"),width: 80,height: 80,),
                      ),
                    ],
                  ),
                ),
                const Text(StaticText.userName,style: TextStyle(fontSize: 20,
                    fontWeight: FontWeight.w500),),
                const SizedBox(height: 20),
        
                _inputField(context),
        
              ],
            ),
          ),
        ),
      ), // Your profile content goes here
    );
  }

  _inputField(context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        LabelWidget(labelName: StaticText.fullName),
        SizedBox(height: 6),
        CustomTextField(hintText: StaticText.userName),
        SizedBox(height: 10),
        LabelWidget(labelName: StaticText.labelUserName),
        SizedBox(height: 6),
        CustomTextField(hintText: StaticText.userEmail),
        SizedBox(height: 10),
        LabelWidget(labelName: StaticText.labelPassword),
        SizedBox(height: 6),
        CustomTextField(hintText: StaticText.userPassword),
        SizedBox(height: 30),

      ],
    );
  }
}

