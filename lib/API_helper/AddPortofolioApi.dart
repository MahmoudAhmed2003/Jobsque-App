import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';

import '../model/addPortofolioModel.dart';
import 'endPoints.dart';

class AddPortofolio{
  final dio = Dio();
  AddPortfolioModel ap = AddPortfolioModel();
  Future<AddPortfolioModel> addPortfolioApi(
      {required File file,
       required File image}) async {
    try {
      String token = await GetStorage().read('token');

      FormData formData = FormData.fromMap({
     'cv_file': await MultipartFile.fromFile(
            file!.path, filename: 'cv_file' ),

  'image': await MultipartFile.fromFile(
            image!.path, filename: 'image' ),
      });
      final response = await dio.post(
        EndPoint.addPort,
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'multipart/form-data',
          },
        ),
      );
      if (response.statusCode == 200) {
        debugPrint('API success');
          ap = AddPortfolioModel.fromJson(response.data);
        debugPrint(ap.toJson().toString());
      } else {
        debugPrint('error');
      }
    } on DioError catch (e) {
      debugPrint('Dio error:');
      debugPrint('  Type: ${e.type}');
      debugPrint('  Message: ${e.message}');
      rethrow;
    } catch (e) {
      debugPrint('Unexpected error: $e');
      rethrow;
    }

    return ap;
  }

}