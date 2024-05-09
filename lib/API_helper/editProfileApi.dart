import 'package:dio/dio.dart';
import 'package:final_project_ii/API_helper/endPoints.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';

import '../model/editProfileModel.dart';

class EditProfileApi {
  final dio = Dio();
  EditPortofolioModel epm = EditPortofolioModel();
  Future<EditPortofolioModel> editProfileSendData( String bio, String address, String mobile,String lang ,String edu , String exp) async {
   String token = await GetStorage().read('token');
   try{
     Map<String,String>params = {
       'bio': bio.toString(),
       'address': address.toString(),
       'mobile': mobile.toString(),
       'language':lang.toString(),
       'education':edu.toString(),
        'experience':exp.toString(),
     };
     final response = await dio.put(EndPoint.editProfile,
       queryParameters: params
       ,options: Options(
     headers: {
     'Authorization': 'Bearer $token ',
     'Content-Type': 'application/json',},),
      );
     debugPrint('status code: ${response.statusCode}');
     if (response.statusCode == 200) {
       debugPrint('success');
     } else {
       debugPrint('error');
     }
      epm = EditPortofolioModel.fromJson(response.data);
      debugPrint(epm.toJson().toString());
    }
   on Exception catch (e) {
     if (e is DioError) {
       debugPrint('Dio error:');
       debugPrint('  Type: ${e.type}');
       debugPrint('  Message: ${e.message}');
     } else {
       debugPrint('Error: $e');
     }
   }
   return epm;
   }
}