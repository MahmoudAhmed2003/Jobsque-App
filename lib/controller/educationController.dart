import 'package:get/get.dart';

class EducationController extends GetxController{
  DateTime? startDate = DateTime.now() ;
  DateTime? endDate = DateTime.now() ;
  String? university ;
  String? title ;

  void setData ({required uni ,required tit}){
    university = uni ;
    title = tit ;
    update();
  }


}