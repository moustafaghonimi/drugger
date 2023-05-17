import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/screens/add_medicine.dart';
import '../view/screens/cart/cart_screen.dart';
import '../view/screens/home_screen.dart';
import '../view/screens/profile/user_pro.dart';
import '../view/screens/profile_screen.dart';

class BottomNavBarController extends GetxController {
  RxInt currentScreenIndex =0.obs;
  Widget currentScreen = HomeScreen();

  changeScreen(int value)
  {
    currentScreenIndex.value =value ;
    switch(currentScreenIndex.value) {
      case 0: {
        currentScreen =HomeScreen();
      }
      break;
      case 1: {
        currentScreen=AddMedicine();
      }
      break;
      case 2: {
        currentScreen=  CartScreen();
      }
      break;
      case 3:{
        currentScreen=  user_profile();
      }
      break;
      default: {
        //statements;
      }
      break;
    }
    update();
  }
}