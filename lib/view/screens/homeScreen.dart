import 'package:carousel_slider/carousel_slider.dart';
import 'package:final_project_ii/controller/jobApplyController.dart';
import 'package:final_project_ii/model/allJobsModel.dart';
import 'package:final_project_ii/root/routs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../controller/homeScreenController.dart';
import '../../controller/jobApplyCompleteController.dart';
import '../../controller/showSavedJobsController.dart';
import '../../controller/dataCrossPages.dart';
import '../widgets/homeScreenBase.dart';

class HomeScreen extends StatelessWidget {
  final h = Get.height;
  final w = Get.width;

  ShowSavedJobsController ssjc = Get.put<ShowSavedJobsController>(ShowSavedJobsController());
  HomeScreenController homeController =
      Get.put<HomeScreenController>(HomeScreenController());
  DataCrossPages selectedJob = Get.put<DataCrossPages>(DataCrossPages());

  @override
  Widget build(BuildContext context) {
    homeController.onInitFunc();
    ssjc.getSavedJob();

    // selectedJob.allJob = homeController.jl;
    return GetBuilder<HomeScreenController>(
      builder: (controller) => Scaffold(
        resizeToAvoidBottomInset: false,
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
            index == 1 ? Get.toNamed(myRoutes.messageScreen) :
            index==2 ? Get.toNamed(myRoutes.appliedJob) :
            index == 3 ? Get.toNamed(myRoutes.savedJobScreen) :
            index == 4 ? Get.toNamed(myRoutes.profileScreen) :null;
          },
        ),
        body: controller.isLoading == true
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hi, ${GetStorage().read('name').toString().toUpperCase()} 👋",
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            const Text(
                              'Create a better future for yourself here',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff6B7280),
                              ),
                            )
                          ],
                        )),
                       IconButton(onPressed: (){
                         Get.toNamed(myRoutes.notification);
                       }, icon:  Container(
                           decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(50),
                               border: Border.all(
                                 color: const Color(0xffD1D5DB),
                                 width: 1,
                               )),
                           child: const Padding(
                             padding: EdgeInsets.all(8.0),
                             child: Icon(Icons.notifications_none_outlined),


                           )))
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      onTap: () {
                        Get.toNamed(myRoutes.searchScreen);
                      },
                      keyboardType: TextInputType.none,
                      decoration: InputDecoration(
                        hintText: 'Search',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        filled: false,
                        fillColor: Colors.transparent,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GetBuilder<JobApplyCompleteController>(
                      init: JobApplyCompleteController(),
                      builder: (controller) => controller.isApplyed
                          ? Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color(0xffD6E4FF),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.network(
                                      selectedJob.job.image!,
                                      height: 50,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            selectedJob.job.name!,
                                            textAlign: TextAlign.left,
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            controller.isReplaid
                                                ? 'You have been accepted for the selection interview'
                                                : 'Waiting to be selected by the twitter team',
                                            textAlign: TextAlign.left,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.black54,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        !controller.isReplaid
                                            ?  Get.toNamed(myRoutes.chatScreen,arguments: {
                                        'image': selectedJob.job.image,
                                        'name' : selectedJob.job.name,
                                        })
                                            : null;
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: controller.isReplaid
                                              ? const Color(0xffB2ED82)
                                              : const Color(0xffaec9ff),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Text(
                                            controller.isReplaid
                                                ? 'Accepted'
                                                : 'Submited',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: controller.isReplaid
                                                  ? const Color(0xff1B720F)
                                                  : const Color(0xff003fff),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          : const SizedBox(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Suggested Job',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff111827),
                          ),
                        ),
                        Text(
                          'View all',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff3366FF),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CarouselSlider.builder(
                      itemCount: controller.jl.data!.length,
                      options: CarouselOptions(
                        height: 200,
                        viewportFraction: 0.85,
                        initialPage: 0,
                        enableInfiniteScroll: false,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: false,
                        onPageChanged: (indexx, reason) {
                          controller.pageChanged(indexx);
                        },
                        disableCenter: true,
                        scrollDirection: Axis.horizontal,
                      ),
                      itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) =>
                          InkWell(
                            onTap: (){
                              selectedJob.job = controller.jl.data![itemIndex];
                              Get.toNamed(myRoutes.jobDetails);
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: controller.currentPage == itemIndex
                                      ? const Color(0xff091A7A)
                                      : const Color(0xffF4F4F5),
                                  // color:Color(0xff091A7A),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(children: [
                                        Column(children: [
                                          Row(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                BorderRadius.circular(15),
                                                child: Image.network(
                                                  controller
                                                      .jl.data![itemIndex].image!,
                                                  height: 50,
                                                ),
                                              ),
                                              Container(
                                                width: 190,
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      controller.jl
                                                          .data![itemIndex].name!,
                                                      softWrap: true,
                                                      textAlign: TextAlign.center,
                                                      style: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                        FontWeight.w500,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    Text(
                                                      controller
                                                          .jl
                                                          .data![itemIndex]
                                                          .compName!,
                                                      style: const TextStyle(
                                                        fontSize: 14,
                                                        color: Color(0xff9CA3AF),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          )
                                        ]),
                                        GetBuilder<DataCrossPages>(
                                          builder: (controller) =>
                                              IconButton(
                                                icon: Icon(
                                                ssjc.showSavedJobs.data!=null?
                                                ssjc.showSavedJobs.data!.any((element) => element.jobId == homeController.jl.data![itemIndex].id)
                                                      ? Icons.bookmarks
                                                      : Icons.bookmarks_outlined:Icons.bookmarks_outlined,
                                                  color: const Color(0xff3366FF),
                                                ),
                                                onPressed: () async{

                                                  if(ssjc.showSavedJobs.data!=null)
                                                  if(!ssjc.showSavedJobs.data!.any((element) => element.jobId == homeController.jl.data![itemIndex].id)){
                                                    await ssjc.saveJob(JobId: homeController.jl.data![itemIndex].id.toString(),location:' ');
                                                  }else{
                                                    await ssjc.delFavJob(id: ssjc.showSavedJobs.data![ssjc.showSavedJobs.data!.indexWhere((element) => element.jobId == homeController.jl.data![itemIndex].id)].id.toString(), jobId: '');
                                                  }
                                                  await ssjc.saveJob(JobId: homeController.jl.data![itemIndex].id.toString(),location:' ');


                                                  controller.update();


                                                },
                                              ),
                                        ),
                                      ]),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: [
                                          FilterChipWidget(controller
                                              .jl.data![itemIndex].jobTimeType!),
                                          FilterChipWidget(itemIndex % 2 == 0
                                              ? 'Remote'
                                              : 'On Set'),
                                          FilterChipWidget(controller
                                              .jl.data![itemIndex].jobType!),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                                text:
                                                "${controller.jl.data![itemIndex].salary!.substring(0, controller.jl.data![itemIndex].salary!.length - 3)}K EGP",
                                                style: const TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                ),
                                                children: const [
                                                  TextSpan(
                                                    text: "/Month",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w500,
                                                      color: Colors.white54,
                                                    ),
                                                  ),
                                                ]),
                                          ),
                                          TextButton(
                                            onPressed: () {},
                                            style: TextButton.styleFrom(
                                                backgroundColor:
                                                const Color(0xff3366FF),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(20),
                                                )),
                                            child: const Padding(
                                              padding: EdgeInsets.only(
                                                  left: 10.0, right: 10.0),
                                              child: Text(
                                                'Apply now',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )),
                          ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recent Job',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff111827),
                          ),
                        ),
                        Text(
                          'View all',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff3366FF),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      // height: 300,
                      child: ListView.builder(
                          itemCount: controller.jl.data!.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context, int index) =>
                              InkWell(
                                onTap: () {
                                  selectedJob.job = controller.jl.data![index];
                                  Get.toNamed(myRoutes.jobDetails);
                                },
                                child:
                                Column(
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
                                                        .spaceAround,
                                                children: [
                                                  Column(children: [
                                                    Row(
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                          child: Image.network(
                                                            controller
                                                                .jl
                                                                .data![index]
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
                                                                  controller
                                                                      .jl
                                                                      .data![
                                                                          index]
                                                                      .name!,

                                                                  // textAlign: TextAlign.center,
                                                                  style:
                                                                      const TextStyle(
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
                                                                  controller
                                                                      .jl
                                                                      .data![
                                                                          index]
                                                                      .compName!,
                                                                  style:
                                                                      const TextStyle(
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
                                                    builder: (controller) =>
                                                        IconButton(
                                                          icon: Icon(
                                                            ssjc.showSavedJobs.data!=null?
                                                            ssjc.showSavedJobs.data!.any((element) => element.jobId == homeController.jl.data![index].id)
                                                                ? Icons.bookmarks
                                                                : Icons.bookmarks_outlined:Icons.bookmarks_outlined,
                                                            color: const Color(0xff3366FF),
                                                          ),
                                                          onPressed: () async{

                                                            if(ssjc.showSavedJobs.data!=null)
                                                              if(!ssjc.showSavedJobs.data!.any((element) => element.jobId == homeController.jl.data![index].id)){
                                                                await ssjc.saveJob(JobId: homeController.jl.data![index].id.toString(),location:' ');
                                                              }else{
                                                                await ssjc.delFavJob(id: ssjc.showSavedJobs.data![ssjc.showSavedJobs.data!.indexWhere((element) => element.jobId == homeController.jl.data![index].id)].id.toString(), jobId: '');
                                                              }
                                                            await ssjc.saveJob(JobId: homeController.jl.data![index].id.toString(),location:' ');


                                                            controller.update();


                                                          },
                                                        ),
                                                  ),
                                                ]),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                FilterChipWidget2(controller.jl
                                                    .data![index].jobTimeType!),
                                                FilterChipWidget2(index % 2 == 0
                                                    ? 'Remote'
                                                    : 'On Set'),
                                                FilterChipWidget2(controller
                                                    .jl.data![index].jobType!),
                                                RichText(
                                                  text: TextSpan(
                                                      text:
                                                          "${controller.jl.data![index].salary!.substring(0, controller.jl.data![index].salary!.length - 3)}K EGP",
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            Color(0xff2E8E18),
                                                      ),
                                                      children: const [
                                                        TextSpan(
                                                          text: "/Month",
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Color(
                                                                0xff6B7280),
                                                          ),
                                                        ),
                                                      ]),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    index != controller.jl.data!.length - 1
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
                                    const SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              )),
                    ),
                  ]),
                ),
              ),
      ),
    );
  }
}
