import '/API_helper/JobSearchApi.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../model/JobSearchModel.dart';
import '../view/widgets/searchScreenBase.dart';

GetSearchJob job = GetSearchJob();
class SearchScreenController extends GetxController{
  Future<void>addRecentSearch(String search) async{

   SearchScreenBase.recentJobs.contains(search)? {
     SearchScreenBase.recentJobs.remove(search),
     SearchScreenBase.recentJobs.add(search),
   }:
       SearchScreenBase.recentJobs.add(search);
   JobSearch response  = await job.getSearchJob(name: search) ;
   debugPrint(response.data!.toString());

     update();


  }
  void removeRecentSearch(int index){
    SearchScreenBase.recentJobs.removeAt(index);
    update();
  }


}
