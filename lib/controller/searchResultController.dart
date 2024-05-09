import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../API_helper/searchResultApi.dart';
import '../model/allJobsModel.dart';
import '../model/jobFilterModel.dart';
import '../model/searchResultModel.dart';

class SearchResultController extends GetxController {
  List <String>jobTypeFilterList = [
    'Full Time',
    'Remote',
    'Contract',
    'Part Time',
    'Onsite',
    'Internship',
  ];
  List<bool> jobTypeFilter = List.filled(6, false);
  SearchResultApi api = SearchResultApi();
  JobsList sr = JobsList();

  bool isLoading = false;
  int jobIndex=0;

  Future<JobsList> getSearchResult(String searchTxt) async {
    isLoading = true;
    update();
       sr= await api.getSearchResult(searchTxt: searchTxt);
        debugPrint('api data received in controller ');
        isLoading = false;
        update();
        return sr;
  }
  Future<JobsList> getJobFilter({required String name, required String location}) async{
    isLoading = true;
    update();
    sr = await api.getJobFilter(name: name, location: location);
    isLoading = false;
    update();
    return sr;
  }




}
