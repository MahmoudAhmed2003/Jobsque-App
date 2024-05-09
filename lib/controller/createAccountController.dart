import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../API_helper/registerApi.dart';
import '../model/createAcc_profile_model.dart';
class CreateAccountController extends GetxController {
  GetStorage storage = GetStorage();

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
  RegisterApi api = RegisterApi();
  CreateAccProfileModel profile = CreateAccProfileModel();
  bool isLoading = false;

  Future<CreateAccProfileModel> registerApi(
      {required String name,
        required String email,
        required String password}) async {

    profile = (await api.getProfileModel(name: name, email: email, password: password))!;
    storage.write('token', profile.token);
    debugPrint(GetStorage().read('token').toString());

    update();
    return profile;
    // return registerApiStatCode11;
  }


}
