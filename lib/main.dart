import 'package:flutter/material.dart';
import 'package:flutterprojects/controller/CartController.dart';
import 'package:flutterprojects/controller/OnBoardController.dart';
import 'package:flutterprojects/controller/ProductController.dart';
import 'package:flutterprojects/routes/Routes.dart';
import 'package:get/get.dart';


void main(){
  runApp(const MyApp());
  Get.lazyPut(() => CartController());
  Get.lazyPut(() => ProductController());
  Get.lazyPut(() => OnBoardController());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp (
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splashScreen,
      getPages: getPages,
    );
  }
}
