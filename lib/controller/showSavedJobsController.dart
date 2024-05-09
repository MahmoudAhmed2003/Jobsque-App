import 'package:final_project_ii/controller/dataCrossPages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../API_helper/DelFavJobApi.dart';
import '../API_helper/saveJobApi.dart';
import '../API_helper/showSavedJobsApi.dart';
import '../model/saveJobModel.dart';
import '../model/showSavedJobsModel.dart';

class ShowSavedJobsController extends GetxController {
  bool isLoading = false ;
  ShowSavedJobs showSavedJobs = ShowSavedJobs();
  ShowSavedJobsApi api = ShowSavedJobsApi();
  DataCrossPages dcp = Get.put(DataCrossPages());
  SaveJobModel sj = SaveJobModel();
  SaveJobApi sjApi = SaveJobApi();
  DelFavJobApi delFavJobApi = DelFavJobApi();


Future<void> getSavedJob() async{
  isLoading = true ;
  // update();
  showSavedJobs = await api.showSavedApi();

  isLoading = false ;
  update();

}

  Future<void> saveJob({required String JobId, required String location}) async{
   await  sjApi.SaveJob(jobID: JobId ,location:' ');
    // dcp.addSavedJob(JobId);
    debugPrint('job saved and sent to api');
   await getSavedJob();
   update();
  }

  Future<void> delFavJob({required String id , required String jobId}) async{
    await delFavJobApi.delFavJob(jobID: id);
    // dcp.removeSavedJob(jobId);
    debugPrint('job deleted from saved job');
    await getSavedJob();
    update();
  }


}