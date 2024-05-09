import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../generated/assets.dart';
import '/root/routs.dart';


class ResetPass2 extends StatelessWidget {
  const ResetPass2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final w = Get.width;
    final h = Get.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Column(
                    children: [
                      SizedBox(
                        height: h * 0.15,),
                      Image.asset(
                        Assets.resetPassEmailLlustration,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Check your Email',
                        style: TextStyle(
                            fontSize: 24,
                            color: Color(0xff111827),
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'We have sent a reset password to your email address',
                        textAlign: TextAlign.center,
                        style: TextStyle(

                            fontSize: 16,
                            color: Color(0xff6B7280),
                            fontWeight: FontWeight.w400),
                      ),


                    ],
                  ),

                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {

                                  Get.toNamed(myRoutes.resetPass3);

                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(320, 50),
                          backgroundColor: const Color(0xff3366FF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        child: const Text(
                          'Open email app',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: h * 0.03,)
                    ],
                  )

                ],
              )),
        ),
      ),
    );
  }
}