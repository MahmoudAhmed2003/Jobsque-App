import 'package:get/get.dart';

class CompleteProfileController extends GetxController {
  List complete = [false, false, false, false];
  int counter = 0;


  void changeComplete({required index}) {
    complete[index] = true;


    counter++;
    print('counter  ========== $counter');

    update();
  }
}