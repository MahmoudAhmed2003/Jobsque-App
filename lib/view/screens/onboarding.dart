import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../controller/OnboardingController.dart';
import '../../generated/assets.dart';
import '../../model/onboardinModle.dart';
import '../widgets/onboardingBase.dart';
import '/root/routs.dart';
import '/root/colors.dart';


class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  OnboardingPage(data: OnboardingModule.onboardingData);

  }
}

class OnboardingPage extends StatelessWidget {

  final CarouselController buttonCarouselController = CarouselController();
  final List<Map<String, String>> data;
  OnboardingPage({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    final h = Get.height;
    final w = Get.width;
    OnboardingController controller = Get.put(OnboardingController());


    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: h * 0.8,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    child: CarouselSlider.builder(
                      carouselController: buttonCarouselController,
                      itemCount: data.length,
                      itemBuilder: (BuildContext context,
                          int itemIndex,
                          int pageViewIndex) =>
                          Container(
                            child: Column(
                              children: [
                                OnboardingItem(data: data[itemIndex]),
                              ],
                            ),
                          ),
                      options: CarouselOptions(
                        height: double.infinity,
                        initialPage: 0,
                        autoPlay: false,
                        enlargeCenterPage: true,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: false,
                        viewportFraction: 1.0,
                        onPageChanged: (pageNum, reason) {
                          controller.setCurrentPage(pageNum);
                        },
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(Assets.splashLogo,

                            height: 19,
                          ),
                          TextButton(
                            onPressed: () => {
                              GetStorage().write('onboarding', true),
                              GetStorage().read('token')==null?
                              Get.toNamed(myRoutes.login)
                                  :Get.toNamed(myRoutes.homeScreen)
                            },
                            child:  Text(
                                'Skip',
                                style: TextStyle(
                                  fontSize: 16, color: myColors.primary,
                                )
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GetBuilder<OnboardingController>(
              builder:(controller)=>
            Container(
              child: DotsIndicator(
                dotsCount: data.length,
                position: controller.currentPage,
                decorator: const DotsDecorator(
                  color: Colors.grey,
                  activeColor: Colors.blue,
                  size: Size(8, 8),
                  activeSize: Size(10, 10),
                ),
              ),
            ),
            ),
            const SizedBox(height: 20.0),
            Container(
              child:GetBuilder<OnboardingController>(
                init: OnboardingController(),
                builder:(controller)=> ElevatedButton(
                onPressed: () {

                  if (controller.currentPage == data.length - 1) {
                    GetStorage().write('onboarding', true);
                    GetStorage().read('token')==null?
                    Get.toNamed(myRoutes.createAccount)
                        :Get.toNamed(myRoutes.homeScreen);



                  } else {
                    buttonCarouselController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linear);
                    // buttonCarouselController.nextPage();
                    controller
                        .setCurrentPage(controller.currentPage + 1);
                  }
                  log("Current Page: ${controller.currentPage}");
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(320, 50),
                  backgroundColor: const Color(0xff3366FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child:

                controller.currentPage == data.length - 1
                    ? const Text(
                  'Get Started',
                  style: TextStyle(fontSize: 16 , color: Colors.white),
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
    );
  }
}
