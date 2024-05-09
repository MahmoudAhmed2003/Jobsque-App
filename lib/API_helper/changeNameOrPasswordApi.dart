import 'package:dio/dio.dart';
import 'package:final_project_ii/API_helper/endPoints.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';

import '../model/changeNameOrPasswordModel.dart';

class ChangeNameOrPAsswordApi{
  ChangeNameOrPasswordModel changeNameOrPasswordModel = ChangeNameOrPasswordModel();
  Future <ChangeNameOrPasswordModel>changeNameOrPassword (password)async{
    final dio =Dio();
    try{
      String token = await GetStorage().read('token');
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["authorization"] = "Bearer $token";
      final response  = await dio.post(EndPoint.changePass,data: {
        'password':password.toString(),
      });
      if(response.statusCode == 200){
        changeNameOrPasswordModel  = ChangeNameOrPasswordModel.fromJson(response.data);
        debugPrint(response.statusCode.toString());
      }
    }catch (e){
      debugPrint(e.toString());
    }
    return changeNameOrPasswordModel;

  }
}