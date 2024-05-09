import 'package:dio/dio.dart';
import 'package:final_project_ii/API_helper/endPoints.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';

import '../model/delFavJobModel.dart';

class DelFavJobApi {
  DelFavJobModel model = DelFavJobModel();
  final dio = Dio();


  Future<DelFavJobModel> delFavJob({required String jobID}) async {
    DelFavJobModel model = DelFavJobModel();

    try {
      String token = await GetStorage().read('token');

      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["authorization"] = "Bearer $token";

      final response = await dio.delete(
        'https://project2.amit-learning.com/api/favorites/$jobID',
      );

      if (response.statusCode == 200) {
        debugPrint('Job deleted');

        if (response.data != null) {
          model = DelFavJobModel.fromJson(response.data);
        } else {
          debugPrint('Error: Response data is null');
        }
      } else {
        // Handle other status codes if needed
        debugPrint('Job not deleted. Status code: ${response.statusCode}');
      }
    } on DioError catch (e) {
      debugPrint('Dio error:');
      debugPrint('  Type: ${e.type}');
      debugPrint('  Message: ${e.message}');
      // Handle Dio-specific errors
    } on Exception catch (e) {
      // Handle other types of exceptions
      debugPrint('Unexpected error: $e');
    }

    return model;
  }







}