import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';

import '../generated/assets.dart';

class ChatController extends GetxController {

  List chat = [
    "Hi Rafif!, I'm Melan the selection team from Twitter. Thank you for applying for a job at our company. We have announced that you are eligible for the interview stage.",
    "Hi Melan, thank you for considering me, this is good news for me.",
    "Can we have an interview via google meet call today at 3pm?",
    "Of course, I can!",
    "Ok, here I put the google meet link for later this afternoon. I ask for the timeliness, thank you! https://meet.google.com/dis-sxdu-ave"
  ];
}


class MessageController extends GetxController{
  bool unRead = false ;
  void changeUnRead(value){
    unRead = value;

    update();
  }
  List message = [
    {
      'name' : 'Twitter',
      'Content' : 'Here is the link: http://zoom.com/abcdeefg',
      'time' : '12.39',
      'read' : false,
      'image' : Assets.chatsTwitterLogo,
    },
    {
      'name' : 'Gojek Indonesia',
      'Content' : 'Let’s keep in touch.',
      'time' : '12.39',
      'read' : false,
      'image' : Assets.chatsGojekLogo,
    },{
      'name' : 'Shoope',
      'Content' : 'Thank You David!',
      'time' : '09.45',
      'read' : true,
      'image' : Assets.chatsShoopeLogo,
    },
    {
      'name' : 'Dana',
      'Content' : 'Thank you for your attention!',
      'time' : 'Yesterday',
      'read' : false,
      'image' : Assets.chatsDanaLogo,
    },
    {
      'name' : 'Slack',
      'Content' : 'You: I look forward to hearing from you',
      'time' : '12/8',
      'read' : true,
      'image' : Assets.chatsSlackLogo,
    },
    {
      'name' : 'Facebook',
      'Content' : 'You: What about the interview stage?',
      'time' : '12/8',
      'read' : true,
      'image' : Assets.chatsFacebookLogo,
    },
  ];
}