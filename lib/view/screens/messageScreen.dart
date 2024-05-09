
import 'package:final_project_ii/root/routs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



import '../../controller/chattController.dart';
import '../../generated/assets.dart';

class MessageScreen extends StatelessWidget {
  MessageScreen({super.key});


  final MessageController messageController =
  Get.put<MessageController>(MessageController());

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        leading:  IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back,color: Colors.black,)),
        automaticallyImplyLeading: false,
        title: const Text(
          'Messsages',
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
        currentIndex: 1,
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
          index == 0 ? Get.toNamed(myRoutes.homeScreen) :
          index==2 ? Get.toNamed(myRoutes.appliedJob) :
          index == 3 ? Get.toNamed(myRoutes.savedJobScreen) :
          index == 4 ? Get.toNamed(myRoutes.profileScreen) :null;
        },
      ),
      body: SafeArea(
        child: Column(
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 0.7 * width,
                  height: 0.07 * height,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Search messages....',
                    ),
                  ),
                ),
                SizedBox(width: 0.02 * width),
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 1, color: const Color(0xffD1D5DB))),
                  child: IconButton(
                    onPressed: () {
                      Get.bottomSheet(Container(
                        height: 0.4*height,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20),),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding:  EdgeInsets.all(0.05* width),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Message filters',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
                              SizedBox(height: 0.02 * height,),
                              InkWell(
                                onTap: () {
                                  messageController.changeUnRead(!messageController.unRead);
                                  Get.back();
                                } ,
                                child: Container(
                                  width: 0.9* width,
                                  height: 0.06 *height,

                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1,color: Colors.black),
                                    borderRadius: BorderRadius.circular(50),

                                  ),
                                  child: Padding(
                                    padding:  EdgeInsets.only(right: 0.04 * width,left: 0.04 * width),
                                    child: const Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [


                                            Text('Unread',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),)

                                          ],
                                        ),
                                        Icon(Icons.arrow_forward_ios_rounded)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 0.02 * height,),
                              InkWell(
                                child: Container(
                                  width: 0.9* width,
                                  height: 0.06 *height,

                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1,color: Colors.black),
                                    borderRadius: BorderRadius.circular(50),

                                  ),
                                  child: Padding(
                                    padding:  EdgeInsets.only(right: 0.04 * width,left: 0.04 * width),
                                    child: const Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [


                                            Text('Spam',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),)

                                          ],
                                        ),
                                        Icon(Icons.arrow_forward_ios_rounded)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 0.02 *height,),
                              InkWell(
                                child: Container(
                                  width: 0.9* width,
                                  height: 0.06 *height,

                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1,color: Colors.black),
                                    borderRadius: BorderRadius.circular(50),

                                  ),
                                  child: Padding(
                                    padding:  EdgeInsets.only(right: 0.04 * width,left: 0.04 * width),
                                    child: const Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [


                                            Text('Archived',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),)

                                          ],
                                        ),
                                        Icon(Icons.arrow_forward_ios_rounded)
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ));
                    },
                    icon: const Icon(Icons.tune),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 0.01 * height,
            ),
            messageController.message.isNotEmpty ?
            GetBuilder<MessageController>(
              builder: (controller) =>  Column(

                children: [controller.unRead  == true ? Container(
                  color: const Color(0xffE5E7EB),
                  width: double.infinity,
                  height: 0.04 *height,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Unread'),
                      InkWell(
                          onTap: () => controller.changeUnRead(!controller.unRead),
                          child: const Text('Read all messages',style: TextStyle(color: Color(0xff3366FF)),))
                    ],
                  ),
                ):Container(),
                  SizedBox(
                    height: 0.01 * height,
                  ),
                  controller.unRead  == false ?
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.message.length,
                    itemBuilder: (context, index) => Padding(
                      padding:  EdgeInsets.all(0.02*width),
                      child: InkWell(
                        onTap: () => Get.toNamed(myRoutes.chatScreen,arguments: {
                          'image': controller.message[index]['image'],
                          'name' :  controller.message[index]['name'],
                        }),
                        child: Row(
                          children: [
                            Stack(
                              children: [
                                Image.asset(
                                  controller.message[index]['image'],
                                  width: 0.15 * width,
                                ),
                                controller.message[index]
                                ['read'] ==
                                    false
                                    ?Container(
                                  width: 0.1*width,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white),
                                      shape: BoxShape.circle,
                                      color: const Color(0xff3366FF)
                                  ),
                                  child: const Center(child: Text('1',style: TextStyle(color: Colors.white),)),
                                ): Container()
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  constraints: BoxConstraints(maxWidth: 0.8 * width),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        controller.message[index]['name'],
                                        style: const TextStyle(
                                            fontSize: 16, fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        controller.message[index]['time'],
                                        style: TextStyle(
                                          color: controller.message[index]
                                          ['read'] ==
                                              false
                                              ? const Color(0xff3366FF)
                                              : const Color(0xff6B7280),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 0.005 *height,),
                                Text(controller.message[index]['Content'],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w300, fontSize: 12)),
                                SizedBox(height: 0.01 *height,),
                                SizedBox(
                                  width: 0.8 *width,
                                  child: const Divider(
                                    height: 1,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ): ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.message.length,
                    itemBuilder: (context, index) =>  controller.message[index]
                    ['read'] ==
                        false ?Padding(
                      padding:  EdgeInsets.all(0.02*width),
                      child: InkWell(
                        onTap: () => Get.toNamed(myRoutes.chatScreen,arguments: {
                          'image': controller.message[index]['image'],
                          'name' :  controller.message[index]['name'],
                        }),
                        child: Row(
                          children: [
                            Stack(
                              children: [
                                Image.asset(
                                  controller.message[index]['image'],
                                  width: 0.15 * width,
                                ),
                                controller.message[index]
                                ['read'] ==
                                    false
                                    ?Container(
                                  width: 0.1*width,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white),
                                      shape: BoxShape.circle,
                                      color: const Color(0xff3366FF)
                                  ),
                                  child: const Center(child: Text('1',style: TextStyle(color: Colors.white),)),
                                ): Container()
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  constraints: BoxConstraints(maxWidth: 0.8 * width),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        controller.message[index]['name'],
                                        style: const TextStyle(
                                            fontSize: 16, fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        controller.message[index]['time'],
                                        style: TextStyle(
                                          color: controller.message[index]
                                          ['read'] ==
                                              false
                                              ? const Color(0xff3366FF)
                                              : const Color(0xff6B7280),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 0.005 *height,),
                                Text(controller.message[index]['Content'],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w300, fontSize: 12)),
                                SizedBox(height: 0.01 *height,),
                                SizedBox(
                                  width: 0.8 *width,
                                  child: const Divider(
                                    height: 1,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ):Container(),
                  ),
                ],
              ),
            ):Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 0.2* height,),
                Image.asset(Assets.notificationSlackLogo),
                SizedBox(height: 0.03* height,),
                const SizedBox(

                    child: Text('You have not received any messages',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),)),
                SizedBox(height: 0.02* height,),
                SizedBox(
                  width: 0.95* width,
                  child: const Text('Once your application has reached the interview stage, you will get a message from the recruiter.',
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300),
                  ),
                )
              ],
            ),

            SizedBox(height: 0.02 *height,),
          ],
        ),
      ),
    );
  }
}
