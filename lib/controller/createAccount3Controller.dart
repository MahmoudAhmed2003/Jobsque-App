import '/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import"/model/createAccountModel.dart";

class CreateAccount3Controller extends GetxController
{
  void toggleColor( int index) {
    CreateAccountMoudel.isFlagCliced[index] =! CreateAccountMoudel.isFlagCliced[index];
    update();
  }
}

