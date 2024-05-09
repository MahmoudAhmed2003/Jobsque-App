import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../API_helper/LoginApi.dart';
import '../model/loginProfieModel.dart';
class LoginController extends GetxController {
  GetStorage storge = GetStorage();
  bool isChecked = false;

  bool isPasswordVisible = false;
  Color  borderColor = Colors.grey;
  Color  btnColor = Colors.grey;
  String myController = '';
  bool isPasswordValid = false;
  TextEditingController control = TextEditingController();
  void toggleVisibility() {
    isPasswordVisible = !isPasswordVisible;
    update();
  }
  void changeBtnColor(){
    control.text.length>=8?{
    btnColor = const Color(0xff3366FF),
    isPasswordValid = true,
    }:
    btnColor = Colors.grey;
    update();
  }

  void changeColor(){
    control.text.length>=8?
    borderColor = const Color(0xff3366FF):
    control.text.isEmpty?
    borderColor = Colors.grey:
    borderColor = Colors.red;
    update();
  }


  LoginApi api = LoginApi();
  LoginProfileModel profile = LoginProfileModel();

  Future<LoginProfileModel> loginApi(
      { required String email,
        required String password}) async {

    profile= (await api.getProfileModel(email: email , password: password))!;
    GetStorage().write('token', profile.token.toString());
    GetStorage().write('userID',profile.user!.id.toString() );
    debugPrint("token saved ${GetStorage().read('token')}");
    debugPrint("userId saved ${GetStorage().read('userID')}");


    update();
    return profile;


  }

}
