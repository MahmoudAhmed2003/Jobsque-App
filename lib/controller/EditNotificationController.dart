import 'package:get/get.dart';

class EditNotificationController extends GetxController{
   List <bool>isSwitched=List.filled(8, false);

  void changeIsSwitched ({required bool value,required int item}){
    isSwitched[item] = value ;

    update();
  }


}
