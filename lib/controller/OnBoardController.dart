import 'package:get/get.dart';

class OnBoardController extends GetxController{
  RxInt index=0.obs;
  RxString btnText="Get Started".obs;
  incrementIndex(){
    index.value++;
  }
  changeText(String value){
    btnText.value = value;
  }
}