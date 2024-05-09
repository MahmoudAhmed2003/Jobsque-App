import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';

import '../model/userData.dart';
import 'package:dio/dio.dart';

import 'endPoints.dart';

UserData ss = UserData() ;

class UserDataApi{
  final dio= Dio();

  Future<UserData> getUserData() async {
    try{
      final token = await GetStorage().read('token') ;
      final response=await dio.get(EndPoint.profile, options:Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json', // Adjust content type as needed
        },
      )
      );
      ss= UserData.fromJson(response.data);
      if(response.statusCode==200){
        debugPrint('success');
      }
      else{
        debugPrint('error');
      }
    }
    catch(e){
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
    return ss;



  }
}

