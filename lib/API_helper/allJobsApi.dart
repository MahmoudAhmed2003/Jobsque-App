import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';

import '../model/allJobsModel.dart';
import 'endPoints.dart';

class GetAllJobsApi {
  final dio = Dio();
  JobsList jl = JobsList();



  Future<JobsList> getAllJobs() async {
    try {
      String token = await GetStorage().read('token');

      debugPrint('token: $token');
      final response = await dio.get(EndPoint.allJobs, options: Options(
        headers: {
          'Authorization': 'Bearer $token ',
          'Content-Type': 'application/json',},),);
      if(response.statusCode==200){
        debugPrint(response.data.toString());
        debugPrint('jobs api success');
        // debugPrint(token);
      }
      else{
        debugPrint('error');
      }

      jl = JobsList.fromJson(response.data);

    }

    catch (e) {
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
    return jl;
  }
}