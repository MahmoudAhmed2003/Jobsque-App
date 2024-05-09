import 'package:final_project_ii/root/routs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../generated/assets.dart';

class CreateAccount4 extends StatelessWidget {
  final w = Get.width;
  final h = Get.height;

  CreateAccount4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Column(
                children: [
                  SizedBox(
                    height: h * 0.1,),
                  Image.asset(
                    Assets.createAccountSuccessAccount,
                    width: w * 0.5,
                    fit: BoxFit.fitWidth,
                  ),
                  const Text(
                    "Your account has been set up!",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff111827)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "We have customized feeds according to your preferences",
                    textAlign: TextAlign.center,
                    style: TextStyle(

                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff737379)),
                  ),
                ],
              ),
              Container(
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        Get.offAllNamed(myRoutes.homeScreen);
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(320, 50),
                        backgroundColor: const Color(0xff3366FF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: const Text(
                        'Get Started',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],),
        ),
      ),
    ));
  }
}
