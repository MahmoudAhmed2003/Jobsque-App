import 'package:dio/dio.dart';
import '/API_helper/endPoints.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../controller/createAccountController.dart';
import '../model/createAcc_profile_model.dart';

class RegisterApi{
  final dio= Dio();
  Future<CreateAccProfileModel?>getProfileModel(
      {required String name, required String email, required String password})
  async{
    try{
      SentData data= SentData(
          name: name,
          email: email,
          password: password
      );
      final response=await dio.post(EndPoint.register, data: data.toJson());
      if(response.statusCode==200){
        debugPrint('success');
      }
      else{
        debugPrint('error');
      }

      CreateAccProfileModel profileModel= CreateAccProfileModel.fromJson(response.data);
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