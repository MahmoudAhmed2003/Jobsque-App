import 'package:final_project_ii/controller/profileScreenController.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../API_helper/editProfileApi.dart';
import '../generated/assets.dart';
import '../model/editProfileModel.dart';

class EditPersonalDetailsController extends GetxController{
  bool isloading = false;
  List<Map<String,String>>langList=[
    {
      'title':'English',
      'image':Assets.langUk,
    },
    {
      'title':'Arabic',
      'image':Assets.langKsa,
    },
    {
      'title':'French',
      'image':Assets.langFrancepng,
    },
    {
      'title':'Spanish',
      'image':Assets.langSpn,
    },
    {
      'title':'Deutsch',
      'image':Assets.langNetherlandspng,
    },
    {
      'title':'Italian',
      'image':Assets.langIty,
    },
    {
      'title':'Russian',
      'image':Assets.langRus,
    },
    {
      'title':'Chinese',
      'image':Assets.langChina,
    },
    {
      'title':'Japanese',
      'image':Assets.langJp,
    },
    {
      'title':'Korean',
      'image':Assets.langKor,
    },
    {
      'title':'Portuguese',
      'image':Assets.langPortuguese,
    },
  ];
  List <bool> isSelected =List.filled(11, false);


  var selectedLang='English';

  void setLang(value) {
    selectedLang = value;
    debugPrint('selectedLang: $selectedLang');
    update();
  }
  ProfileScreenController profController = Get.put<ProfileScreenController>(ProfileScreenController());

  EditProfileApi api = EditProfileApi();
  EditPortofolioModel epm = EditPortofolioModel();
  Future<EditPortofolioModel> editProfileSendData(
      {required String bio, required String address, required String mobile , required String edu , required String exp}) async {
    isloading = true;
    update();
    epm = await api.editProfileSendData(bio, address, mobile ,selectedLang, edu , exp);
    await profController.getPortfolio();
    isloading = false;
    update();
    return epm;
  }

}