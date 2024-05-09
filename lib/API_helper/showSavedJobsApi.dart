import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';

import '../model/showSavedJobsModel.dart';
import 'endPoints.dart';

class ShowSavedJobsApi{
  final  dio = Dio();
  ShowSavedJobs showSavedJobs = ShowSavedJobs();
  Future<ShowSavedJobs> showSavedApi() async {
    try {
      String token = await GetStorage().read('token');
      final response =
      await dio.get(EndPoint.showSavedJobs,options: Options(
        headers: {
          'Authorization': 'Bearer $token ',
          'Content-Type': 'application/json',},));

      if(response.statusCode==200){
        debugPrint('Fav Api success');
      }
      else if (response.statusCode==404){
        debugPrint('error');
      }
      showSavedJobs = ShowSavedJobs.fromJson(response.data);
      debugPrint(showSavedJobs.toJson().toString());
    }  catch(e){
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
    return showSavedJobs;
  }

}