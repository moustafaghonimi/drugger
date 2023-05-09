import 'package:drugger/constance/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routing/app_routs_name.dart';
import '../routing/routs.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: AppTheme.customLightTheme,
        // darkTheme: ,
        debugShowCheckedModeBanner: false,
        getPages: routes,
        initialRoute: AppRoutes.homeScreen,
      // home: LoginScreen(),
    );
  }
}

