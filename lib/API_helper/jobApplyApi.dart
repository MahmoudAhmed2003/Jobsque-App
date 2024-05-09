import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';

import '../model/jobApplyModel.dart';
import 'endPoints.dart';

class JopApplyApi{
  final dio = Dio();
  JopApplyModel ja = JopApplyModel();
  Future<JopApplyModel> jopApply({
    required int? jobs_id,
    required File? cv_file,
    required String? name,
    required String? email,
    required String? mobile,
    required String? work_type,
    required File? other_file,
    required int? user_id,
  }) async {
    try {
      String token = await GetStorage().read('token');
      debugPrint('token: $token');

      FormData formData = FormData.fromMap({
        "jobs_id": jobs_id,
        "cv_file": await MultipartFile.fromFile(cv_file!.path, filename: "cv_file"),
        "name": name,
        "email": email,
        "mobile": mobile,
        "work_type": work_type,
        "other_file": other_file != null ? await MultipartFile.fromFile(other_file.path, filename: "other_file") : null,
        "user_id": user_id,
      });

      final response = await dio.post(
        EndPoint.jopApply,
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      if (response.statusCode == 200) {
        debugPrint('job apply api success');
        // debugPrint(token);
      } else {
        debugPrint('error');
      }

       ja= JopApplyModel.fromJson(response.data);
      debugPrint(ja.toJson().toString());
    }  on Exception catch (e)  {
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
    return ja;
  }
}