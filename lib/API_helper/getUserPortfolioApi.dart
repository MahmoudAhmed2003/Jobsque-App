import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';

import '../model/getUserPortfolioModel.dart';
import 'endPoints.dart';

class GetUserPortfolio {
  GetPortofoliosModel  up = GetPortofoliosModel();
  final dio=Dio();
  Future<GetPortofoliosModel> getPortfolio() async {
    try {
      String token = await GetStorage().read('token');
      debugPrint('token: $token');

      final response = await dio.get(EndPoint.getUserPort, options: Options(
        headers: {
          'Authorization': 'Bearer $token ',
          'Content-Type': 'application/json',},),);
      if(response.statusCode==200){
        debugPrint(response.data.toString());
        debugPrint('profile API success');
      }
      else{
        debugPrint('error');
      }
      up = GetPortofoliosModel.fromJson(response.data);
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
    return up;
  }


}