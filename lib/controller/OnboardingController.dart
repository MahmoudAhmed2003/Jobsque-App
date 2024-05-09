import 'package:get/get.dart';

class OnboardingController extends GetxController {

  int currentPage = 0;

  void setCurrentPage(int page) {
    currentPage = page;
    update();
  }

 
}
