import 'package:final_project_ii/controller/searchResultController.dart';
import 'package:final_project_ii/root/routs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../controller/homeScreenController.dart';
import '../../controller/jobDetailsController.dart';
import '../../controller/showSavedJobsController.dart';
import '../../generated/assets.dart';
import '../../model/allJobsModel.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../../model/searchResultModel.dart';
import '../../controller/dataCrossPages.dart';
import '../widgets/homeScreenBase.dart';

class JobDetails extends StatelessWidget {

  @override
  HomeScreenController homeController =  Get.find();



  JobDetailsController controller =
      Get.put<JobDetailsController>(JobDetailsController());
  DataCrossPages selectedJob=Get.put<DataCrossPages>(DataCrossPages());
  ShowSavedJobsController ssjc = Get.put<ShowSavedJobsController>(ShowSavedJobsController(),permanent: true);


  double w = Get.width;
  double h = Get.height;


  int index = 0;




  Widget build(BuildContext context) {


    return Scaffold(
        floatingActionButton: Container(
          width: w * 0.8,
          height: 50,
          child: FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            child: Text(
              'Apply now',
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
            backgroundColor: Color(0xff3366FF),
            onPressed: () {
              Get.toNamed(myRoutes.jobApply,);

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
          actions: [
            GetBuilder<DataCrossPages>(
              builder: (controller) {
                return   IconButton(
                  icon: Icon(
                    ssjc.showSavedJobs.data!=null?
                    ssjc.showSavedJobs.data!.any((element) => element.jobId ==selectedJob.job.id)
                        ? Icons.bookmarks
                        : Icons.bookmarks_outlined:Icons.bookmarks_outlined,
                    color: Color(0xff3366FF),
                  ),
                  onPressed: () async{

                    if(ssjc.showSavedJobs.data!=null)
                      if(!ssjc.showSavedJobs.data!.any((element) => element.jobId == selectedJob.job.id)){
                        await ssjc.saveJob(JobId: selectedJob.job.id.toString(),location:' ');
                      }else{
                        await ssjc.delFavJob(id: ssjc.showSavedJobs.data![ssjc.showSavedJobs.data!.indexWhere((element) => element.jobId ==selectedJob.job.id)].id.toString(), jobId: '');
                      }
                    await ssjc.saveJob(JobId: selectedJob.job.id.toString(),location:' ');


                    controller.update();


                  },
                );
              },
            )
          ],
          title: Text(
            'Job Details',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
        ),
        body: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                      child: Column(
                    children: [
                      Image.network(selectedJob.job.image!, height: 80, ),
                      // Image.asset(Assets.flagsRus, height: 100),
                      Text(selectedJob.job.name!, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),

                      Text(selectedJob.job.compName! + ' • ' +
                          selectedJob.job.location!.toString().split(', ').last,
                        style: TextStyle(fontSize: 12, color: Color(0xff374151),),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: w * 0.8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FilterChip(
                              label: Text(selectedJob.job.jobType!),
                              onSelected: (bool value) {},
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Color(0xffD6E4FF), width: 1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              backgroundColor: Color(0xffD6E4FF),
                            ),
                            FilterChip(
                              label: Text('On site'),
                              onSelected: (bool value) {},
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Color(0xffD6E4FF), width: 1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              backgroundColor: Color(0xffD6E4FF),
                            ),
                            FilterChip(
                              label: Text(selectedJob.job.jobTimeType!),
                              onSelected: (bool value) {},
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Color(0xffD6E4FF), width: 1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              backgroundColor: Color(0xffD6E4FF),
                            ),

                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ToggleSwitch(
                        minWidth: w * 0.29,
                        cornerRadius: 20.0,
                        activeBgColors: [
                          [Color(0xff02337A)],
                          [Color(0xff02337A)],
                          [Color(0xff02337A)]
                        ],
                        inactiveFgColor: Color(0xff6B7280),
                        inactiveBgColor: Color(0xffF4F4F5),
                        activeFgColor: Colors.white,
                        initialLabelIndex: 0,
                        totalSwitches: 3,
                        labels: ['Desicription', 'Company', 'People'],
                        radiusStyle: true,
                        onToggle: (index) {
                          controller.changeIndex(index!);
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GetBuilder<JobDetailsController>(
                          builder: (controller) => Container(
                                child: controller.pageIndex == 0
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text('Job Description',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500),
                                              textAlign: TextAlign.left),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(selectedJob.job.jobDescription!),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          const Text(
                                            'Skill Required',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          ListView.builder(
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: selectedJob.job.jobSkill!.toString().split(',').length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Text(' • ' +
                                                  selectedJob.job.jobSkill!.toString().split(',')[index]
                                              );
                                            },
                                          ),
                                        ],
                                      )
                                    : controller.pageIndex == 1
                                        ? Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Contact Us',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    width: w * 0.4,
                                                    height: h * 0.1,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      border: Border.all(
                                                          color:
                                                              Colors.grey[500]!,
                                                          width: 1),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Email',
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              color: Color(
                                                                  0xff9CA3AF),
                                                            ),
                                                          ),
                                                          Text(
                                                            selectedJob.job.compEmail!,
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                          // Text(jl.data![index].compEmail!,
                                                          //   style: TextStyle(
                                                          //     fontSize: 14,
                                                          //   ),
                                                          // ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: w * 0.4,
                                                    height: h * 0.1,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      border: Border.all(
                                                          color:
                                                              Colors.grey[500]!,
                                                          width: 1),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Website',
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              color: Color(
                                                                  0xff9CA3AF),
                                                            ),
                                                          ),
                                                          Text(
                                                            selectedJob.job.compWebsite!,
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                          // Text(jl.data![index].compWebsite!,
                                                          //   style: TextStyle(
                                                          //     fontSize: 14,
                                                          //   ),
                                                          // ),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                'About Company',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                selectedJob.job.aboutComp!,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Color(0xff374151),
                                                ),
                                              )
                                            ],
                                          )
                                        : Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    children: [
                                                      Text(
                                                        '6 Employees For',
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
                                                      ),
                                                      Text(
                                                        'UI/UX Design',
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              Color(0xff6B7280),
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50),
                                                        border: Border.all(
                                                            color: Colors
                                                                .grey[500]!,
                                                            width: 1),
                                                      ),
                                                      child: GetBuilder<
                                                          JobDetailsController>(
                                                        builder: (controller) =>
                                                            DropdownButtonHideUnderline(
                                                          child:
                                                              DropdownButton2<
                                                                  String>(
                                                            isExpanded: true,
                                                            hint: Text(
                                                              controller
                                                                  .menuText,
                                                              style: TextStyle(
                                                                fontSize: 14,
                                                                color: Colors
                                                                    .grey[500]!,
                                                              ),
                                                            ),
                                                            items: controller.items
                                                                .map((String
                                                                        item) =>
                                                                    DropdownMenuItem<
                                                                        String>(
                                                                      value:
                                                                          item,
                                                                      child:
                                                                          Text(
                                                                        item,
                                                                        style:
                                                                            const TextStyle(
                                                                          fontSize:
                                                                              14,
                                                                        ),
                                                                      ),
                                                                    ))
                                                                .toList(),
                                                            onChanged: (String?
                                                                value) {
                                                              controller
                                                                  .changeMenuText(
                                                                      value!);
                                                            },
                                                            buttonStyleData:
                                                                const ButtonStyleData(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          16),
                                                              height: 40,
                                                              width: 180,
                                                            ),
                                                            menuItemStyleData:
                                                                const MenuItemStyleData(
                                                              height: 40,
                                                            ),
                                                          ),
                                                        ),
                                                      ))
                                                ],
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              ListView.builder(
                                                itemCount: controller.employees.length,
                                                shrinkWrap: true,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return ListTile(
                                                      leading: CircleAvatar(
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        child: Image.asset(
                                                          controller.employees[index]
                                                              ['image']!,
                                                          height: 50,
                                                          width: 50,
                                                        ),
                                                      ),
                                                      title: Text(
                                                        controller.employees[index]
                                                            ['name']!,
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      subtitle: Text(
                                                       controller.employees[index]
                                                            ['position']!,
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            color: Colors
                                                                .grey[500],
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                      trailing: Column(
                                                        children: [
                                                          Text(
                                                            'Work Duration',
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                color: Colors
                                                                    .grey[500],
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                          Text(
                                                            controller.employees[index][
                                                                    'duration']! +
                                                                ' years',
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                color: Color(
                                                                    0xff3366FF),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                        ],
                                                      ));
                                                },
                                              )
                                            ],
                                          ),
                              )),
                    ],
                  ))
                ],
              ),
            )));
  }
}
