import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/resetPassController.dart';
import '../../generated/assets.dart';
import '../widgets/resetPassBase.dart';
import '/root/routs.dart';

class ResetPass extends StatelessWidget {
  ResetPass({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();

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
                                'Reset Password',
                                style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff111827)),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Enter the email address you used when you joined and we’ll send you instructions to reset your password.',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff6B7280)),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              resetPassTextField(
                                hintText: 'Enter your email....',
                                type: 'email',
                                iconName: Icons.email_outlined,
                                controllerName: emailController,
                                // obscure: false
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'You remember your password',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff9CA3AF),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Get.toNamed(myRoutes.login);
                                    },
                                    child: const Text(
                                      'Login',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff3366FF),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                    Get.toNamed(myRoutes.resetPass2);
                                  // CreateAccountMoudel.nameTxt = nameController.text;
                                  // CreateAccountMoudel.emailTxt = emailController.text;
                                  // CreateAccountMoudel.passwordTxt = passwordController.text;
                                  // controller.registerApi(
                                  //     name: nameController.text.toString(),
                                  //     email: nameController.text.toString(),
                                  //     password: nameController.text.toString());
                                },
                                style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(320, 50),
                                  backgroundColor: const Color(0xff3366FF),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                ),
                                child: const Text(
                                  'Request password reset',
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
