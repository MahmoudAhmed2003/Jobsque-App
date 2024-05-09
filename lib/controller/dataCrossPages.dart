import 'package:final_project_ii/controller/homeScreenController.dart';
import 'package:get/get.dart';

import '../model/allJobsModel.dart';
HomeScreenController hsc = Get.find();

class DataCrossPages extends GetxController{
  HomeScreenController hsc = Get.put<HomeScreenController>(HomeScreenController());
   Data job=Data();
   // List <bool> isSaved = List.filled(3, true);
    List<String>isSaved= [] ;

   void addSavedJob(String id) {
      isSaved.add(id);
   }
   void removeSavedJob(String id) {
     isSaved.remove(id);
   }




}