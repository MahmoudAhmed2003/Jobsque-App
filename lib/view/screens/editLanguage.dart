import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../controller/editPortofolioController.dart';
import '../../generated/assets.dart';

class EditLanguage extends StatelessWidget {
  final w = Get.width;

  EditPortofolioConrtoller controller = Get.put<EditPortofolioConrtoller>(EditPortofolioConrtoller());

  @override
  Widget build(BuildContext context) {


    return Scaffold(

      appBar: AppBar(
        title: Text(
          'Language',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        leading: IconButton(onPressed: (){
          Get.back();
        },icon: Icon(Icons.arrow_back),),
      ),
      body: SafeArea(
       child: GetBuilder<EditPortofolioConrtoller>(
         builder: (context) {
           return ListView.builder(
             itemCount: controller.langList.length,
             itemBuilder: (context,index)=>Padding(
               padding: const EdgeInsets.all(8.0),
               child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(controller.langList[index]['image']!,width: 60,height: 60,),
                          SizedBox(width: 10,),
                          Text(controller.langList[index]['title']!),
                        ],
                      ),
                      Radio(
                        value: controller.langList[index]['title'],
                        groupValue:
                        controller.selectedLang,
                        onChanged: (value) {
                          controller.setLang(value);
                        },
                      ),


                    ],
                  ),
                  SizedBox(height: 10,),
                  Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                 SizedBox(height: 10,),


               ],),
             )
           );
         }
       ),
      ),
    );
  }
}
