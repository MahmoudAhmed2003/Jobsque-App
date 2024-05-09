import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../model/loginProfieModel.dart';

import 'endPoints.dart';

class LoginApi {
  final dio = Dio();
  Future<LoginProfileModel?>getProfileModel(
      {required String email, required String password})async{
    try{
      SentData data= SentData(
          email: email,
          password: password
      );
      final response=await dio.post(EndPoint.login, data: data.toJson());
      if(response.statusCode==200){
        debugPrint('success');
      }
      else{
        debugPrint('error');
      }

      LoginProfileModel profileModel= LoginProfileModel.fromJson(response.data);
      debugPrint(profileModel.toJson().toString());
      return profileModel;
    }
    on Exception catch(e){
      if (e is DioException) {
        debugPrint('Dio error:');
        debugPrint('  Type: ${e.type}');
        debugPrint('  Message: ${e.message}');

      }
      else {
        // Handle other types of errors
        debugPrint('Unexpected error: $e');
      }
  }
}
}