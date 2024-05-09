import 'package:flutter/material.dart';

import '../generated/assets.dart';

class CreateAccountMoudel{

  static List<Map<String, dynamic>> inersets = [
    {
      'title': 'Designer',
      'icon': Icons.design_services_outlined,
    },
    {'title': 'Illustrator Designer',
      'icon': Icons.architecture_outlined},
    {'title': 'Developer',
      'icon': Icons.terminal},
    {'title': 'Management', 'icon': Icons.manage_accounts_outlined},
    {
      'title': 'IconInformation Technology',
      'icon': Icons.computer_outlined,
    },
    {
      'title': 'Research and Analytics',
      'icon': Icons.analytics_outlined,
    }
  ];
  static List isInersetsCliced = List.filled(inersets.length, false);

  static List<Map<String, String>> countries = [
    {
      "title": "Egypt",
      "img": Assets.flagsEg,
    },
    {
      "title": "United States",
      "img": Assets.flagsUsa,
    },
    {
      "title": "Saudi Arabia",
      "img": Assets.flagsKsa,
    },
    {
      "title": "Plastine",
      "img": Assets.flagsPlst,
    },
    {
      "title": "Argentina",
      "img": Assets.flagsArg,
    },
    {
      "title": "United Kingdom",
      "img": Assets.flagsUk,
    },
    {
      "title": "Spain",
      "img": Assets.flagsSpn,
    },
    {
      "title": "Italy",
      "img": Assets.flagsIty,
    },
    {
      "title": "Qatar",
      "img": Assets.flagsQtr,
    },
    {
      "title": "Japan",
      "img": Assets.flagsJp,
    },
    {
      "title": "Russia",
      "img": Assets.flagsRus,
    },
    {
      "title": "Canada",
      "img": Assets.flagsCnd,
    },
    {
      "title": "United Arab Emirates",
      "img": Assets.flagsUae,
    }
  ];
  static List isFlagCliced = List.filled(countries.length, false);





}