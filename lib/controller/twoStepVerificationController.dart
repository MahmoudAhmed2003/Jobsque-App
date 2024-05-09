import 'package:get/get.dart';

class TwoStepVerificationController extends GetxController{
  int index = 0 ;
  void addIndex (){
    index++;
    update();
  }
  void subIndex (){
    index--;
    update();
  }

}