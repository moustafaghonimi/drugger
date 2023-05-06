import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../service/services.dart';

class MyMiddleWare extends GetMiddleware
{

  MyServices myServices =Get.find();
  @override
  RouteSettings? redirect(String? route) {
    if(myServices.sharedPreferences.getString('token')!=null){
      var token = myServices.sharedPreferences.getString('token')!;
      // AppApiConstance.baseHeaders.update('Authorization', (value) => token);
      return const RouteSettings(/*name: AppRoutes.home*/);
    }
    return null;
  }
}