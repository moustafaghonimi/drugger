import 'package:drugger/constance/app_color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData customLightTheme = ThemeData(textTheme: AppFontTheme.fontTheme);
}

class AppFontTheme {
  static TextTheme fontTheme = const TextTheme(
    titleLarge: TextStyle(
      //       fontFamily:Get.locale?.languageCode == 'ar' ? 'Cairo' : 'Source_Serif_Pro',
      color:AppColor.blackColor,
      fontSize: 24,
      fontWeight: FontWeight.w700,
    ),
    titleMedium:TextStyle(
  //       fontFamily:Get.locale?.languageCode == 'ar' ? 'Cairo' : 'Source_Serif_Pro',
  color:AppColor.blackColor,
  fontSize: 18,
  fontWeight: FontWeight.w700,
    ),
    titleSmall:TextStyle(
      //       fontFamily:Get.locale?.languageCode == 'ar' ? 'Cairo' : 'Source_Serif_Pro',
      color:AppColor.blackColor,
      fontSize: 12,
      fontWeight: FontWeight.w700,
    ),
    bodyLarge:TextStyle(
      //       fontFamily:Get.locale?.languageCode == 'ar' ? 'Cairo' : 'Source_Serif_Pro',
      color:Color(0xB3000000),
      fontSize: 24,
    ) ,
    bodyMedium:TextStyle(
      //       fontFamily:Get.locale?.languageCode == 'ar' ? 'Cairo' : 'Source_Serif_Pro',
      color:Color(0x99000000),
      fontSize: 19,
    ) ,
    bodySmall: TextStyle(
      //       fontFamily:Get.locale?.languageCode == 'ar' ? 'Cairo' : 'Source_Serif_Pro',
      color:AppColor.blackColor,
      fontSize: 14,
    ),

    // displayLarge: ,
    displayMedium:TextStyle(
      //       fontFamily:Get.locale?.languageCode == 'ar' ? 'Cairo' : 'Source_Serif_Pro',
      color:AppColor.whiteColor,
      fontSize: 20,
    )  ,
    displaySmall:TextStyle(
      //       fontFamily:Get.locale?.languageCode == 'ar' ? 'Cairo' : 'Source_Serif_Pro',
      color:AppColor.whiteColor,
      fontSize: 14,
    )  ,
  );
}
