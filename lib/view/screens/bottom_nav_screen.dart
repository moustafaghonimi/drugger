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
        () =>SalomonBottomBar(
          currentIndex: controller.currentScreenIndex.value,
          onTap:(value) =>controller.changeScreen(value) ,
          selectedItemColor: AppColor.primaryColor,
          items: [
            SalomonBottomBarItem(
              icon: const Icon(Icons.home),
              title: const Text(AppString.home),
            ),

            SalomonBottomBarItem(
              icon: const Icon(Icons.add),
              title: const Text(AppString.medicine),
            ),

            SalomonBottomBarItem(
              icon: const Icon(Icons.shopping_cart_outlined),
              title: const Text(AppString.cart),
            ),

            SalomonBottomBarItem(
              icon: const Icon(Icons.person),
              title: const Text(AppString.profile),
            ),
          ],
        ),
      ),
      body:GetBuilder<BottomNavBarController>(
        builder: (controller) => controller.currentScreen,
      ),
    );
  }
}
