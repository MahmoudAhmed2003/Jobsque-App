import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/resetPassController.dart';
import '../../generated/assets.dart';
import '../widgets/resetPassBase.dart';
import '/root/routs.dart';

class ResetPass3 extends StatelessWidget {
  ResetPass3({Key? key}) : super(key: key);

  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final w = Get.width;
    final h = Get.height;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Color(0xff111827),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Image.asset(Assets.splashLogo, height: 19),
            ),
          ],
        ),
        body: SafeArea(
            child: Padding(
              padding:
              const EdgeInsets.only(left: 20, right: 20, top: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Create new password',
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff111827)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                              'Set your new password so you can login and acces Jobsque',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff6B7280)),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                       GetBuilder<resetPassController>(
                          builder: (controller) =>  resetPassTextField(
                            hintText: 'New password',
                            type: 'password',
                            iconName: Icons.lock,
                            controllerName: newPassword,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text('Password must be at least 8 characters' , style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff6B7280)),),
                        const SizedBox(
                          height: 20,
                        ),
                        GetBuilder<resetPassController>(
                          builder: (controller2) =>  resetPassTextField(
                            hintText: 'Confirm password',
                            type: 'password',
                            iconName: Icons.lock,
                            controllerName: confirmPassword,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Both password must match' , style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff6B7280)),),

                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Get.toNamed(myRoutes.resetPass4);

                              },
                              style: ElevatedButton.styleFrom(
                                fixedSize: const Size(320, 50),
                                backgroundColor: const Color(0xff3366FF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                              child: const Text(
                                'Reset password',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                          ])),
                ],
              ),
            ))



    );
  }
}
