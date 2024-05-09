import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/resetPassController.dart';


class resetPassTextField extends StatelessWidget {
  final String hintText;
  final String type;
  final IconData iconName;
  final TextEditingController controllerName;
  resetPassController txtController = Get.put(resetPassController());



  resetPassTextField({
    super.key,
    required this.hintText,
    required this.type,
    required this.iconName,
    required this.controllerName,
  });
  Color  borderColor = Colors.grey;

  @override
  Widget build(BuildContext context) {


    return TextField(


      // controller: type == 'password' ?txtController.control: controllerName,
      controller : controllerName,



      onChanged: (value) {
        if(type == 'password')
        {
          txtController.control=controllerName;
          txtController.changeColor();
          borderColor = txtController.borderColor;
        }
      },

      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Color(0xff9CA3AF), fontSize: 14),
        prefixIcon: IconButton(
          icon: Icon(iconName),
          onPressed: () {},
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 2, color: Color(0xffD1D5DB)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:  BorderSide(width: 2, color: txtController.borderColor ),
          //0xff3366FF
        ),

        suffixIcon: type == 'password'
            ?hintText=="New password"?
        InkWell(
          onTap: () {

            txtController.toggleVisibility();
          },
          child: txtController.isPasswordVisible
              ? const Icon(Icons.visibility_off_outlined)
              : const Icon(Icons.visibility_outlined),
        )
            : InkWell(
          onTap: () {

            txtController.toggleVisibility2();
          },
          child: txtController.isPasswordVisible2
              ? const Icon(Icons.visibility_off_outlined)
              : const Icon(Icons.visibility_outlined),
        ) : null

      ),
      obscureText: type == 'password' ?hintText=="New password"? txtController.isPasswordVisible :
      txtController.isPasswordVisible2 : false,
      keyboardType:
      type == 'email' ? TextInputType.emailAddress : TextInputType.text,


    );
  }
}
