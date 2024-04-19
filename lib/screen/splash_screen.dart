import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutterprojects/controller/AuthController.dart';
import 'package:flutterprojects/routes/Routes.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 4), () {
        checkLoginStatus();
    });
  }
  void checkLoginStatus() async {
    final AuthController authService = AuthController();
    bool isLoggedIn = await authService.isLoggedIn();
    await Future.delayed(const Duration(milliseconds: 2000)); // Optional delay
    if (isLoggedIn) {
      Get.offNamed(Routes.dashboard); // Navigate to Home if logged in
    } else {
      Get.offNamed(Routes.onBoardPageView); // Navigate to FirstStartedPage if not logged in
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/splash_bg.jpg",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          const SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: Text(
                "OXY BOOTS",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "airbnb",
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
