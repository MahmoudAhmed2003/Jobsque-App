import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../controller/EditNotificationController.dart';

class EditNotificationScreen extends StatelessWidget {
  EditNotificationController controller = Get.put(EditNotificationController());
   EditNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List jobNotification=[
      'Your Job Search Alert',
      'Job Application Update',
      'Job Application Reminders',
      'Jobs You May Be Interested In',
      'Job Seeker Updates',
    ];
    List otherNotification=[
      'Show Profile',
      'All Message',
      'Message Nudges',
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notification',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: IconButton(onPressed: (){},icon: Icon(Icons.arrow_back),),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Container(
              width: double.infinity,
              color: Colors.grey[200],
              child: const Padding(
                padding: EdgeInsets.only(left: 20,right: 10,top: 10,bottom: 10),
                child: Text(
                  "Job notification",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff6B7280),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: jobNotification.length,
                itemBuilder: (context,index)=>Column(
                  children: [
                    // ToggleButtons(children: [], isSelected:)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(jobNotification[index],style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),),
                        GetBuilder<EditNotificationController>(
                            builder: (logic) {
                              return Container(
                                child: FlutterSwitch(
                                  width: 60,
                                  height: 30,
                                  toggleSize: 15,
                                  value: logic.isSwitched[index],
                                  borderRadius: 30.0,
                                  onToggle: (val) {
                                    logic.changeIsSwitched(value:val, item: index);
                                  },
                                ),
                              );
                            }),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Divider(height: 2,thickness: 2,),
                    SizedBox(height: 20,)

                  ],
                )
              ),
            ),

            SizedBox(height: 20,),
            Container(
              width: double.infinity,
              color: Colors.grey[200],
              child: const Padding(
                padding: EdgeInsets.only(left: 20,right: 10,top: 10,bottom: 10),
                child: Text(
                  "Other notification",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff6B7280),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: otherNotification.length,
                  itemBuilder: (context,index)=>Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(otherNotification[index],style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),),
                          GetBuilder<EditNotificationController>(
                              builder: (logic) {
                                return Container(
                                  child: FlutterSwitch(
                                    width: 60,
                                    height: 30,
                                    toggleSize: 15,
                                    value: logic.isSwitched[index+5],
                                    borderRadius: 30.0,
                                    onToggle: (val) {
                                      logic.changeIsSwitched(value:val, item: index+5);
                                    },
                                  ),
                                );
                              }),                        ],
                      ),
                      SizedBox(height: 20,),
                      Divider(height: 2,thickness: 2,),
                      SizedBox(height: 20,)

                    ],
                  )
              ),
            ),



          ],
        ),
      ),
    );
  }
}
