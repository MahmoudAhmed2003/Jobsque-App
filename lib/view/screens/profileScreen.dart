import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../controller/profileScreenController.dart';
import '../../generated/assets.dart';
import '../../root/routs.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreenController profController = Get.put<ProfileScreenController>(ProfileScreenController());

   ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    profController.getPortfolio();
    final w = Get.width;
    final h =Get.height;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.check_circle_outline_outlined,
            ),
            label: 'Applied',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border_outlined),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),

        ],
        currentIndex: 4,
        showUnselectedLabels: true,
        selectedFontSize: 16,
        unselectedFontSize: 16,
        unselectedItemColor: const Color(0xff9CA3AF),
        unselectedLabelStyle: const TextStyle(
          fontSize: 16,
          color: Color(0xff9CA3AF),
        ),
        selectedLabelStyle: const TextStyle(
          fontSize: 16,
          color: Color(0xff1634de),
        ),
        selectedItemColor: const Color(0xff1634de),
        onTap: (index) {
          index == 0 ? Get.toNamed(myRoutes.homeScreen) :
          index == 1 ? Get.toNamed(myRoutes.messageScreen) :
          index == 2 ? Get.toNamed(myRoutes.appliedJob) :
          index == 3 ? Get.toNamed(myRoutes. savedJobScreen) :null;
        },
      ),
      body: GetBuilder<ProfileScreenController>(
        builder: (controller) => controller.isLoading?const Center(child: CircularProgressIndicator(),):


      SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: const Color(0xffD6E4FF),
                child: Padding(
                  padding: const EdgeInsets.only(right: 20,left: 20,top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(Icons.arrow_back)),
                      const Text(
                        'Profile',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      IconButton(onPressed: () {
                        GetStorage().erase();
                        Get.offAllNamed(myRoutes.login);
                      }, icon: const Icon(Icons.logout_outlined ,color: Color(0xffFF472B),)),
                    ],
                  ),
                ),
              ),
              Stack(
                children: [
                  Center(
                    child:Container(
                      color:const Color(0xffD6E4FF),
                      width: double.infinity,
                      height: h*0.18,

                  ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top:h*0.1,left:(w/2)-60),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white   ,
                        width: 5,
                      ),
                      borderRadius: BorderRadius.circular(70),

                    ),

                    child: const CircleAvatar(
                      backgroundImage:AssetImage(Assets.imgsRandomPicsProfile),
                      radius: 60,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
               Text(profController.gusData.data!.profile!.name??'** no name',

              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(right: 20,left: 20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xfff3f3f3),
                  ),
                  width: double.infinity,

                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Applied',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black54
                            ),),
                            Text('46',
                                style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ))
                          ],
                        ),
                        VerticalDivider(width: 5,color: Colors.red,thickness: 20,endIndent: 0,indent: 20),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Reviewed',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black54
                              ),),
                            Text('23',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ))
                          ],
                        ),
                        VerticalDivider(width: 5,color: Colors.red,thickness: 20,endIndent: 0,indent: 20),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Contacted',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black54
                              ),),
                            Text('16',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ))
                          ],
                        ),


                      ],
                    ),
                  ),


                ),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(right: 20,left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('About',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.black38,
                        ),),
                        TextButton(onPressed: (){
                          Get.toNamed(myRoutes.editProfile);
                        }, child: const Text(
                          'Edit',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.blue,
                          ),
                        ))
                      ],
                    ),
                     Text(profController.gusData.data!.profile?.bio??'** no Bio',
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black38,
                      fontWeight: FontWeight.w400,
                    ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                width: double.infinity,
                color: Colors.grey[200],
                child: const Padding(
                  padding: EdgeInsets.only(left: 20,right: 10,top: 10,bottom: 10),
                  child: Text(
                    "General",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff6B7280),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(right: 20,left: 20),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: profController.generalSettings.length,
                  itemBuilder: (context,index)=>Column(
                    children: [
                    InkWell(
                      onTap: (){
                        profController.onclickGotoPAge(title: profController.generalSettings[index]['title']);
                      },
                      child:   Row(
                        mainAxisAlignment:MainAxisAlignment.spaceBetween,

                        children: [
                          Row(
                            children: [
                              CircleAvatar(

                                backgroundColor: const Color(0xffD6E4FF),
                                radius: 25,
                                child: Icon(profController.generalSettings[index]['icon'],size: 30,color:const Color(0xff3366FF) ),
                              ),
                              const SizedBox(width: 10,),
                              Text(profController.generalSettings[index]['title'],style: const TextStyle(
                                fontSize: 16,

                              ),),
                            ],
                          ),
                          IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward,))

                        ],
                      ),
                    ),
                      // SizedBox(height: 10,),
                      const Divider(height: 30 ,thickness: 2, color: Colors.black26,),
                      // SizedBox(height: 10,),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                width: double.infinity,
                color: Colors.grey[200],
                child: const Padding(
                  padding: EdgeInsets.only(left: 20,right: 10,top: 10,bottom: 10),
                  child: Text(
                    "Others",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff6B7280),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(right: 20,left: 20),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: profController.otherSettings.length,
                  itemBuilder: (context,index)=>Column(
                    children: [
                      InkWell(
                        onTap: (){
                          profController.onclickGotoPAge(title: profController.otherSettings[index]);

                        },
                        child:   Row(
                          mainAxisAlignment:MainAxisAlignment.spaceBetween,
                          children: [
                            Text(profController.otherSettings[index],style: const TextStyle(
                              fontSize: 16,

                            ),),
                            IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward))

                          ],
                        ),
                      ),
                      // SizedBox(height: 10,),
                      const Divider(height: 30 ,thickness: 2, color: Colors.black26,),
                      // SizedBox(height: 10,),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40,),









            ],
          ),
        ),
      ),
      ),
    );
  }
}
