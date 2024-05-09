
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/showSavedJobsController.dart';
import '../../generated/assets.dart';
import '../../root/routs.dart';
import '../widgets/buttonSheetFieldWidget.dart';

class SavedJobScreen extends StatelessWidget {
  SavedJobScreen({super.key});
  ShowSavedJobsController ssjc = Get.put<ShowSavedJobsController>(ShowSavedJobsController(),permanent: true);

  ShowSavedJobsController savedController = Get.put<ShowSavedJobsController>(ShowSavedJobsController(),permanent: true);
  @override
  Widget build(BuildContext context) {
    savedController.getSavedJob();
    double w = Get.width;
    double h = Get.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        automaticallyImplyLeading: false,
        title: Text(
          'Saved',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500,color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
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
        currentIndex: 3,
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
          index==1 ? Get.toNamed(myRoutes.messageScreen) :
          index==2 ? Get.toNamed(myRoutes.appliedJob) :
          index==3 ? Get.toNamed(myRoutes.savedJobs) :
          index==4 ? Get.toNamed(myRoutes.profileScreen) :null;
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: GetBuilder<ShowSavedJobsController>(
              builder: (controller) =>
                    savedController.isLoading ?
                    Center(child: CircularProgressIndicator()):
                    Column(
                      children: [
          savedController.showSavedJobs.data!=null
              ?
          Column(
            children: [
              Container(
              width: double.infinity,
              color: Color(0xffE5E7EB),
              child: Padding(
                padding: EdgeInsets.all(8) ,
                child:
                Text(' job saved'),
              ),
            ),
                  ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: savedController.showSavedJobs.data!.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.all(0.03 * w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                    15,
                                  ),
                                  child: Image.network(
                                    savedController.showSavedJobs.data![index].jobs!.image!,
                                    width: 0.15 * w,
                                  )),
                              Padding(
                                padding:  EdgeInsets.only(left: 0.03* w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      savedController.showSavedJobs.data![index].jobs!.name!,
                                      style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),
                                    ),
                                    Text(
                                      '${ savedController.showSavedJobs.data![index].jobs!.compName!} •${ savedController.showSavedJobs.data![index].jobs!.location?.split(',')[ savedController.showSavedJobs.data![index].jobs!.location!.split(',').length - 2]} , ${ savedController.showSavedJobs.data![index].jobs!.location?.split(',').last}',
                                      style: TextStyle(fontWeight: FontWeight.w300),
                                    ),
                                  ],
                                ),
                              ),
          
          
                            ],
                          ),
                          IconButton(onPressed: (){

                            Get.bottomSheet(Container(
                              width: double.infinity,
                              height: 0.35*h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20),),
                                color: Colors.white,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  buttonSheetField(text:'Apply Job',icon: Icons.shopping_bag_outlined ),
                                  buttonSheetField(text:'Share via...',icon: Icons.ios_share ),
                                  InkWell(
                                    onTap: () async {
                                      await ssjc.delFavJob(id:  savedController.showSavedJobs.data![index].id.toString(),jobId:savedController.showSavedJobs.data![index].jobId.toString());
                                     // await ssjc.getSavedJob();
                                      Get.back();
                                    },
                                    child: buttonSheetField(text:'Cancel save',icon: Icons.highlight_remove_rounded ),
                                  )
                                ],
                              ),
                            )
                            );
                          }, icon: Icon(Icons.more_horiz_outlined))
                        ],
                      ),
                      SizedBox(height: 0.02 *h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Posted 2 days ago'),
                          Text('Be an early applicant'),
                        ],
                      ),
                      SizedBox(height: 0.02 *h,),
                      Divider(
                        height: 1,
                      )
          
                    ],
                  ),
                ),
              ),
          
            ],
          ) :
          Column(
            children: [
              SizedBox(height: 0.25 *h,),
              Image.asset(Assets.randomPicsNoSavedJobs),
              SizedBox(height: 0.03 *h,),
              Text('Nothing has been saved yet',style: TextStyle(fontSize: 24 , fontWeight: FontWeight.w500),),
              SizedBox(height: 0.01 *h,),
              Text('Press the star icon on the job you want to save.',style: TextStyle(fontSize: 16 , fontWeight: FontWeight.w300),)

            ],
          ),



                      ],
                    )

          ),
        ),
      ),
    );
  }
}