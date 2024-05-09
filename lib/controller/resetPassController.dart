import 'package:flutter/material.dart';
import 'package:get/get.dart';


class resetPassController extends GetxController {

  bool isPasswordVisible = false;
  bool isPasswordVisible2 = false;
  Color borderColor = Colors.grey;
  Color btnColor = Colors.grey;
  String myController = '';
  bool isPasswordValid = false;
  TextEditingController control = TextEditingController();

  void toggleVisibility() {
    isPasswordVisible = !isPasswordVisible;
    update();
  }

  void toggleVisibility2() {
    isPasswordVisible2 = !isPasswordVisible2;
    update();
  }



  void changeColor() {
    control.text.length > 8 ?
    borderColor = const Color(0xff3366FF) :
    control.text.isEmpty ?
    borderColor = Colors.grey :
    borderColor = Colors.red;
    update();
  }

}