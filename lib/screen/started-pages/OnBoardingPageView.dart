import 'package:flutter/material.dart';
import 'package:flutterprojects/colors/Colors.dart';
import 'package:flutterprojects/controller/OnBoardController.dart';
import 'package:flutterprojects/customwidget/CustomPageIndicator.dart';
import 'package:flutterprojects/routes/Routes.dart';
import 'package:flutterprojects/statictext/StaticText.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class OnBoardingPageView extends StatefulWidget {
  const OnBoardingPageView({super.key});
  @override
  State<OnBoardingPageView> createState() => _OnBoardingPageViewState();
}

class _OnBoardingPageViewState extends State<OnBoardingPageView> {
  late PageController _pageViewController;
  OnBoardController onBoardControllerObj = Get.find<OnBoardController>();

  @override
  void initState() {
    super.initState();
    print(onBoardControllerObj.index.value);
    _pageViewController = PageController();
    _pageViewController.addListener(_handlePageChange);
  }
  @override
  void dispose() {
    _pageViewController.removeListener(_handlePageChange);
    _pageViewController.dispose();
    super.dispose();
  }

  void _handlePageChange() {
    setState(() {
      onBoardControllerObj.index.value = _pageViewController.page!.round();
      onBoardControllerObj.btnText.value = "Next";
      if(onBoardControllerObj.index.value==0){
        onBoardControllerObj.btnText.value = "Get Started";
      }
    });
  }
  getFirstOnboardScreen(){
    // onBoardControllerObj.index.value=1;
    // onBoardControllerObj.btnText.value="Get Started";
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
        Image(image: AssetImage("assets/images/startpages/shoe1.png"),),
        SizedBox(height: 20),
        Text(StaticText.onBoardingHeading1,style:
        TextStyle(fontSize: 40,fontFamily: 'AirbnbCereal',
            fontWeight: FontWeight.bold),),
        SizedBox(height: 10),
        Text(StaticText.onBoardingPara1,style:
        TextStyle(fontSize: 20,fontFamily: 'AirbnbCereal'),),
      ],
    );
  }
  getSecondOnboardScreen(){

    // onBoardControllerObj.index.value=2;
    // onBoardControllerObj.btnText.value="Next";
    return const Column(
      //crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
        Image(image: AssetImage("assets/images/startpages/shoe2.png"),),
        SizedBox(height: 20,),
        Text(StaticText.onBoardingHeading2,style:
        TextStyle(fontSize: 40,fontFamily: 'AirbnbCereal',fontWeight: FontWeight.bold),),
        SizedBox(height: 10,),
        Text(StaticText.onBoardingPara2,style:
        TextStyle(fontSize: 20,fontFamily: 'AirbnbCereal'),),
      ],
    );
  }
  getThirdOnboardScreen(){

    // onBoardControllerObj.index.value=3;
    // onBoardControllerObj.btnText.value="Next";
    return const Column(
      //crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
        Image(image: AssetImage("assets/images/startpages/shoe3.png"),),
        SizedBox(height: 15,),
        Text(StaticText.onBoardingHeading3,style:
        TextStyle(fontSize: 40,fontFamily: 'AirbnbCereal',fontWeight: FontWeight.bold),),
        SizedBox(height: 10,),
        Text(StaticText.onBoardingPara3,style:
        TextStyle(fontSize: 20,fontFamily: 'AirbnbCereal'),),
        //const SizedBox(height: 90,),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left:20,right: 20),
            child: SizedBox(
              height: 600,
              child: PageView(
              controller: _pageViewController,
              children: [
                getFirstOnboardScreen(),
                getSecondOnboardScreen(),
                getThirdOnboardScreen()
              ],),
            ),
          ),
         const Expanded(child: SizedBox()),
          Obx(
            ()=> Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomPageIndicator(index: onBoardControllerObj.index.value,
                  btnText: onBoardControllerObj.btnText.value,
                  callback: (){
                  if(onBoardControllerObj.index.value == 2){
                    Get.offNamed(Routes.login);
                  }else {
                    onBoardControllerObj.incrementIndex();
                    onBoardControllerObj.changeText("Next");
                    _pageViewController.animateToPage(
                        onBoardControllerObj.index.value,
                        duration: const Duration(milliseconds: 350),
                        curve: Curves.easeIn);

                  }
              }),
            ),
          ),
        ],
      )
    );
  }
}