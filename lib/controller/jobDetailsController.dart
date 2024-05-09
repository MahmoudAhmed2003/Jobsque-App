import 'package:final_project_ii/controller/searchResultController.dart';
import 'package:get/get.dart';

import '../generated/assets.dart';
import '../model/searchResultModel.dart';

class JobDetailsController extends GetxController{

  List<String> items = [
    'UI/UX Designer',
    'Flutter Developer',
    'Web Developer',
    'Instructor',
  ];
  List<Map<String, String>> employees = [
    {
      'name': 'John Doe',
      'position': 'UI/UX Designer',
      'image': Assets.randomPicsProfile,
      'duration': '5'
    },
    {
      'name': 'John Doe',
      'position': 'UI/UX Designer',
      'image': Assets.randomPicsProfile,
      'duration': '5'
    },
    {
      'name': 'John Doe',
      'position': 'UI/UX Designer',
      'image': Assets.randomPicsProfile,
      'duration': '5'
    },
    {
      'name': 'John Doe',
      'position': 'UI/UX Designer',
      'image': Assets.randomPicsProfile,
      'duration': '5'
    },
    {
      'name': 'John Doe',
      'position': 'UI/UX Designer',
      'image': Assets.randomPicsProfile,
      'duration': '5'
    },
    {
      'name': 'John Doe',
      'position': 'UI/UX Designer',
      'image': Assets.randomPicsProfile,
      'duration': '5'
    },
  ];

  SearchResultController searchresult =
  Get.put<SearchResultController>(SearchResultController());

  int pageIndex =0;

  String menuText = 'Select Item';

  void changeIndex(int index){
    pageIndex = index;
    update();
  }
  void changeMenuText(String text){
    menuText = text;
    update();
  }
  // SearchData jobSelected = SearchData();


}

