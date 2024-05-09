import 'package:get/get.dart';

import '../API_helper/changeNameOrPasswordApi.dart';
import '../model/changeNameOrPasswordModel.dart';



class PhoneAndPasswordController extends GetxController{
  bool isSwitched = false;
  bool obscureText1 = true;
  bool obscureText2 = true;
  bool obscureText3 = true;

  void changeObscureText1 (){
    obscureText1 = !obscureText1;
    update();
  }
  void changeObscureText2 (){
    obscureText2 = !obscureText2;
    update();
  }
  void changeObscureText3 (){
    obscureText3 = !obscureText3;
    update();
  }

  void changeIsSwitched (value){
    isSwitched = value ;

    update();
  }


  ChangeNameOrPasswordModel changePasswordData = ChangeNameOrPasswordModel();
  ChangeNameOrPAsswordApi apiFun = ChangeNameOrPAsswordApi();
  Future <void> changePaswword(dynamic password)async{
    changePasswordData = (await apiFun.changeNameOrPassword(password));
  }
}