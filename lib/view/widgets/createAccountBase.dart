import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/createAccountController.dart';
import '../../generated/assets.dart';

Widget interstedCard(String title, IconData icon, bool isClicked) {
  final w = Get.width;
  final h = Get.height;
  return Container(
    width: w * 0.45,
    height: h * 0.2,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      border: Border.all(
          color: isClicked ? const Color(0xff3366FF) : Color(0xffD1D5DB),
          width: 2),
    ),
    child: Card(
      color: isClicked ? const Color(0xffc4d2fd) : Color(0xffFAFAFA),
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Color(0xffD1D5DB), width: 2),
              ),
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Color(0xffFAFAFA),
                child: Icon(
                  icon,
                  size: 40,
                  color:
                      isClicked ? const Color(0xff3366FF) : Color(0xff111827),
                ),
              ),
            ),
            Text(
              title,
              style: TextStyle(fontSize: 16, color: Color(0xff111827)),
            ),
          ],
        ),
      ),
    ),
  );
}

class createAccountTextField extends StatelessWidget {
  final String hintText;
  final String type;
  final IconData iconName;
  final TextEditingController controllerName;
  CreateAccountController txtController = Get.put(CreateAccountController());

  createAccountTextField({
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
            txtController.changeBtnColor();
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
            ? InkWell(
                onTap: () {
                  txtController.toggleVisibility();
                },
                child: txtController.isPasswordVisible
                    ? const Icon(Icons.visibility_outlined)
                    : const Icon(Icons.visibility_off_outlined),
              )
            : null,

      ),
      obscureText: type == 'password' ? !txtController.isPasswordVisible : false,
      keyboardType:
          type == 'email' ? TextInputType.emailAddress : TextInputType.text,


    );
  }
}
