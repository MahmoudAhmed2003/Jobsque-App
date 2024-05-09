import 'package:dio/dio.dart';
import 'package:final_project_ii/API_helper/endPoints.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';

import '../model/appliedJobModel.dart';

class AppliedJobApi{
  AppliedJobModel model = AppliedJobModel();
  final dio = Dio();
  Future<AppliedJobModel> getAppliedJob() async {
    try {
      String token = await GetStorage().read('token');
      int userID=await GetStorage().read('userID');
      debugPrint('userID: $userID');
      debugPrint('token: $token');

      final response = await dio.get('${EndPoint.appliedJob}/$userID', options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',},),);
      if(response.statusCode==200){
        debugPrint(response.data.toString());
        debugPrint('applied job API success');
      }
      else{
        debugPrint('error');
      }
      model = AppliedJobModel.fromJson(response.data);
      debugPrint(response.data.toString());

    }  on Exception catch  (e) {
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
    return model;
  }
}