import 'dart:async';

import 'package:final_project_ii/view/screens/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../generated/assets.dart';
import '../../root/routs.dart';

class SplashScreen extends StatelessWidget {
  void onInit() {
    Timer(Duration(seconds: 2),() {
        GetStorage().read('onboarding')==null?
       Get.offAllNamed(myRoutes.onboardingScreen):
            GetStorage().read('token')==null?
        Get.offAllNamed(myRoutes.login):
        Get.offAllNamed(myRoutes.homeScreen);
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    onInit();
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.splashBlur),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.splashLogo),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
