import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../root/routs.dart';

class LoginAndSecurityScreen extends StatelessWidget {
  const LoginAndSecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
        automaticallyImplyLeading: false,
        title: const Text(
          'Login and security',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
            children: [
          Container(
            width: double.infinity,
            height: 0.03 * height,
            color: const Color(0xffE5E7EB),
            child: Padding(
              padding: EdgeInsets.only(left: 0.05 * width),
              child: Text(
                'Accont access',
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff6B7280)),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: (){Get.toNamed(myRoutes.emailAddressScreen);},child: textbot(text: 'Email address')
                ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: () => Get.toNamed(myRoutes.phoneNumberScreen),child: textbot(text: 'Phone number')
                ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: () => Get.toNamed(myRoutes.changePasswordScreen ), child:textbot(text: 'Change password')
                ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: () =>Get.toNamed(myRoutes.twoStepVerification) ,child: textbot(text: 'Two-step verification')
                ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(child: textbot(text: 'Face ID')),
          ),
        ]),
      ),
    );
  }
}

Widget textbot({required text}) {
  double width = Get.width;
  double height = Get.height;
  return Padding(
    padding: EdgeInsets.all(0.03 * width),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            ),
            const Icon(Icons.arrow_forward)
          ],
        ),
        SizedBox(
          height: 0.01 * height,
        ),
        const SizedBox(
          width: double.infinity,
          child: Divider(
            height: 1,
            color: Colors.black,
          ),
        )
      ],
    ),
  );
}
