

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


Widget FilterChipWidget(String text ){

  return  FilterChip(

    label: Text(text ,
      style: TextStyle(
        fontSize: 12,
      color: Colors.white,
    ),) ,
    onSelected: (bool value) {  },
    shape: RoundedRectangleBorder(
    side: BorderSide(color: Color(0xb3091a7a), width: 1),

      borderRadius: BorderRadius.circular(20),
    ),

    backgroundColor: Color(0xb3091a7a),
  );


}

Widget FilterChipWidget2(String text ){

  return  FilterChip(

    label: Text(text ,
      style: TextStyle(
        fontSize: 12,
        color: Color(0xb3091a7a),
      ),) ,
    onSelected: (bool value) {  },
    shape: RoundedRectangleBorder(
      side: BorderSide(color: Colors.white, width: 1),

      borderRadius: BorderRadius.circular(20),
    ),
    backgroundColor: Color(0xffD6E4FF),
  );


}