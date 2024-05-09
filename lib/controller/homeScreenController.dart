import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../API_helper/allJobsApi.dart';
import '../API_helper/otherAPI.dart';
import '../model/allJobsModel.dart';
import '../model/userData.dart';

class HomeScreenController extends GetxController {
  UserData ud= UserData();
  UserDataApi udApi= UserDataApi();
  bool isLoading = true;
  JobsList jl = JobsList();
  int currentPage = 0;
  final token = GetStorage().read('token');

  GetAllJobsApi allJobsApi = GetAllJobsApi();

  void pageChanged(int index) {
    currentPage = index;
    update();
  }



  @override
  Future<void> onInitFunc() async{
    isLoading=true;
    debugPrint(isLoading.toString());
    debugPrint( 'token  $token');

    ud= await udApi.getUserData();
     GetStorage().write('name', ud.data!.name);
     GetStorage().write('userID', ud.data!.id);
    jl = await allJobsApi.getAllJobs();

    isLoading = false;
    debugPrint(isLoading.toString());
    update();

  }




}
