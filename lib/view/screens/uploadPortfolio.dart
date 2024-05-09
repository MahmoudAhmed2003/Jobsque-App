import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/profileScreenController.dart';
import '../../controller/uploadPortfolioController.dart';
import '../../generated/assets.dart';

class UploadPortfolio extends StatelessWidget {
  const UploadPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    UploadPortfolioController controller= Get.put(UploadPortfolioController());
    ProfileScreenController profController = Get.put<ProfileScreenController>(ProfileScreenController());

    final w= Get.width;
    final h= Get.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Portfolio',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: IconButton(onPressed: (){},icon: Icon(Icons.arrow_back),),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 20,right: 20,top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
          
                Text('Add portfolio here',style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),),
                DottedBorder(
                  color: Color(0xF71754EF).withOpacity(0.5),
                  strokeWidth: 3,
                  dashPattern: [5, 5],
                  strokeCap: StrokeCap.butt,
                  borderType: BorderType.RRect,
                  radius: Radius.circular(10),
                  child: Container(
                    color: Color(0xCA7096F5).withOpacity(0.2),
                    width: double.infinity,
                    height:h*0.27,
                    child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundColor: Color(0xA9AFE2F6),
                              child: Icon(
                                Icons.file_upload_outlined,
                                size: 50,
                                color:Color(0xF71754EF),
          
                              ),
                            ),
                            Text(
                               'Upload your other file',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight:
                                    FontWeight.w500)),
                            SizedBox(
                              height: 10,
                            ),
                            Text( 'Max size 10MB',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                    fontWeight:
                                    FontWeight.w400)),
                           GetBuilder<UploadPortfolioController>(
                             builder:(controller)=>  InkWell(
                               onTap: () async {
                                 await controller.uploadFile();
                                 await profController.getPortfolio();
                                 profController.update();
                               },
                               child: Container(
                                 decoration: BoxDecoration(
                                   border: Border.all(color: Color(0xF71754EF)),
                                   borderRadius: BorderRadius.circular(50),
                                 ),
                                 width: w*0.6,
                                 height: 40,
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     Icon(Icons.upload_file_outlined,color: Color(0xF71754EF),),
                                     SizedBox(width: 10,),
                                     Text( controller.isLoading? 'Uploading...':
                                         'Add File',
                                         style: TextStyle(
                                             fontSize: 16,
                                             color: controller.isLoading? Colors.grey :Color(0xF71754EF),
                                             fontWeight: FontWeight.w400)),
                                   ],
                                 ),
                               ),
                             ),
                            ),
          
                            SizedBox(),
                          ],
                        )
                    ),
                  ),
                ),
                GetBuilder<ProfileScreenController>(
                  builder: (controller) {
                    return ListView.builder(
                      itemCount: profController.gusData.data!.portfolio!.length,
                      shrinkWrap: true,
                      itemBuilder: (context,index)=> Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[400]!),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      Assets.randomPicsPdfLogo,
                                      width: 35,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                            profController.gusData.data!.portfolio![index].cvFile!,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight:
                                                FontWeight.w500)),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                                '300KB',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight:
                                                FontWeight.w400)),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {

                                        },
                                        icon: Icon(
                                          Icons.edit_note_outlined,
                                          color: Colors.blue,
                                          size: 30,
                                        )),
                                    IconButton(
                                        onPressed: () {

                                        },
                                        icon: Icon(
                                          Icons
                                              .highlight_remove_outlined,
                                          color: Colors.red,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
