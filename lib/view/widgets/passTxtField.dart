import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/phoneAndPasswordController.dart';

Widget passwordTextField({required controller, required name, required num}) {
  PhoneAndPasswordController getController = Get.find();
  return TextFormField(
    obscureText: num == 1
        ? getController.obscureText1
        : num == 2
        ? getController.obscureText2
        : getController.obscureText3,
    controller: controller,
    decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 1, color: Colors.black),
        ),
        prefixIcon: const Icon(Icons.lock),
        hintText: name,
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
            color: Color(0xff3366FF),
          ),
        )),
  );
}