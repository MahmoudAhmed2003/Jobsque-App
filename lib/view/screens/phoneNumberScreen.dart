import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'package:get/get.dart';

import 'package:intl_phone_field/intl_phone_field.dart';

import '../../controller/phoneAndPasswordController.dart';



class PhoneNumberScreen extends StatelessWidget {
  const PhoneNumberScreen({super.key});



  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        leading: InkWell(
            onTap: () =>

                Get.back(),
            child: const Icon(Icons.arrow_back, color: Colors.black,)),
        automaticallyImplyLeading: false,
        title: const Text(
          'Phone number',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(0.05*width),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 0.03 * height,
              ),
              const Text(
                'Main phone number',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
              ),
              SizedBox(
                height: 0.01 * height,
              ),
              IntlPhoneField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(),
                  ),
                ),
                initialCountryCode: 'EG',
                onChanged: (phone) {

                },
              ),
              SizedBox(
                height: 0.01 * height,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  SizedBox(
                    width: 0.7 * width,
                    child: const Text(
                        'Use the phone number to reset your password'
                    ),
                  ),

            GetBuilder<PhoneAndPasswordController>(
            init: PhoneAndPasswordController(),
            builder: (logic) {
            return
            FlutterSwitch(
            width: 60,
            height: 30,
            toggleSize: 15,
            value: logic.isSwitched,
            borderRadius: 30.0,
            onToggle: (val) {
            logic.changeIsSwitched(val);
            },
            );
            }
            ),
                ],
              ),
              SizedBox(height: 0.53 * height,),
              InkWell(
                  onTap: () => Get.back(),
                  child: Container(
                    width: 0.9 * width,
                    height: 0.07 * height,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50), color: Color(0xff3366FF)),
                    child: Center(
                      child: Text(
                        'save',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
