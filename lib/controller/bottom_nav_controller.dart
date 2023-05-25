import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

import '../view/screens/profile/profile_screen.dart';
import '../view/screens/cart/cart_screen.dart';
import '../view/screens/home_screen.dart';
import '../view/screens/user_medicine/user_medicine_screen.dart';
import '../view/screens/wishList/wishList_Screen.dart';

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
        //TODO change the screen to wishlist
        currentScreen= WishListScreen();
      }
      break;
      case 2: {
        currentScreen=  UserMedicineScreen();
      }
      break;
      case 3:{
        currentScreen=   CartScreen();
      }
      break;
      case 4:{
        currentScreen=  ProfileScreen();
      }
      break;



      default: {
        //statements;
      }
      break;
    }
    update();
  }
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    super.onReady();
  }
}