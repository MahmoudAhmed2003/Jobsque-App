import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget buttonSheetField({required text ,required icon}){
  double width = Get.width;
  double height = Get.height;
  return Column(
    children: [
      SizedBox(height: 0.02 *height,),
      Container(
        width: 0.9* width,
        height: 0.06 *height,

        decoration: BoxDecoration(
          border: Border.all(width: 1,color: Colors.black),
          borderRadius: BorderRadius.circular(50),

        ),
        child: Padding(
          padding:  EdgeInsets.only(right: 0.04 * width,left: 0.04 * width),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(icon),
                  SizedBox(width: 0.04* width),
                  Text(text,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),)

                ],
              ),
              Icon(Icons.arrow_forward_ios_rounded)
            ],
          ),
        ),
      )
    ],
  );
}