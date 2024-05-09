import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/createAccount2Controller.dart';
import '../../model/createAccountModel.dart';
import '../widgets/createAccountBase.dart';
import '/root/routs.dart';


class CreateAccount2 extends StatelessWidget {
  final w = Get.width;
  final h = Get.height;
   CreateAccount2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20 , top: 20),
          child: Container(

            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Text(
                      "What type of work are you interested in?",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff111827)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Tell us what you’re interested in so we can customise the app for your needs.",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff111827)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: h * 0.6,
                      child: GetBuilder<CreateAccount2Controller>(
                        init:CreateAccount2Controller(),
                        builder:(controller)=>GridView.builder(gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 30,
                          childAspectRatio: 1.2,
                        ),
                          itemCount: CreateAccountMoudel.inersets.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: (){
                                controller.toggleColor(index);

                              },
                              child: interstedCard(
                                  CreateAccountMoudel.inersets[index]['title']!,
                                  CreateAccountMoudel.inersets[index]['icon']!,
                                  CreateAccountMoudel.isInersetsCliced[index]
                              ),
                            );
                          },
                        ),
                      )
                    ),
                  ],
                ),
                Container(
                  child: Column(
                    children: [
                      TextButton(
                        onPressed: () {
                          Get.toNamed(myRoutes.createAccount3);

                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize:Size(320, 50),
                          backgroundColor: const Color(0xff3366FF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        child: const Text(
                          'Next',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
