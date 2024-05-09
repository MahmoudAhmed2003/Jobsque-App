import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '/model/createAccountModel.dart';

class CreateAccount2Controller extends GetxController {

  void toggleColor( int index) {
    CreateAccountMoudel.isInersetsCliced[index] =! CreateAccountMoudel.isInersetsCliced[index];
    update();
  }

}