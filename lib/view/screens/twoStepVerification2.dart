
import 'package:final_project_ii/root/routs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../controller/phoneAndPasswordController.dart';


class TowStepVerification2Screen extends StatelessWidget {
  TowStepVerification2Screen({super.key});

  final TextEditingController passwordController = TextEditingController();
  final PhoneAndPasswordController getController = Get.put(PhoneAndPasswordController());

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,

      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
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
              SizedBox(
                height: 0.03 * height,
              ),
              const Text(
                'Add phone number',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
              SizedBox(
                height: 0.01 * height,
              ),
              const Text(
                'We will send a verification code to this number',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Color(0xff6B7280)),
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
              SizedBox(height: 0.01 * height,),
              const Text('Enter your password',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),),
              SizedBox(height: 0.01 * height,),
              GetBuilder<PhoneAndPasswordController>(
                  init: PhoneAndPasswordController(),
                  builder: (logic) =>
                      TextFormField(
                        obscureText: num == 1
                            ? getController.obscureText1
                            : num == 2
                            ? getController.obscureText2
                            : getController.obscureText3,
                        controller: passwordController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(width: 1, color: Colors.black),
                            ),
                            prefixIcon: const Icon(Icons.lock),
                            hintText: 'password',
                            suffixIcon: InkWell(
                              onTap: () {
                                {
                                  num == 1
                                      ? getController.changeObscureText1()
                                      : num == 2
                                      ? getController.changeObscureText2()
                                      : getController.changeObscureText3();
                                }
                              },
                              child: (num == 1
                                  ? getController.obscureText1
                                  : num == 2
                                  ? getController.obscureText2
                                  : getController.obscureText3)
                                  ? const Icon(
                                Icons.visibility_off_outlined,
                                color: Color(0xff3366FF),
                              )
                                  : const Icon(
                                Icons.visibility_outlined,
                                color:Color(0xff3366FF),
                              ),
                            )),
                      ),

                  ),
              SizedBox(
                height: 0.4 * height,
              ),
              InkWell(
                  onTap: ()  {
                    Get.toNamed(myRoutes.towStepVerification3Screen);
                  },
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
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
