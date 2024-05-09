import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../controller/dataCrossPages.dart';
import '../../../controller/homeScreenController.dart';
import '../../../controller/jobApplyController.dart';
import '../../../controller/showSavedJobsController.dart';
import '../../../generated/assets.dart';
import 'package:dotted_border/dotted_border.dart';

import '../../../root/routs.dart';


class ReApplyJob extends StatelessWidget {
  HomeScreenController homeController = Get.find();
  JobApplyController jobApplyController =
      Get.put<JobApplyController>(JobApplyController());
  DataCrossPages selectedJob = Get.put<DataCrossPages>(DataCrossPages());
  ShowSavedJobsController ssjc = Get.put<ShowSavedJobsController>(ShowSavedJobsController());


  final CarouselController buttonCarouselController = CarouselController();
  final double h = Get.height;
  final double w = Get.width;
  final TextEditingController nameTxtController = TextEditingController();
  final TextEditingController emailTxtController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              return      IconButton(
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
          'Job Apply',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Column(
              children: [
                Image.network(
                  selectedJob.job.image!,
                  width: w * 0.3,
                  height: h * 0.1,
                ),
             SizedBox(
                    height: 20,
                  ),
             Text(
               selectedJob.job.name!,
               style: TextStyle(
                   fontSize: 20, fontWeight: FontWeight.w500),
             ),
              SizedBox(
                height: 5,
              ),
             Text(
               selectedJob.job.compName! + ' • ' +selectedJob.job.location!.split(', ')[selectedJob.job.location!.split(', ').length-2]+', '+ selectedJob.job.location!.split(', ').last,
               style: TextStyle(
                   fontSize: 16, fontWeight: FontWeight.w400),
             ),
             SizedBox(
               height: 20,),
          
             GetBuilder<JobApplyController>(
               builder: (JobApplyController controller) =>
                   Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       Container(
                         decoration: BoxDecoration(
                           border: Border.all(
                               color: jobApplyController.currentPage >= 0
                                   ? Color(0xff3366FF)
                                   : Colors.grey),
                           borderRadius: BorderRadius.circular(50),
                         ),
                         child: CircleAvatar(
                           radius: 30,
          
                           backgroundColor: jobApplyController.currentPage > 0
                               ? Color(0xff3366FF)
                               : Colors.transparent,
          
                           child: Text(
                             jobApplyController.currentPage > 0 ? '✓':'1',
                             style: TextStyle(
                               fontSize: 30,
                               fontWeight: FontWeight.w500,
                               color:jobApplyController.currentPage > 0?
                               Colors.white :
                               jobApplyController.currentPage == 0?
                               Color(0xff3366FF) : Colors.grey,
          
                             ),
                           ),
                         ),
                       ),
                       Text('.....',
                           style: TextStyle(
                               fontSize: 30,
                               fontWeight: FontWeight.w500,
                               color:jobApplyController.currentPage >= 1
                                   ? Color(0xff3366FF)
                                   : Colors.grey,
                           )),
                       Container(
                         decoration: BoxDecoration(
                           border: Border.all(
                               color: jobApplyController.currentPage >= 1
                                   ? Color(0xff3366FF)
                                   : Colors.grey),
                           borderRadius: BorderRadius.circular(50),
                         ),
                         child: CircleAvatar(
                           radius: 30,
          
                           backgroundColor: jobApplyController.currentPage > 1
                               ? Color(0xff3366FF)
                               : Colors.transparent,
          
                           child: Text(
                             jobApplyController.currentPage > 1 ? '✓':'2',
                             style: TextStyle(
                               fontSize: 30,
                               fontWeight: FontWeight.w500,
                               color:jobApplyController.currentPage > 1?
                               Colors.white :
                               jobApplyController.currentPage == 1?
                               Color(0xff3366FF) : Colors.grey,
          
                             ),
                           ),
                         ),
                       ),
                       Text('.....',
                           style: TextStyle(
                             fontSize: 30,
                             fontWeight: FontWeight.w500,
                             color:jobApplyController.currentPage >= 2
                                 ? Color(0xff3366FF)
                                 : Colors.grey,
                           )),
                       Container(
                         decoration: BoxDecoration(
                           border: Border.all(
                               color: jobApplyController.currentPage >= 2
                                   ? Color(0xff3366FF)
                                   : Colors.grey),
                           borderRadius: BorderRadius.circular(50),
                         ),
                         child: CircleAvatar(
                           radius: 30,
          
                           backgroundColor: jobApplyController.currentPage > 2
                               ? Color(0xff3366FF)
                               : Colors.transparent,
          
                           child: Text(
                             jobApplyController.currentPage > 2 ? '✓':'3',
                             style: TextStyle(
                               fontSize: 30,
                               fontWeight: FontWeight.w500,
                               color:jobApplyController.currentPage > 2?
                               Colors.white :
                               jobApplyController.currentPage == 2?
                               Color(0xff3366FF) : Colors.grey,
          
                             ),
                           ),
                         ),
                       ),
          
                     ],
          
                   ),
          
             ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: h * 0.7,
                  child: CarouselSlider(
                    carouselController: buttonCarouselController,
                    options: CarouselOptions(
                      height: double.infinity,
                      initialPage: 0,
                      autoPlay: false,
                      enlargeCenterPage: true,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: false,
                      viewportFraction: 1.0,
                      onPageChanged: (pageNum, reason) {
                        jobApplyController.setCurrentPage(pageNum);
                      },
                    ),
                    items: [
                      Container(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Biodata',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            const Text('Fill in your bio data correctly',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400)),
                            const SizedBox(
                              height: 20,
                            ),
                            RichText(
                                text: const TextSpan(
                                    text: 'Full Name',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                    children: <TextSpan>[
                                  TextSpan(
                                      text: ' *',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.red))
                                ])),
                            const SizedBox(
                              height: 10,
                            ),
                            TextField(
                              controller: nameTxtController,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person_outline),
                                hintText: 'Enter your full name',
                                hintStyle: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            RichText(
                                text: const TextSpan(
                                    text: 'Email',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                    children: <TextSpan>[
                                  TextSpan(
                                      text: ' *',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.red))
                                ])),
                            const SizedBox(
                              height: 10,
                            ),
                            TextField(
                              keyboardType: TextInputType.emailAddress,
                              controller: emailTxtController,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.email_outlined),
                                hintText: 'Enter your email',
                                hintStyle: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            RichText(
                                text: const TextSpan(
                                    text: 'phone No',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                    children: <TextSpan>[
                                  TextSpan(
                                      text: ' *',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.red))
                                ])),
                            const SizedBox(
                              height: 10,
                            ),
                            IntlPhoneField(
                              controller: phoneNumberController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(),
                                ),
                              ),
                              initialCountryCode: 'EG',
                              onChanged: (phone) {
                                print(phone.completeNumber);
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Type of work',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Fill in your bio data correctlyy',
                                  style: TextStyle(
                                      fontSize: 14, fontWeight: FontWeight.w400)),
                              SizedBox(
                                height: 20,
                              ),
                              GetBuilder<JobApplyController>(
                                builder: (controller)=>
                                    ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount:
                                      jobApplyController.typeOfWorkList.length,
                                      itemBuilder: (context, index) =>
                                          Column(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(10),
                                                    border: Border.all(
                                                        width: 1,
                                                        color:
                                                        controller.typeOfWorkList[index] ==
                                                            controller
                                                                .workType
                                                            ? Color(0xff3366FF)
                                                            : Color(
                                                            0xffD1D5DB)),
                                                    color: controller
                                                        .typeOfWorkList[
                                                    index] ==
                                                        controller.workType
                                                        ? Color(0xffD6E4FF)
                                                        : Colors.transparent),
                                                height: 0.1 * h,
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                      const EdgeInsets.all(10),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        children: [
                                                          Text(
                                                            controller
                                                                .typeOfWorkList[
                                                            index],
                                                            style: TextStyle(
                                                                fontWeight:
                                                                FontWeight.w500,
                                                                fontSize: 16),
                                                          ),
                                                          Text(
                                                            'CV.pdf  Portfolio.pdf ',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                FontWeight
                                                                    .w300),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Radio(
                                                      value: controller
                                                          .typeOfWorkList[index],
                                                      groupValue:
                                                      controller.workType,
          
                                                      onChanged: (value) {
                                                        debugPrint(value);
                                                        controller.setTypeOfWork(
                                                            type: value);
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 0.017 * h,
                                              )
                                            ],
                                          ),
                                    )
                              )
          
                            ],
                          )),
                      Container(
                          width: double.infinity,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Upload portfolio',
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('Fill in your bio data correctlyy',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400)),
                                SizedBox(
                                  height: 40,
                                ),
                                RichText(
                                    text: const TextSpan(
                                        text: 'Upload CV',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                        children: <TextSpan>[
                                      TextSpan(
                                          text: ' *',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.red))
                                    ])),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey[400]!),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: GetBuilder<JobApplyController>(
                                    builder: (controller) => Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                Assets.randomPicsPdfLogo,
                                                width: 35,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Column(
                                                children: [
                                                  Text(
                                                      jobApplyController
                                                              .fileName ??
                                                          '',
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500)),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                      jobApplyController
                                                              .fileSize ??
                                                          '',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400)),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              IconButton(
                                                  onPressed: () {
                                                    jobApplyController.uploadCV();
          
                                                    jobApplyController.update();
                                                  },
                                                  icon: Icon(
                                                    Icons.edit_note_outlined,
                                                    color: Colors.blue,
                                                    size: 30,
                                                  )),
                                              IconButton(
                                                  onPressed: () {
                                                    jobApplyController.pickedFile =
                                                        null;
                                                    jobApplyController.fileName =
                                                        null;
                                                    jobApplyController.fileSize =
                                                        null;
                                                    jobApplyController.update();
                                                  },
                                                  icon: Icon(
                                                    Icons
                                                        .highlight_remove_outlined,
                                                    color: Colors.red,
                                                  )),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text('Other File',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500)),
                                SizedBox(
                                  height: 20,
                                ),
                                DottedBorder(
                                  color: Color(0xF71754EF).withOpacity(0.5),
                                  strokeWidth: 3,
                                  dashPattern: [5, 5],
                                   strokeCap: StrokeCap.butt,
                                  borderType: BorderType.RRect,
                                  radius: Radius.circular(10),
                                  child: Container(
                                    color: Color(0xCA7096F5).withOpacity(0.2),
                                    width: double.infinity,
                                    height:h*0.27,
                                    child: GetBuilder<JobApplyController>(
                                      builder: (controller) => Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            CircleAvatar(
                                                radius: 40,
                                              backgroundColor: Color(0xA9AFE2F6),
                                              child: Icon(
                                                Icons.file_upload_outlined,
                                                size: 50,
                                                color:Color(0xF71754EF),
          
                                              ),
                                            ),
                                            Text(
                                                jobApplyController
                                                    .fileName2 ??
                                                    'Upload your other file',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.w500)),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                                jobApplyController
                                                    .fileSize2 ??
                                                    'Max size 10MB',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey,
                                                    fontWeight:
                                                    FontWeight.w400)),
                                            InkWell(
                                              onTap: (){
                                                jobApplyController.uploadOtherFile();
                                              },
                                              child: Container(
          
                                                decoration: BoxDecoration(
                                                  border: Border.all(color: Color(0xF71754EF)),
                                                  borderRadius: BorderRadius.circular(50),
                                                ),
                                                width: w*0.6,
                                                height: 40,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Icon(Icons.upload_file_outlined,color: Color(0xF71754EF),),
                                                    SizedBox(width: 10,),
                                                    Text('Add File',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color: Color(0xF71754EF),
                                                            fontWeight: FontWeight.w400)),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(),
                                          ],
                                        )
                                      ),
                                    ),
                                  ),
                                ),
          
                              ])
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    child:GetBuilder<JobApplyController>(
                      builder:(controller)=> ElevatedButton(
                        onPressed: () async{
                          if (controller.currentPage == 2) {
                            controller.name=nameTxtController.text.toString();
                            controller.jobId=selectedJob.job.id!.toString();
                            controller.email=emailTxtController.text.toString();
                            controller.userId=GetStorage().read('userID').toString();
                            controller.mobile= phoneNumberController.text.toString();
          
                          await controller.sendJobApplyApi();
          
                            !controller.ja.status!?
                            Get.toNamed(myRoutes.jobApplyComplete):
                            Get.snackbar(
                              'Error',
                              'Please fill all the fields',
                              snackPosition: SnackPosition.BOTTOM,
                              colorText: Color(0xffffffff),
                              backgroundColor: Color(0xffe10000),
                            );
          
          
                          } else {
                            buttonCarouselController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.linear);
                            controller
                                .setCurrentPage(controller.currentPage + 1);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(320, 50),
                          backgroundColor: !controller.isLoading? Color(0xff3366FF) : Colors.black38,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        child:
          
                        controller.currentPage == 2
                          ?  Text(
                              !controller.isLoading? 'Submit' : 'uploading',
                              style: TextStyle(fontSize: 16, color: Colors.white),
                            )
          
                        : const Text(
                          'Next',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    )
          
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
