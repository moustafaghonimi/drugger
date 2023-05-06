import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../service/services.dart';


class LocalController extends GetxController
{
  MyServices services=Get.find();
  late Locale local ;

  @override
  void onInit() {

    String? sharedPrefLang = services.sharedPreferences.getString('lang');
    if(sharedPrefLang=='ar')
    {
      local=const Locale('ar');
    }
    else if (sharedPrefLang =='en')
    {
      local=const Locale('en');
    }
    else
    {
      var deviceLanguage = Get.deviceLocale!.languageCode ;
      local=Locale(deviceLanguage);
    }

    super.onInit();
  }
}