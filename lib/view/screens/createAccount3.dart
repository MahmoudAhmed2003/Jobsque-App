import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../controller/createAccount3Controller.dart';
import '../../model/createAccountModel.dart';
import '../widgets/createAccountBase.dart';
import '/root/routs.dart';

class CreateAccount3 extends StatelessWidget {
CreateAccount3Controller controller = Get.put(CreateAccount3Controller());

  final w = Get.width;
  final h = Get.height;
  bool isWorkFromOffice = false;

  CreateAccount3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Text(
                      "Where are you prefefred Location?",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff111827)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Let us know, where is the work location you want at this time, so we can adjust it.",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff737379)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ToggleSwitch(
                      minWidth: w * 0.4,
                      cornerRadius: 20.0,
                      activeBgColors: [
                        [Color(0xff3366FF)],
                        [Color(0xff091A7A)]
                      ],
                      activeFgColor: Colors.white,
                      inactiveBgColor: Color(0xffF4F4F5),
                      inactiveFgColor: Color(0xff6B7280),
                      initialLabelIndex: 1,
                      totalSwitches: 2,
                      labels: ['Work From Office', 'Remote Work'],
                      radiusStyle: true,
                      onToggle: (index) {
                        isWorkFromOffice = !isWorkFromOffice;
                        controller.update();
                      },
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    GetBuilder<CreateAccount3Controller>(
                      // init: CreateAccount3Controller(),
                      builder: (controller) =>  !isWorkFromOffice
                          ? Column(
                        children: [
                          Text('Select the country you want for your job'),
                           const SizedBox(
                              height: 20,
                            ),
                          Wrap(
                            spacing: 12.0, // gap between adjacent chips
                            runSpacing: 12.0, // gap between lines
                            children: [
                              for(int i=0;i<CreateAccountMoudel.countries.length;i++)
                                FilterChip(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: CreateAccountMoudel.isFlagCliced[i] == true
                                            ? Color(0xff3366FF)
                                            : Color(0xffF4F4F5),
                                        width: 1),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  backgroundColor: CreateAccountMoudel.isFlagCliced[i] == true
                                      ? Color(0xffc3dbfa)
                                      : Color(0xfff8f8f8),
                                  label:
                                  Text(CreateAccountMoudel.countries[i]['title']! ,
                                    style: TextStyle(fontSize: 16),),
                                  avatar: Image.asset(
                                    CreateAccountMoudel.countries[i]['img']!,
                                      ),
                                  onSelected: (bool value) {
                                    controller.toggleColor(i);
                                },
                                )

                            ],
                          )
                        ],
                      )
                          : SizedBox(),

                    ),

],
                ),
                Container(
                  child: Column(
                    children: [
                      TextButton(
                        onPressed: () {
                          Get.toNamed(myRoutes.createAccount4);

                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(320, 50),
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
