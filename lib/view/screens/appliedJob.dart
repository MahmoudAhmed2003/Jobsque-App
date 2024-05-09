import 'package:final_project_ii/root/routs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../controller/AppliedJobController.dart';
import '../../controller/dataCrossPages.dart';
import '../../controller/homeScreenController.dart';
import '../../controller/showSavedJobsController.dart';
import '../../generated/assets.dart';
import '../widgets/homeScreenBase.dart';

class AppliedJob extends StatelessWidget {
  AppliedJob({super.key});
  ShowSavedJobsController ssjc = Get.put<ShowSavedJobsController>(ShowSavedJobsController());

  AppliedJobController jobController = Get.put(AppliedJobController());
  DataCrossPages selectedJob = Get.put(DataCrossPages());
  HomeScreenController homeController =
  Get.put<HomeScreenController>(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    final w = Get.width;
    final h = Get.height;
    jobController.getAppliedJob();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Applied Job',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
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
        currentIndex: 0,
        showUnselectedLabels: true,
        selectedFontSize: 16,
        unselectedFontSize: 16,
        unselectedItemColor: Color(0xff9CA3AF),
        unselectedLabelStyle: TextStyle(
          fontSize: 16,
          color: Color(0xff9CA3AF),
        ),
        selectedLabelStyle: TextStyle(
          fontSize: 16,
          color: Color(0xff1634de),
        ),
        selectedItemColor: Color(0xff1634de),
        onTap: (index) {
          index==0 ? Get.toNamed(myRoutes.homeScreen) :
          index == 1 ? Get.toNamed(myRoutes.messageScreen) :
          index == 3 ? Get.toNamed(myRoutes.savedJobScreen) :
          index == 4 ? Get.toNamed(myRoutes.profileScreen) :null;
        },
      ),
      body: !jobController.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
            child: SafeArea(
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  ToggleSwitch(
                    minWidth: w * 0.4,
                    cornerRadius: 20.0,
                    activeBgColors: [
                      [Color(0xff091A7A)],
                      [Color(0xff091A7A)]
                    ],
                    activeFgColor: Colors.white,
                    inactiveBgColor: Color(0xffF4F4F5),
                    inactiveFgColor: Color(0xff6B7280),
                    initialLabelIndex: 0,
                    totalSwitches: 2,
                    labels: ['Active', 'Rejected'],
                    radiusStyle: true,
                    onToggle: ( index) {
                      jobController.changeJobStatus(index!);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),

                 GetBuilder<AppliedJobController>(
                   builder: (controller)=>
                   controller.activeJob==0?
                       Column(
                     children: [
                       Container(
                         width: double.infinity,
                         color: Colors.grey[200],
                         child: Padding(
                           padding: EdgeInsets.all(10.0),
                           child:  Text(
                             'Applied Jobs',
                             style: TextStyle(
                               fontSize: 16.0,
                               fontWeight: FontWeight.bold,
                               color: Color(0xff6B7280),

                             ),
                           ),
                         ),
                       ),
                       SizedBox(height: 20,),
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: ListView.builder(
                           physics: NeverScrollableScrollPhysics(),
                           shrinkWrap: true,
                           itemCount: 3,//jobController.model!.data!.length,
                           itemBuilder: (context,index)=>

                           InkWell(
                             onTap: (){
                               selectedJob.job=homeController.jl.data![index];
                               Get.toNamed(myRoutes.reApplyJob);
                             },
                             child: Column(
                               children: [
                                 Container(
                                     decoration: BoxDecoration(
                                       borderRadius:
                                       BorderRadius.circular(10),
                                       color: Colors.white,
                                     ),
                                     child: Column(
                                       mainAxisAlignment:
                                       MainAxisAlignment.spaceEvenly,
                                       children: [
                                         Row(
                                             mainAxisAlignment:
                                             MainAxisAlignment
                                                 .spaceBetween,
                                             children: [
                                               Column(children: [
                                                 Row(
                                                   children: [
                                                     ClipRRect(
                                                       borderRadius:
                                                       BorderRadius
                                                           .circular(15),
                                                       child: Image.network(
                                                         homeController.jl.data![index]
                                                             .image!,
                                                         height: 70,
                                                       ),
                                                     ),
                                                     Padding(
                                                       padding:
                                                       const EdgeInsets
                                                           .only(
                                                           left: 10),
                                                       child: Container(
                                                         width: 200,
                                                         child: Column(
                                                           crossAxisAlignment:
                                                           CrossAxisAlignment
                                                               .start,
                                                           children: [
                                                             Text(
                                                               homeController
                                                                   .jl
                                                                   .data![
                                                               index]
                                                                   .name!,

                                                               // textAlign: TextAlign.center,
                                                               style:
                                                               TextStyle(
                                                                 fontSize:
                                                                 18,
                                                                 fontWeight:
                                                                 FontWeight
                                                                     .w500,
                                                                 color: Colors
                                                                     .black,
                                                               ),
                                                             ),
                                                             Text(
                                                               homeController
                                                                   .jl
                                                                   .data![
                                                               index]
                                                                   .compName! +" • "+ homeController.jl.data![index].location!.split(', ')[homeController.jl.data![index].location!.split(', ').length-2]+", "+homeController.jl.data![index].location!.split(', ')[homeController.jl.data![index].location!.split(', ').length-3],
                                                               style:
                                                               TextStyle(
                                                                 fontSize:
                                                                 14,
                                                                 color: Color(
                                                                     0xff374151),
                                                               ),
                                                             ),
                                                           ],
                                                         ),
                                                       ),
                                                     )
                                                   ],
                                                 )
                                               ]),
                                               GetBuilder<DataCrossPages>(
                                                 builder: (selectedJob) =>
                                                     IconButton(
                                                       icon: Icon(
                                                         ssjc.showSavedJobs.data!=null?
                                                         ssjc.showSavedJobs.data!.any((element) => element.jobId == homeController.jl.data![index].id)
                                                             ? Icons.bookmarks
                                                             : Icons.bookmarks_outlined:Icons.bookmarks_outlined,
                                                         color: Color(0xff3366FF),
                                                       ),
                                                       onPressed: () async{

                                                         if(ssjc.showSavedJobs.data!=null)
                                                           if(!ssjc.showSavedJobs.data!.any((element) => element.jobId == homeController.jl.data![index].id)){
                                                             await ssjc.saveJob(JobId: homeController.jl.data![index].id.toString(),location:' ');
                                                           }else{
                                                             await ssjc.delFavJob(id: ssjc.showSavedJobs.data![ssjc.showSavedJobs.data!.indexWhere((element) => element.jobId == homeController.jl.data![index].id)].id.toString(), jobId: '');
                                                           }
                                                         await ssjc.saveJob(JobId: homeController.jl.data![index].id.toString(),location:' ');


                                                         selectedJob.update();


                                                       },
                                                     ),
                                               ),
                                             ]),
                                         SizedBox(
                                           height: 20,
                                         ),
                                         Row(
                                           mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                           children: [
                                             Row(
                                               mainAxisAlignment:
                                               MainAxisAlignment.start,
                                               children: [
                                                 FilterChipWidget2(homeController.jl
                                                     .data![index].jobTimeType!),
                                                 SizedBox(
                                                   width: 10,
                                                 ),
                                                 FilterChipWidget2(index % 2 == 0
                                                     ? 'Remote'
                                                     : 'On Site'),


                                               ],
                                             ),
                                             Text('Posted 2 days ago',
                                                 style: TextStyle(
                                                   fontSize: 12,
                                                   fontWeight: FontWeight.w400,
                                                   color: Color(0xff6B7280),
                                                 )
                                             ),
                                             // RichText(
                                             //   text: TextSpan(
                                             //       text:
                                             //       "${homeController.jl.data![index].salary!.substring(0, homeController.jl.data![index].salary!.length - 3)}K EGP",
                                             //       style: const TextStyle(
                                             //         fontSize: 16,
                                             //         fontWeight:
                                             //         FontWeight.w500,
                                             //         color:
                                             //         Color(0xff2E8E18),
                                             //       ),
                                             //       children: const [
                                             //         TextSpan(
                                             //           text: "/Month",
                                             //           style: TextStyle(
                                             //             fontSize: 12,
                                             //             fontWeight:
                                             //             FontWeight.w500,
                                             //             color: Color(
                                             //                 0xff6B7280),
                                             //           ),
                                             //         ),
                                             //       ]),
                                             // ),
                                           ],
                                         ),
                                       ],
                                     )),
                                 SizedBox(
                                   height: 20,
                                 ),
                                 Container(
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(10),
                                     border: Border.all(
                                       color: Colors.grey,
                                     ),
                                   ),
                                   child: Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                       children: [
                                         Column(
                                           children: [
                                             Container(
                                               // color: index >= 0
                                               //     ? Color(0xff3366FF)
                                               //     : Colors.grey,
                                               width: 40,
                                               height: 40,
                                               decoration: BoxDecoration(
                                                 color: index >= 0
                                                     ? Color(0xff3366FF)
                                                     : Colors.grey,
                                                 border: Border.all(
                                                     color: index >= 0
                                                         ? Color(0xff3366FF)
                                                         : Colors.grey),
                                                 borderRadius: BorderRadius.circular(50),
                                               ),
                                               child: Center(
                                                 child: Text(
                                                   index > 0 ? '✓':'1',
                                                   style: TextStyle(
                                                     fontSize: 20,
                                                     fontWeight: FontWeight.w500,
                                                     color:index > 0?
                                                     Colors.white :
                                                     index != 0?
                                                     Color(0xff3366FF) : Colors.white,

                                                   ),
                                                 ),
                                               ),
                                             ),
                                             SizedBox(
                                               height: 5,
                                             ),
                                             Text('Biodata',
                                                 style: TextStyle(
                                                   fontSize: 12,
                                                   fontWeight: FontWeight.w400,
                                                   color:index >= 0?
                                                   Color(0xff3366FF) : Colors.grey,

                                                 )),
                                           ],
                                         ),
                                         Text('.....',
                                             style: TextStyle(
                                               fontSize: 20,
                                               fontWeight: FontWeight.w500,
                                               color:index >= 1
                                                   ? Color(0xff3366FF)
                                                   : Colors.grey,
                                             )),
                                         Column(
                                           children: [
                                             Container(
                                               // color: index >= 0
                                               //     ? Color(0xff3366FF)
                                               //     : Colors.grey,
                                               width: 40,
                                               height: 40,
                                               decoration: BoxDecoration(
                                                 color: index >= 1
                                                     ? Color(0xff3366FF)
                                                     : Colors.transparent,
                                                 border: Border.all(
                                                     width: 1,
                                                     color: index >= 1
                                                         ? Color(0xff3366FF)
                                                         : Colors.grey),
                                                 borderRadius: BorderRadius.circular(50),
                                               ),
                                               child: Center(
                                                 child: Text(
                                                   index > 1 ? '✓':'2',
                                                   style: TextStyle(
                                                     fontSize: 20,
                                                     fontWeight: FontWeight.w500,
                                                     color:index >= 1?
                                                     Colors.white : index<1? Colors.grey:
                                                     Color(0xff3366FF) ,

                                                   ),
                                                 ),
                                               ),
                                             ),
                                             SizedBox(
                                               height: 5,
                                             ),
                                             Text('Type of work',
                                                 style: TextStyle(
                                                   fontSize: 12,
                                                   fontWeight: FontWeight.w400,
                                                   color:index < 1?
                                                   Colors.grey:
                                                   Color(0xff3366FF) ,

                                                 )),
                                           ],
                                         ),
                                         Text('.....',
                                             style: TextStyle(
                                               fontSize: 20,
                                               fontWeight: FontWeight.w500,
                                               color:index >= 2
                                                   ? Color(0xff3366FF)
                                                   : Colors.grey,
                                             )),
                                         Column(
                                           children: [
                                             Container(
                                               // color: index >= 0
                                               //     ? Color(0xff3366FF)
                                               //     : Colors.grey,
                                               width: 40,
                                               height: 40,
                                               decoration: BoxDecoration(
                                                 color: Colors.transparent,
                                                 border: Border.all(
                                                     width: 1,
                                                     color : Colors.grey),
                                                 borderRadius: BorderRadius.circular(50),
                                               ),
                                               child: Center(
                                                 child: Text(
                                                   index > 2 ? '✓':'3',
                                                   style: TextStyle(
                                                     fontSize: 20,
                                                     fontWeight: FontWeight.w500,
                                                     color: Colors.grey,
                                                   ),
                                                 ),
                                               ),
                                             ),
                                             SizedBox(
                                               height: 5,
                                             ),
                                             Text('Type of work',
                                                 style: TextStyle(
                                                   fontSize: 12,
                                                   fontWeight: FontWeight.w400,
                                                   color: Colors.grey,

                                                 )),
                                           ],
                                         ),

                                       ],

                                     ),
                                   ),
                                 ),
                                 SizedBox(
                                   height: 20,
                                 ),
                                 index != homeController.jl.data!.length - 1
                                     ? const Divider(
                                   color: Color(0xffc4c4c4),
                                   height: 2,
                                   thickness: 2,
                                   indent: 5,
                                   endIndent: 5,
                                 )
                                     : const SizedBox(
                                   height: 10,
                                 ),
                                 SizedBox(
                                   height: 20,
                                 ),
                               ],
                             ),
                           ),

                         ),
                       )
                     ],
                   )
                       :
                       Center(
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.center,
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             SizedBox(
                               height: 0.2 * h,
                             ),
                             Image.asset(
                               Assets.randomPicsAppNotFound,
                               height: 0.2 * h,
                             ),
                             SizedBox(
                               height: 0.05 * h,
                             ),
                             Text(
                               'No applications were rejected',
                               style: TextStyle(
                                   fontWeight: FontWeight.bold, fontSize: 24),
                             ),
                             SizedBox(
                               height: 0.02 * h,
                             ),
                             Text(
                               'If there is an application that is rejected by the ',
                               style: TextStyle(
                                   fontWeight: FontWeight.w300, fontSize: 16),
                             ),
                             Text(
                               'company it will appear here',
                               style: TextStyle(
                                   fontWeight: FontWeight.w300, fontSize: 16),
                             )
                           ],
                         ),

                       )
                 )



                ],
              )
                ),
          ),
    );



  }
}
