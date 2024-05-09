import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/searchResultController.dart';

Widget FilterChipSearchWidget({required String text,required bool stat}) {
  return FilterChip(
    label: Text(
      text,
      style: TextStyle(
        fontSize: 14,
        color: stat?Colors.white:Colors.grey[800],

      ),
    ),
    onSelected: (bool value) {},
    shape: RoundedRectangleBorder(
      side: BorderSide(color:
      stat?Color(0xb3091a7a):
      Colors.grey[500]!,
          width: 1),
      borderRadius: BorderRadius.circular(20),
    ),
    backgroundColor:stat?Color(0xb3091a7a):
    Colors.transparent,
  );
}

Widget FilterChipsJobFilter( {required String text, required int index}) {
 dynamic tempController= Get.find<SearchResultController>();
  return FilterChip(

    label: Text(
      text,
      style: TextStyle(
        fontSize: 14,
        color: tempController.jobTypeFilter[index]?Colors.white:Colors.grey[800],
      ),
    ),

    onSelected: (bool value) {
      tempController.jobTypeFilter[index] = !tempController.jobTypeFilter[index];
      if(index<3)
        tempController.jobTypeFilter[index+3]=false;
      else
        tempController.jobTypeFilter[index-3]=false;
      tempController.update();
      debugPrint(index.toString());

    },
    shape: RoundedRectangleBorder(
      side: BorderSide(color:
      tempController.jobTypeFilter[index]?Color(0x6E0034D9):
      Colors.grey[500]!,
          width: 1),
      borderRadius: BorderRadius.circular(20),
    ),
    backgroundColor:tempController.jobTypeFilter[index]?Color(0x6E0034D9):
    Colors.transparent,
  );
}