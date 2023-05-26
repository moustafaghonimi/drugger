import 'package:drugger/constance/app_color.dart';
import 'package:drugger/constance/string_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../controller/bottom_nav_controller.dart';

class BottomNavScreen extends StatelessWidget {
  final BottomNavBarController controller = Get.put(BottomNavBarController());
   BottomNavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
            currentIndex: controller.currentScreenIndex.value,
            onTap:(value) =>controller.changeScreen(value) ,
            selectedLabelStyle: TextStyle(
              color: Colors.black
            ),
            unselectedLabelStyle: TextStyle(
              color: Colors.black
            ),
            fixedColor: Colors.black,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.home_outlined,color: Colors.black,),
                activeIcon:const Icon(Icons.home,color:AppColor.primaryColor,) ,
                label: AppString.home,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.favorite_border,color: Colors.black,),
                activeIcon: const Icon(Icons.favorite,color:AppColor.primaryColor,),
                label: AppString.wishList,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.medical_services_outlined,color: Colors.black,),
                activeIcon:  const Icon(Icons.medical_services,color:AppColor.primaryColor,),
                label: AppString.medicine,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.shopping_cart_outlined,color: Colors.black,),
                activeIcon: const Icon(Icons.shopping_cart,color:AppColor.primaryColor,),

                label: AppString.cart,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.person_outline,color: Colors.black,),
                activeIcon:  const Icon(Icons.person,color:AppColor.primaryColor,),
                label: AppString.profile,
              ),
            ]
        ),
        // () =>SalomonBottomBar(
        //   currentIndex: controller.currentScreenIndex.value,
        //   onTap:(value) =>controller.changeScreen(value) ,
        //   selectedItemColor: AppColor.primaryColor,
        //   items: [
        //     SalomonBottomBarItem(
        //       icon: const Icon(Icons.home),
        //       title: const Text(AppString.home),
        //     ),
        //
        //     SalomonBottomBarItem(
        //       icon: const Icon(Icons.favorite),
        //       title: const Text(AppString.wishlist),
        //     ),
        //
        //     SalomonBottomBarItem(
        //       icon: const Icon(Icons.medical_services),
        //       title: const Text(AppString.medicine),
        //     ),
        //
        //     SalomonBottomBarItem(
        //       icon: const Icon(Icons.shopping_cart),
        //       title: const Text(AppString.cart),
        //     ),
        //
        //     SalomonBottomBarItem(
        //       icon: const Icon(Icons.person),
        //       title: const Text(AppString.profile),
        //     ),
        //   ],
        // ),
      ),
      body:GetBuilder<BottomNavBarController>(
        builder: (controller) => controller.currentScreen,
      ),
    );
  }
}
