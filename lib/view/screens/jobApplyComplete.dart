import 'package:final_project_ii/root/routs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

import '../../controller/jobApplyCompleteController.dart';
import '../../controller/jobApplyController.dart';
import '../../controller/searchResultController.dart';
import '../../generated/assets.dart';

class JobApplyComplete extends StatelessWidget {

JobApplyCompleteController controller = Get.put(JobApplyCompleteController());
JobApplyController jobApplyController = Get.find();

  @override
  Widget build(BuildContext context) {
    final h = Get.height;
    final w = Get.width;
    return Scaffold(
        floatingActionButton: Container(
          width: w * 0.8,
          height: 50,
          child: FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            child: Text(
              'Back to home',
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
            backgroundColor: Color(0xff3366FF),
            onPressed: () {
              controller.isApplyed = true;
              Get.offAllNamed(myRoutes.homeScreen);

            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          'Apply Job',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body:SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Image.asset(Assets.randomPicsJobApplyCompletePic, height: 200,),
                SizedBox(height: 20,),
                Text('Your data has been', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,),
                Text(' successfully sent', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,),
                SizedBox(height: 20,),
                Text('You will get a message from our team, about the announcement of employee acceptance', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,),

              ],
            ),
          ),
        ),
      )
    );
  }
}
