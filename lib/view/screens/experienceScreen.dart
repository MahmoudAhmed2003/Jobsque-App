import 'package:final_project_ii/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/completeProfileController.dart';
import '../../controller/editPersonalDetailsController.dart';
import '../../controller/experienceController.dart';



class ExperienceScreen extends StatelessWidget {
  ExperienceScreen({super.key});

  TextEditingController positionController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController startYearController = TextEditingController();
  ExperienceController experienceController =Get.put<ExperienceController>(ExperienceController());
  CompleteProfileController completeProfileController= Get.put<CompleteProfileController>(CompleteProfileController());
  EditPersonalDetailsController editPersonalDetailsController = Get.put<EditPersonalDetailsController>(EditPersonalDetailsController());

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back),
        ),
        automaticallyImplyLeading: false,
        title: Text(
          'Experience',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(0.05 * width),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: Color(0xffD1D5DB))),
                  child: Padding(
                    padding: EdgeInsets.all(0.05 * width),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Position *',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff9CA3AF)),
                        ),
                        SizedBox(
                          height: 0.01 * height,
                        ),
                        TextFormField(
                          controller: positionController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      width: 1, color: Color(0xff9CA3AF)))),
                        ),
                        SizedBox(
                          height: 0.03 * height,
                        ),
                        Text(
                          'Title',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff9CA3AF)),
                        ),
                        SizedBox(
                          height: 0.01 * height,
                        ),
                        DropdownButtonFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(width: 1))),
                            items: [
                              DropdownMenuItem<String>(
                                  child: Text("Full Time")),
                            ],
                            onChanged: (v) {}),
                        SizedBox(
                          height: 0.03 * height,
                        ),
                        Text(
                          'Company name *',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff9CA3AF)),
                        ),
                        SizedBox(
                          height: 0.01 * height,
                        ),
                        TextFormField(
                          controller: companyNameController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      width: 1, color: Color(0xff9CA3AF)))),
                        ),
                        SizedBox(
                          height: 0.03 * height,
                        ),
                        Text(
                          'Location',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff9CA3AF)),
                        ),
                        SizedBox(
                          height: 0.01 * height,
                        ),
                        TextFormField(
                          controller: locationController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(

                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    width: 1, color: Color(0xff9CA3AF)),),
                              prefixIcon: Icon(Icons.location_pin)),
                        ),
                        SizedBox(
                          height: 0.01 * height,
                        ), GetBuilder<ExperienceController>(builder: (logic) {
                          return Row(children: [
                            Checkbox(value: logic.checkbox, onChanged: (v){logic.changeCheck(v);}),
                            SizedBox(width: 0.01*width,),
                            Text('I am currently working in this role'),
                          ],);
                        }),
                        SizedBox(
                          height: 0.03 * height,
                        ),
                        Text(
                          'Start Year *',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff9CA3AF)),
                        ),
                        SizedBox(
                          height: 0.01 * height,
                        ),
                        TextFormField(
                          controller: startYearController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      width: 1, color: Color(0xff9CA3AF)))),
                        ),
                        SizedBox(
                          height: 0.03 * height,
                        ),
                        InkWell(
                          onTap: ()async {
                            if (completeProfileController.complete[1] == false) {
                              completeProfileController.changeComplete(index: 1);
                            }
                            await  editPersonalDetailsController.editProfileSendData(bio: '', address: '', mobile: '', edu: '',exp:companyNameController.text);
                          },

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
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 0.03 *height,),
                Container(
                  height: 0.12 * height,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: const Color(0xffD1D5DB))),
                  child:  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [

                        Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: 0.15, color: const Color(0xffD1D5DB))),
                            child: Image.asset(
                              Assets.randomPicsExperienceLogo,
                              width: 0.15 * width,

                            )),
                        SizedBox(width: 0.01*width),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Senior UI/UX Designer',style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                            SizedBox(height: 0.01*height,),
                            Text('Remote • GrowUp Studio',style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: Color(0xff6B7280))),
                            SizedBox(height: 0.01*height,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                    width: 0.6 *width,
                                    child: Text('2019 - 2022',style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: Color(0xff6B7280)))),
                                const Icon(Icons.edit,color: Color(0xff3366FF),)
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
