import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/completeProfileController.dart';
import '../../root/routs.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';





class CompleteProfileScreen extends StatelessWidget {
  CompleteProfileScreen({super.key});
  CompleteProfileController controller = Get.put(CompleteProfileController());

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        automaticallyImplyLeading: false,
        title: const Text(
          'Complete Profile',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(0.04 * width),
          child: GetBuilder<CompleteProfileController>(builder: (controller) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: CircularPercentIndicator(
                      radius: 0.20 * width,
                      lineWidth: 0.03 * width,
                      backgroundColor: const Color(0xffE5E7EB),
                      progressColor: const Color(0xff3366FF),
                      percent: controller.counter == 0
                          ? 0
                          : controller.counter == 1
                          ? 0.25
                          : controller.counter == 2
                          ? 0.5
                          : controller.counter == 3
                          ? 0.75
                          : 1,
                      center: Text(
                        controller.counter == 0
                            ? '0%'
                            : controller.counter == 1
                            ? '25%'
                            : controller.counter == 2
                            ? '50%'
                            : controller.counter == 3
                            ? '75%'
                            : '100%',
                        style: const TextStyle(
                            color: Color(0xff3366FF),
                            fontWeight: FontWeight.w500,
                            fontSize: 24),
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      animation: true,
                      animationDuration: 2000,
                    ),
                  ),
                  SizedBox(
                    height: 0.02 * height,
                  ),
                  Text(
                    ' ${controller.counter}/4 Completed',
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff3366FF)),
                  ),
                  SizedBox(height: 0.02 * height),
                  const Text(
                    'Complete your profile before applying for a job',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff6B7280)),
                  ),
                  SizedBox(height: 0.02 * height),
                  InkWell(
                    onTap: () {
                      Get.toNamed(myRoutes.editPersonalDetails);
                      if (controller.complete[0] == false) {
                        controller.changeComplete(index: 0);
                      }
                    },
                    child: box(
                        mainText: 'Personal Details',
                        text:
                        'Full name, email, phone number, and your address',
                        color: controller.complete[0] == false
                            ? const Color(0xffD1D5DB)
                            : const Color(0xff3366FF),
                        backColor: controller.complete[0] == true
                            ? const Color(0xffE0EBFF)
                            : Colors.white),
                  ),
                  Container(
                      height: 0.02 * height,
                      width: 1,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: controller.complete[0] == false
                              ? const Color(0xffD1D5DB)
                              : const Color(0xff3366FF),
                        ),
                      )),
                  InkWell(
                    onTap: () {
                      Get.toNamed(myRoutes.educationScreen);
                      //         if (controller.complete[1] == false) {
                      //         controller.changeComplete(index: 1);
                      //         }
                    },
                    child: box(
                        mainText: 'Education',
                        text:
                        'Enter your educational history to be considered by the recruiter',
                        color: controller.complete[1] == false
                            ? const Color(0xffD1D5DB)
                            : const Color(0xff3366FF),
                        backColor: controller.complete[1] == true
                            ? const Color(0xffE0EBFF)
                            : Colors.white),
                  ),
                  Container(
                      height: 0.02 * height,
                      width: 1,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: controller.complete[1] == false
                              ? const Color(0xffD1D5DB)
                              : const Color(0xff3366FF),
                        ),
                      )),
                  InkWell(
                    onTap: () {
                      Get.toNamed(myRoutes.experienceScreen);
                      if (controller.complete[2] == false) {
                        controller.changeComplete(index: 2);
                      }
                    },
                    child: box(
                        mainText: 'Experience',
                        text:
                        'Enter your work experience to be considered by the recruiter',
                        color: controller.complete[2] == false
                            ? const Color(0xffD1D5DB)
                            : const Color(0xff3366FF),
                        backColor: controller.complete[2] == true
                            ? const Color(0xffE0EBFF)
                            : Colors.white),
                  ),
                  Container(
                      height: 0.02 * height,
                      width: 1,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: controller.complete[2] == false
                              ? const Color(0xffD1D5DB)
                              : const Color(0xff3366FF),
                        ),
                      )),
                  InkWell(
                    onTap: () {
                      if (controller.complete[3] == false) {
                        controller.changeComplete(index: 3);
                      }
                      Get.toNamed(myRoutes.editUploadPortfolio);
                    },
                    child: box(
                        mainText: 'Portfolio',
                        text:
                        'Create your portfolio. Applying for various types of jobs is easier.r',
                        color: controller.complete[3] == false
                            ? const Color(0xffD1D5DB)
                            : const Color(0xff3366FF),
                        backColor: controller.complete[3] == true
                            ? const Color(0xffE0EBFF)
                            : Colors.white),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}

Widget box(
    {required color, required text, required mainText, required backColor}) {
  double width = Get.width;
  double height = Get.height;
  return Column(
    children: [
      Container(
        height: 0.11 * height,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: color,
          ),
          color: backColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Row(
                children: [
                  CircleAvatar(
                      radius: 0.04 * width,
                      backgroundColor: color,
                      child: const Icon(
                        Icons.done,
                        color: Colors.white,
                      )),
                  SizedBox(width: 0.03 * width),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        mainText,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 16),
                      ),
                      SizedBox(height: 0.01 * height),
                      SizedBox(
                          width: 0.65 * width,
                          child: Text(
                            text,
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400),
                          ))
                    ],
                  )
                ],
              ),
              const Icon(
                Icons.arrow_forward_sharp,
                color: Colors.black,
              )
            ],
          ),
        ),
      ),
    ],
  );
}
