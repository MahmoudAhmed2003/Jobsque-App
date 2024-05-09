import 'package:final_project_ii/root/routs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../API_helper/getUserPortfolioApi.dart';
import '../model/getUserPortfolioModel.dart';

class ProfileScreenController extends GetxController{
  GetUserPortfolio gus = GetUserPortfolio();
  GetPortofoliosModel gusData =GetPortofoliosModel();
  bool isLoading = false;

  List<Map<String,dynamic>> generalSettings=[
    {
      'title': 'Edit Profile',
      'icon': Icons.person_outlined,
    },
    {'title': 'Portfolio',
      'icon': Icons.drive_folder_upload
    },
    {'title': 'Language',
      'icon': Icons.language
    },
    {'title': 'Notification',
      'icon': Icons.notifications_none_outlined
    },
    {'title': 'Login and security',
      'icon': Icons.lock_person_outlined
    },
    {
      'title':'Complete Profile',
      'icon': Icons.person_add_alt_1_outlined
    }
  ];
  List otherSettings=[
    'Accessibility',
    'Help Center',
    'Terms & Conditions',
    'Privacy Policy',
  ];

  void onclickGotoPAge({required String title}){
    title=='Edit Profile'      ? Get.toNamed(myRoutes.editProfile):
    title=='Portfolio'         ? Get.toNamed(myRoutes.uploadPortfolio):
    title=='Language'          ? Get.offAndToNamed(myRoutes.editLanguage):
    title=='Notification'      ? Get.toNamed(myRoutes.editNotificationScreen):
    title=='Login and security'? Get.toNamed(myRoutes.loginAndSecurityScreen):
    title=='Complete Profile'  ? Get.toNamed(myRoutes.completeProfileScreen):
    title== 'Accessibility'    ? null:
    title=='Help Center'       ? Get.toNamed(myRoutes.helpCenterScreen):
    title=='Terms & Conditions'? Get.toNamed(myRoutes.termsAndConditionsScreen):
    title=='Privacy Policy'    ? Get.toNamed(myRoutes.privacyPolicyScreen):
    null ;
  }

  Future<void> getPortfolio()async {
    isLoading = true;
    gusData=await gus.getPortfolio();
    isLoading = false;
    update();

  }
}