import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../API_helper/appliedJobApi.dart';
import '../model/appliedJobModel.dart';

class AppliedJobController extends GetxController {
  AppliedJobApi api = AppliedJobApi();
  AppliedJobModel model = AppliedJobModel();
 bool isLoading = false;


  int activeJob=0;
  void changeJobStatus(int index){
    activeJob= index;
    update();
  }
  Future<void> getAppliedJob() async {
    isLoading = true;
    update();
    model = await api.getAppliedJob();
    for(int i = 0; i<model.data!.length; i++){
      debugPrint('jobId = '+model.data![i].jobsId!.toString());
    }
    isLoading = false;
    update();
  }


}