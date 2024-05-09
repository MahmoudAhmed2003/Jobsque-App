
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../controller/loginController.dart';
import '../../generated/assets.dart';
import '../widgets/loginBase.dart';
import '/root/routs.dart';


  class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();



  @override
  Widget build(BuildContext context) {


    final w = Get.width;
    final h = Get.height;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading:SizedBox(),

          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Image.asset(Assets.splashLogo, height: 19),
            ),
          ],
        ),
        body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff111827)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Please login to find your dream job',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff6B7280)),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                           loginTextField(
                          hintText: 'email',
                          type: 'email',
                          iconName: Icons.email_outlined,
                          controllerName: emailController,
                          // obscure: false
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        GetBuilder<LoginController>(
                            builder: (controller) {
                              return
                                loginTextField(
                                  hintText: 'password',
                                  type: 'password',
                                  iconName: Icons.lock_outline,
                                  controllerName: passwordController,
                                  // obscure: controller.isPasswordVisible
                                );
                            }),

                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                             child: Row(
                                children: [

                                  GetBuilder<LoginController>(
                                      builder: (controller) {
                                        return  Checkbox(
                                          checkColor: Colors.white,
                                          fillColor: MaterialStateProperty.all(controller.isChecked? Color(0xff3366FF):Colors.white),
                                          value: controller.isChecked,
                                          onChanged: (bool? value) {
                                            controller.isChecked = value!;
                                            controller.update();
                                          },

                                        );
                                      }),
                                  const Text(
                                    'Remember me',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff6B7280),
                                    ),
                                  ),

                                ],
                              ),
                            ),





                            TextButton(
                              onPressed: () {
                                Get.toNamed(myRoutes.resetPass);
                              },
                              child: const Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff3366FF),
                                ),
                              ),
                            ),
                          ],
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
                                  'Dont’t have an account?',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff9CA3AF),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.toNamed(myRoutes.createAccount);
                                  },
                                  child: const Text(
                                    'Register',
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
                            GetBuilder<LoginController>(
                                builder:(controller){
                                  return ElevatedButton(
                                    onPressed: () async{
                                    await  controller.loginApi(
                                          email: emailController.text,
                                          password: passwordController.text
                                      );
                                    GetStorage().read('token')!=null?
                                    Get.offAllNamed(myRoutes.homeScreen):
                                    Get.showSnackbar(
                                      const GetSnackBar(
                                        title: 'Something went wrong',
                                        message:'Try Again Later',
                                        duration: Duration(seconds: 2),
                                        backgroundColor: Color(0xffff3358),
                                      ),
                                    );

                                  !controller.isChecked?
                                  GetStorage().remove('token'):null;
                                    },
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: const Size(320, 50),
                                      backgroundColor: controller.btnColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30.0),
                                      ),
                                    ),
                                    child: const Text(
                                      'Login',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  );
                                }
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 1,
                                  width: w*0.15,
                                  color: const Color(0xff9CA3AF),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                const Text(
                                  'Or Login With Account',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff9CA3AF),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  height: 1,
                                  width: w*0.15,
                                  color: const Color(0xff9CA3AF),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                InkWell(
                                  onTap: (){},
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: const Color(0xffD1D5DB),
                                      ),
                                    ),
                                    width: 150,
                                    height: 60,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 25,
                                          child: Image.asset(
                                            Assets.createAccountGoogle,
                                            fit: BoxFit.cover,                                   ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        const Text(
                                          'Google',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff6B7280),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                const SizedBox(
                                  width: 20,
                                ),

                                InkWell(
                                  onTap: () {},
                                  child:Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: const Color(0xffD1D5DB),
                                      ),
                                    ),
                                    width: 150,
                                    height: 60,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 25,
                                          child: Image.asset(
                                            Assets.createAccountFacebook,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Text(
                                          'Facebook',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff6B7280),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ])),
                ],
              ),
            )));
  }
}


