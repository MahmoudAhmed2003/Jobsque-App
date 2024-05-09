import 'dart:ffi';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as p;

import '../API_helper/jobApplyApi.dart';
import '../model/jobApplyModel.dart';

class JobApplyController extends GetxController{
  bool isLoading=false;
  dynamic workType ='';
  List <bool> isSelected =List.filled(6, false);
  dynamic pickedFile;
  String? fileName;
  String? fileSize;
  dynamic pickedFile2;
  String? fileName2;
  String? fileSize2;
  int currentPage = 0;
  String jobId='';
  String name='';
  String email='';
  String mobile='';
  String userId='';



  void setTypeOfWork({required String type}) {
    workType = type;
    update();
  }

  List typeOfWorkList = [
    'Senior UX Designer',
    'Senior UI Designer',
    'Graphic Designer',
    'Front-End Developer'
  ];

  JopApplyModel ja = JopApplyModel();

  void setCurrentPage(int page) {
    currentPage = page;
    update();
  }
  void updateSelected(int index){
    isSelected[index] = !isSelected[index];
    isSelected.followedBy([false]);
   update();
 }

  Future<void> uploadCV() async {
     pickedFile = await FilePicker.platform.pickFiles();
    final fileEx =p.extension(pickedFile.files.single.path.toString());
   fileEx!='.pdf' ?
            Get.snackbar(
              'Error',
              'Please select a pdf file',
              snackPosition: SnackPosition.BOTTOM,
              colorText: Color(0xffffffff),
              backgroundColor: Color(0xffe10000),
            ): null;

     if (pickedFile != null) {
      File file = File(pickedFile.files.single.path.toString());
      debugPrint('file uploded successfully');
    } else {
      debugPrint('No file selected');
    }
      if(fileEx=='.pdf'){
         fileName = p.basename(pickedFile.files.single.path.toString());
         fileSize = (pickedFile.files.single.size/1024).toStringAsFixed(0) + " KB";
      }
      else{
        fileName = null;
        fileSize = null;
      }
      update();
 }

  Future<void> uploadOtherFile() async {
    pickedFile2 = await FilePicker.platform.pickFiles();
    final fileEx =p.extension(pickedFile2.files.single.path.toString());
    fileEx!='.pdf' ?
    Get.snackbar(
      'Error',
      'Please select a pdf file',
      snackPosition: SnackPosition.BOTTOM,
      colorText: Color(0xffffffff),
      backgroundColor: Color(0xffe10000),
    ): null;

    if (pickedFile2 != null) {
      File file = File(pickedFile2.files.single.path.toString());
      debugPrint('file uploded successfully');
    } else {
      debugPrint('No file selected');
    }
    if(fileEx=='.pdf'){
      fileName2 = p.basename(pickedFile2.files.single.path.toString());
      fileSize2 = (pickedFile2.files.single.size/1024).toStringAsFixed(0) + " KB";
    }
    else{
      fileName2 = null;
      fileSize2= null;
    }
    update();
  }

  Future<void> sendJobApplyApi() async {
    isLoading=true;
    update();
    ja=await JopApplyApi().jopApply(
      jobs_id: int.parse(jobId),
      cv_file: File(pickedFile.files.single.path),
      name: name,
      email: email,
      mobile: mobile,
      work_type: workType,
      other_file: File(pickedFile2.files.single.path),
      user_id: int.parse(userId),
    );
    isLoading=false;

  }







}