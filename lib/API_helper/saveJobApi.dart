import 'dart:io';

import 'package:dio/dio.dart';
import 'package:final_project_ii/API_helper/endPoints.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controller/dataCrossPages.dart';
import '../model/saveJobModel.dart';

DataCrossPages selectedJob = Get.put<DataCrossPages>(DataCrossPages());
SaveJobModel sj= SaveJobModel();

class SaveJobApi{

  Future<SaveJobModel> SaveJob({required String jobID , required String location})async {
   try{
     final dio=Dio();
     String token= await GetStorage().read('token');
     // final response=await dio.post(EndPoint.saveJob, data : {
     //   'job_id':4,
     //   'location':'kjkj',
     // },
     //   options: Options(
     //     headers: {
     //       'Authorization': 'Bearer $token',
     //       'Content-Type': 'multipart/form-data',
     //     },
     //   ),);
     dio.options.headers['content-Type'] = 'application/json';
     dio.options.headers["authorization"] = "Bearer $token";
     // "Bearer ${sharedPreferences.read('token')}";
     final response = await dio.post(
         EndPoint.saveJob,
         data: {'job_id':int.parse(jobID)});
     if (response.statusCode == 200) {
       debugPrint('job save success');
     } else {
       debugPrint('errooooor');
     }
     sj= SaveJobModel.fromJson(response.data);
     debugPrint(sj.toJson().toString());
   }
    on Exception catch (e)  {
    if (e is DioError) {
    debugPrint('Dio error:');
    debugPrint('  Type: ${e.type}');
    debugPrint('  Message: ${e.message}');
    } else {
    // Handle other types of errors
    debugPrint('Unexpected error: $e');
    }
    throw e;
    }
    return sj;

  }

}