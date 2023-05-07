import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routing/app_routs_name.dart';
import '../routing/routs.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        // theme: ,
        // darkTheme: ,
        debugShowCheckedModeBanner: false,
        getPages: routes,
        initialRoute: AppRoutes.loginScreen,
      // home: LoginScreen(),
    );
  }
}

