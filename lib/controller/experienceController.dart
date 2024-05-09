import 'package:get/get.dart';

class ExperienceController extends GetxController{
  bool checkbox =false;
  void changeCheck(value){
    checkbox = value;
    update();
  }
}