import 'package:flutter/material.dart';
import 'package:get/get.dart';


class EmailAddressScreen extends StatelessWidget {
  const EmailAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),

        ),
        automaticallyImplyLeading: false,
        title: const Text(
          'Email address',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(0.05*width),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 0.03* height),
              const Text('Main e-mail address'),
              SizedBox(height: 0.01* height),
              TextFormField(decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email_outlined),
                  hintText: 'email',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: const BorderSide(width: 1))
              ),),
              SizedBox(height: 0.6 * height,),
              InkWell(
                  onTap: () => Get.back(),
                  child: Container(
                    width: 0.9 * width,
                    height: 0.07 * height,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50), color: Color(0xff3366FF)),
                    child: Center(
                      child: Text(
                        'Save',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
                      ),
                    ),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
