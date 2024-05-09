import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/phoneAndPasswordController.dart';
import '../widgets/passTxtField.dart';



class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});

  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final PhoneAndPasswordController passwordController =
  Get.put<PhoneAndPasswordController>(PhoneAndPasswordController());

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        automaticallyImplyLeading: false,
        title: const Text(
          'Change password',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(0.05 * width),
          child: GetBuilder<PhoneAndPasswordController>(
              init: PhoneAndPasswordController(),
              builder: (logic) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 0.02 * height,
                    ),
                    const Text(
                      'Enter your old password',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 0.01 * height,
                    ),
                    passwordTextField(
                        controller: oldPasswordController,
                        name: 'old password',
                        num: 1),
                    SizedBox(
                      height: 0.02 * height,
                    ),
                    const Text(
                      'Enter your new password',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 0.01 * height,
                    ),
                    passwordTextField(
                        controller: newPasswordController,
                        name: 'new password',
                        num: 2),
                    SizedBox(
                      height: 0.02 * height,
                    ),
                    const Text(
                      'confirm your new password',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 0.01 * height,
                    ),
                    passwordTextField(
                        controller: confirmPasswordController,
                        name: 'Confirm your new password',
                        num: 3),
                    SizedBox(
                      height: 0.35 * height,
                    ),
                    InkWell(
                        onTap: () async {
                          if (newPasswordController.text.length ==
                              confirmPasswordController.text.length &&
                              oldPasswordController.text.isNotEmpty &&
                              newPasswordController.text.isNotEmpty &&
                              confirmPasswordController.text.isNotEmpty) {
                            await passwordController
                                .changePaswword(newPasswordController.text);
                            Get.back();
                          }else {
                            Get.snackbar('wrong',
                                'the new and confirm  are not similar or There is an empty field ');
                          }
                        },
                        child:
                        Container(
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
                );
              }),
        ),
      ),
    );
  }
}

