import 'package:drugger/api/api_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../routing/app_routs_name.dart';
import '../service/services.dart';

class MyMiddleWare extends GetMiddleware
{

  MyServices myServices =Get.find();

  @override
  int get priority =>1;

  @override
  RouteSettings? redirect(String? route) {
    if(myServices.sharedPreferences.getString('token')!=null){
      token =myServices.sharedPreferences.getString('token')! ;
      // var token = myServices.sharedPreferences.getString('token')!;
      return const RouteSettings(name: AppRoutes.homeScreen);
    }
     if(myServices.sharedPreferences.getBool('onBoarding')==true)
      {
        return const RouteSettings(name: AppRoutes.loginScreen);
      }
    return null;
  }
}