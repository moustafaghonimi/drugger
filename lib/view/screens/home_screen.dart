import 'package:drugger/routing/app_routs_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constance/app_color.dart';
import '../../constance/string_constant.dart';
import '../../controller/home_controller.dart';
import '../widget/home_card.dart';
import '../widget/notfication_widget.dart';
import '../widget/search_widget.dart';


import '../widget/swipe_action.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FetchMoreIndicator(
          onAction: ()async=> await controller.getMedicine(),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 160,
                  color: AppColor.primaryColor,
                  padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppString.drugger,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(color: AppColor.whiteColor),
                          ),
                          IconButton(
                            //TODO Add notification
                              onPressed: () {
                                Get.bottomSheet(
                                    Container(
                                      margin: EdgeInsets.only(bottom: 100),
                                      height: 100,
                                      width: Get.width,
                                      color: Colors.green,
                                      child: Column(
                                  children: [

                                  ],
                                ),
                                    ));
                              },
                              icon: notification(notificationNumber: 1),

                          ),
                          // CachedNetworkImage(
                          //   width: 50,
                          //   height: 50,
                          //   imageUrl: ' controller.userData.data!.image',
                          //   imageBuilder: (context, imageProvider) => CircleAvatar(
                          //     backgroundImage: imageProvider,
                          //     backgroundColor: Theme.of(context).colorScheme.primary,
                          //     radius: 60,
                          //   ),
                          //   errorWidget: (context, url, error) => CircleAvatar(
                          //     radius: 60,
                          //     child: Image.asset(
                          //       "assets/images/profileimage.png",
                          //       height: 50,
                          //       width: 50,
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                      search(onTap: () {
                        Get.toNamed(AppRoutes.searchScreen);
                      }),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Obx(() =>Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      Container(
                        height: 70,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => GestureDetector(
                              onTap:() => controller.changeSelectedCategory(index),
                              child: Container(
                                    height: 70,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      color:controller.selectedCategoryIndex.value==index ? AppColor.primaryColor:AppColor.primaryColor.withOpacity(.5),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(Icons.ac_unit),
                                        Text(
                                          AppString.category[index],
                                          style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColor.whiteColor),
                                        ),
                                      ],
                                    ),
                                  ),
                            ),
                            separatorBuilder: (context, index) => const SizedBox(
                                  width: 10,
                                ),
                            itemCount: AppString.category.length),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15,top: 20),
                        child: Text(
                          AppString.mostPopularMedicine,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        itemBuilder: (context, index) =>
                        homeCard(
                            context: context,
                            bgColor: Colors.white,
                            medicineModel: controller.homeMedicines[index],
                        ),
                        itemCount:controller.homeMedicines.length,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
