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
          items: [
            SalomonBottomBarItem(
              icon: const Icon(Icons.home),
              title: const Text(AppString.home),
              selectedColor: Colors.purple,
            ),

            SalomonBottomBarItem(
              icon: const Icon(Icons.search),
              title: const Text(AppString.search),
              selectedColor: Colors.pink,
            ),

            SalomonBottomBarItem(
              icon: const Icon(Icons.shopping_cart_outlined),
              title: const Text(AppString.cart),
              selectedColor: Colors.orange,
            ),

            SalomonBottomBarItem(
              icon: const Icon(Icons.person),
              title: const Text(AppString.profile),
              selectedColor: Colors.teal,
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
