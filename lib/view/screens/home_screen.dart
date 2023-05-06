import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: Get.width,
          height:Get.height ,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text('Most Popular Medicine'),
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing:8,
                    crossAxisSpacing: 8,
                    mainAxisExtent: 120,

                  ), itemBuilder: (context, index) => Text('$index'),
                  itemCount: 50,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
