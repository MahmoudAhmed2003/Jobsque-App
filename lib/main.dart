
import 'package:final_project_ii/view/screens/EditNotificationScreen.dart';
import 'package:final_project_ii/view/screens/HelpCenterScreen.dart';
import 'package:final_project_ii/view/screens/PrivacyPolicyScreen.dart';
import 'package:final_project_ii/view/screens/TermsAndConditionsScreen.dart';
import 'package:final_project_ii/view/screens/appliedJob.dart';
import 'package:final_project_ii/view/screens/changePasswordScreen.dart';
import 'package:final_project_ii/view/screens/completeProfileScreen.dart';
import 'package:final_project_ii/view/screens/editLanguage.dart';
import 'package:final_project_ii/view/screens/editUploadPortfolio.dart';
import 'package:final_project_ii/view/screens/editePersonalDetails.dart';
import 'package:final_project_ii/view/screens/educationScreen.dart';
import 'package:final_project_ii/view/screens/emailAddressScreen.dart';
import 'package:final_project_ii/view/screens/experienceScreen.dart';
import 'package:final_project_ii/view/screens/loginAndSecurityScreen.dart';
import 'package:final_project_ii/view/screens/messageScreen.dart';
import 'package:final_project_ii/view/screens/phoneNumberScreen.dart';
import 'package:final_project_ii/view/screens/reApplyJob.dart';
import 'package:final_project_ii/view/screens/showSavedJobScreen.dart';
import 'package:final_project_ii/view/screens/towStepVerification3Screen.dart';
import 'package:final_project_ii/view/screens/twoStepVerification.dart';
import 'package:final_project_ii/view/screens/twoStepVerification2.dart';
import 'package:final_project_ii/view/screens/uploadPortfolio.dart';
import 'package:final_project_ii/view/screens/chatScreen.dart';
import 'package:final_project_ii/view/screens/editeProfile.dart';
import 'package:final_project_ii/view/screens/jobApply.dart';
import 'package:final_project_ii/view/screens/jobApplyComplete.dart';
import 'package:final_project_ii/view/screens/profileScreen.dart';
import 'package:final_project_ii/view/screens/searchResult.dart';

import 'view/screens/createAccount.dart';
import 'view/screens/createAccount2.dart';
import 'view/screens/createAccount3.dart';
import 'view/screens/createAccount4.dart';
import 'view/screens/homeScreen.dart';
import 'view/screens/jobDetails.dart';
import 'view/screens/onboarding.dart';
import 'view/screens/login.dart';
import 'view/screens/resetPass2.dart';
import 'view/screens/resetPass3.dart';
import 'view/screens/resetPass4.dart';
import 'view/screens/resetPassword.dart';
import 'view/screens/search.dart';
import 'view/screens/splash.dart';
import 'view/screens/Notification.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'root/routs.dart';
import 'package:get/get.dart';

main() async {
 await  GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:myRoutes.splashScreen,


      getPages: [
        GetPage(name: myRoutes.splashScreen, page: () => SplashScreen()),
        GetPage(name: myRoutes.onboardingScreen, page: () => OnboardingScreen()),
        GetPage(name: myRoutes.createAccount, page: () =>  CreateAccount()),
        GetPage(name: myRoutes.createAccount2, page: () => CreateAccount2()),
        GetPage(name: myRoutes.createAccount3, page: () => CreateAccount3()),
        GetPage(name: myRoutes.createAccount4, page: () => CreateAccount4()),
        GetPage(name: myRoutes.login, page: () => Login()),
        GetPage(name: myRoutes.resetPass, page: () => ResetPass()),
        GetPage(name: myRoutes.resetPass2, page: () => ResetPass2()),
        GetPage(name: myRoutes.resetPass3, page: () => ResetPass3()),
        GetPage(name: myRoutes.resetPass4, page: () => const ResetPass4()),
        GetPage(name: myRoutes.homeScreen, page: () => HomeScreen()),
        GetPage(name :myRoutes.searchScreen, page: () => SearchScreen()),
        GetPage(name: myRoutes.jobDetails, page: () => JobDetails()),
        GetPage(name: myRoutes.searchResult, page: () => SearchResult()),
        GetPage(name: myRoutes.jobApply, page:()=> JobApply()),
        GetPage(name: myRoutes.jobApplyComplete, page:()=> JobApplyComplete()),
        GetPage(name: myRoutes.chatScreen, page: ()=> ChatScreen()),
         GetPage(name: myRoutes.notification, page: ()=>  NotificationScreen()),
        GetPage(name: myRoutes.profileScreen, page: ()=>ProfileScreen()),
        GetPage(name: myRoutes.editProfile, page: ()=>EditProfile()),
        GetPage(name: myRoutes.uploadPortfolio, page:()=> UploadPortfolio()),
        GetPage(name: myRoutes.editNotificationScreen, page:()=>EditNotificationScreen()),
        GetPage(name: myRoutes.editLanguage, page: ()=>EditLanguage()),
        GetPage(name: myRoutes.appliedJob, page:()=>AppliedJob()),
        GetPage(name: myRoutes.savedJobScreen, page:()=>SavedJobScreen()),
        GetPage(name: myRoutes.reApplyJob, page:()=>ReApplyJob()),
        GetPage(name: myRoutes.chatScreen, page: ()=>ChatScreen()),
        GetPage(name: myRoutes.messageScreen, page:()=>MessageScreen()),
        GetPage(name: myRoutes.completeProfileScreen, page:()=>CompleteProfileScreen()),
        GetPage(name: myRoutes.editPersonalDetails, page:()=>EditPersonalDetails()),
        GetPage(name: myRoutes.editUploadPortfolio, page:()=>EditUploadPortfolio()),
        GetPage(name: myRoutes.educationScreen, page:()=>EducationScreen()),
        GetPage(name: myRoutes.experienceScreen, page:()=>ExperienceScreen()),
        GetPage(name: myRoutes.loginAndSecurityScreen, page:()=>LoginAndSecurityScreen()),
        GetPage(name: myRoutes.emailAddressScreen, page:()=>EmailAddressScreen()),
        GetPage(name: myRoutes.twoStepVerification, page:()=>TwoStepVerification()),
        GetPage(name: myRoutes.towStepVerification2Screen, page:()=>TowStepVerification2Screen()),
        GetPage(name: myRoutes.towStepVerification3Screen, page:()=>TowStepVerification3Screen()),
        GetPage(name: myRoutes.helpCenterScreen, page:()=>HelpCenterScreen()),
        GetPage(name: myRoutes.termsAndConditionsScreen, page:()=>TermsAndConditionsScreen()),
        GetPage(name: myRoutes.privacyPolicyScreen, page:()=>PrivacyPolicyScreen()),
        GetPage(name: myRoutes.changePasswordScreen, page:()=>ChangePasswordScreen()),
        GetPage(name: myRoutes.phoneNumberScreen, page:()=>PhoneNumberScreen()),
      ],


    );
  }
}
