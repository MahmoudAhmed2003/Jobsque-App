
import 'package:dio/dio.dart';
import '/API_helper/endPoints.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';

import '../model/JobSearchModel.dart';

class GetSearchJob{
  final dio = Dio();
  final token =GetStorage().read('token');
  JobSearch js = JobSearch();
  Future<JobSearch> getSearchJob(
      {required String name} )
  async{
    try{
      SendName data = SendName(
          name: name,
      );
      final response = await dio.post(EndPoint.searchJob,data: data.toJson(),options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',},));
      if(response.statusCode==200){
        debugPrint('success');
      }
      else{
        debugPrint('error');
      }
      js = JobSearch.fromJson(response.data);
      debugPrint(js.toJson().toString());
      return js;

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
      return js;
    }


  }
}