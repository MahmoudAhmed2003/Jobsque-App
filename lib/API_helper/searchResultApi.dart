
import 'package:dio/dio.dart';
import 'package:final_project_ii/API_helper/endPoints.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';

import '../model/allJobsModel.dart';
import '../model/jobFilterModel.dart';
import '../model/searchResultModel.dart';

class SearchResultApi {
  final String token =  GetStorage().read('token');
  final dio = Dio();
  JobsList sr = JobsList();
  JobsList sr2 = JobsList();
  Future<JobsList> getSearchResult({required String searchTxt}) async{
    try{
      final response = await dio.post(EndPoint.searchJob,
        data: {'name':searchTxt},
        options: Options(
           headers: {
              'Authorization': 'Bearer $token ',
              'Content-Type': 'application/json',},),);
      if(response.statusCode==200){
        debugPrint('success');
      }
      else{
        debugPrint('error');
      }
      sr = JobsList.fromJson(response.data);
      debugPrint(sr.toJson().toString());
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
    return sr;

}
  Future<JobsList> getJobFilter({required String name, required String location}) async{
    try{
      location??='';
      name??='';
      final response = await dio.post(EndPoint.jobFilter,
        data: {'name':name, 'location':location},
        options: Options(
          headers: {
            'Authorization': 'Bearer $token ',
            'Content-Type': 'application/json',},),);
      if(response.statusCode==200){
        debugPrint('success');
      }
      else{
        debugPrint('error');
      }
      sr2 = JobsList.fromJson(response.data);
      debugPrint(sr2.toJson().toString());
    }
    on Exception catch(e){
      if (e is DioException) {
        debugPrint('Dio error:');
        debugPrint('  Type: ${e.type}');
        debugPrint('  Message: ${e.message}');
      }
      else {
        debugPrint('Unexpected error: $e');
      }
    }
    return sr2;

  }





}