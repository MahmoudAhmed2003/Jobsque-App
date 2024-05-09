import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

import '../../root/routs.dart';

class TowStepVerification3Screen extends StatelessWidget {
  const TowStepVerification3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:  AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        automaticallyImplyLeading: false,
        title: const Text(
          'Two-step verification',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(0.05 * width),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 0.03* height,),
              const Text(
                'Enter the 6 digit code',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
              SizedBox(
                height: 0.01 * height,
              ),
              const Text(
                'Please confirm your account by entering the authorization code sen to ****-****-7234',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Color(0xff6B7280)),
              ),
              SizedBox(
                height: 0.02 * height,
              ),
              OTPTextField(
                length: 6,
                width: double.infinity,
                fieldWidth: 0.12 *width,
                style: const TextStyle(
                    fontSize: 18
                ),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.box,
                onCompleted: (pin) {

                },
              ),
              SizedBox(
                height: 0.02 * height,
              ),
              Row(
                children: [
                  const Text('Resend code  ' ,style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff9CA3AF)

                  ),),
                  Countup(
                    begin: 60,
                    end: 0,
                    duration: const Duration(seconds: 60),
                    separator: ',',
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color:Color(0xff3366FF)

                    ),
                  ),
                  const Text('s',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Color(0xff3366FF)),),

                ],
              ),
              SizedBox(height: 0.5* height,),
              InkWell(
                  child:  Container(
                    width: 0.9 * width,
                    height: 0.07 * height,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50), color: Color(0xff3366FF)),
                    child: Center(
                      child: Text(
                        'Verfiy',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
                      ),
                    ),
                  ),
                onTap: () {
                  Get.toNamed(myRoutes.loginAndSecurityScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
