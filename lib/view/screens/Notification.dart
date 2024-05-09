import 'package:final_project_ii/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/utils.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String,String>> newNotficition=[
      {
        'name':'Dana',
        'msg': 'Posted new design jobs',
        'time':'10:00AM',
        'img':Assets.notificationDanaLogo,
      },
      {
        'name':'Shoope',
        'msg': 'Posted new design jobs',
        'time':'10:00AM',
        'img':Assets.notificationShoopeLogo,
      },
      {
        'name':'Slack',
        'msg': 'Posted new design jobs',
        'time':'10:00AM',
        'img':Assets.notificationSlackLogo,
      },
      {
        'name':'Facebook',
        'msg': 'Posted new design jobs',
        'time':'10:00AM',
        'img':Assets.notificationFacebookLogo,
      },

    ];
    List<Map<String,String>> oldNotficition=[
      {
        'name':'Slack',
        'msg': 'Your email setup was successful with the following details: Your new email is rafifdianganz@gmail.com.',
        'time':'10:00AM',

      },
      {
        'name':'Facebook',
        'msg': 'Hello Rafif Dian Axelingga, thank you for registering Jobsque. Enjoy the various features that....',
        'time':'10:00AM',

      },

    ];
    double w = Get.width;
    double h = Get.height;


    return  Scaffold(
      appBar: AppBar(
        title: Text('Notification',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),

      ),
      body: SafeArea(

        child: newNotficition.length+oldNotficition.length==0?
        Center(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 0.2 * h,
                ),
                Image.asset(
                  Assets.notificationNoNotification,
                  height: 0.2 * h,
                ),
                SizedBox(
                  height: 0.05 * h,
                ),
                Text(
                  'NNo new notifications yet  ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 24),
                ),
                SizedBox(
                  height: 0.02 * h,
                ),
                Text(
                  'You will receive a notification if there is something on your account.',
                  style: TextStyle(
                      fontWeight: FontWeight.w300, fontSize: 16),
                ),

              ],
            ),
          ),
        )
            :
        Column(
          children: [
            newNotficition.length==0?SizedBox():
            Container(
              width: double.infinity,
              color: Colors.grey[200],
              child:  Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                    '  New',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff6B7280),
                  ),
                ),


              ),
            ),
            SizedBox(height: 20,),
            Expanded(
              child: ListView.builder(
                itemCount: newNotficition.length,
                itemBuilder: (context,index) =>Padding(
                  padding: const EdgeInsets.only(left: 20,right:20 ),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        child: Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,

                            children: [
                              Image.asset(newNotficition[index]['img']!,height: 50,),
                            SizedBox(width: 10,),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(newNotficition[index]['name']!,style:TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),),

                                    Text(newNotficition[index]['msg']!,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Colors.black45,
                                    ),),
                                  ],
                                ),
                                SizedBox(width: 10,),
                                Container(
                                  width: 100,
                                  child: RichText(
                                    text:
                                    TextSpan(
                                      text: '• ',

                                      style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.orange,
                                      ),
                                      children:  <TextSpan>[
                                        TextSpan(text: newNotficition[index]['time'], style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                        color: Colors.black45,
                                        fontSize: 16,)),

                                      ],
                                    ),

                                  ),
                                )
                              ],
                            ),



                            ],
                          ),
                        ),


                      ),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.only(left: 50,right: 50),
                        child: Divider(
                          height: 5,

                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            oldNotficition.length==0?SizedBox():
            Container(
              width: double.infinity,
              color: Colors.grey[200],
              child:  Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  '  Yesterday',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff6B7280),
                  ),
                ),


              ),
            ),
            SizedBox(height: 20,),
            Expanded(
              child: ListView.builder(
                itemCount: oldNotficition.length,
                itemBuilder: (context,index) =>Padding(
                  padding: const EdgeInsets.only(left: 20,right:20 ),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        child: Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              CircleAvatar(
                                backgroundColor: Color(0x9DC1F0F3),
                                child: Icon(index%2!=0?Icons.manage_search:Icons.email_outlined),
                              ),
                              SizedBox(width: 10,),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(oldNotficition[index]['name']!,style:TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),),
                                      Container(
                                        width: 100,
                                        child: RichText(
                                          text:
                                          TextSpan(
                                            text: '• ',

                                            style: TextStyle(
                                              fontSize: 25,
                                              color: index%2==0?Colors.orange :Colors.black45 ,
                                            ),
                                            children:  <TextSpan>[
                                              TextSpan(text: oldNotficition[index]['time'], style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black45,
                                                fontSize: 16,)),

                                            ],
                                          ),

                                        ),
                                      ),

                                    ],
                                  ),
                                  SizedBox(height: 5,),
                                  Container(
                                    width: w*0.7,
                                    child: Text(oldNotficition[index]['msg']!,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),),
                                  ),
                                ],
                              ),



                            ],
                          ),
                        ),


                      ),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.only(left: 50,right: 50),
                        child: Divider(
                          height: 5,

                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),







          ],
        ),
      ),

    );
  }
}
