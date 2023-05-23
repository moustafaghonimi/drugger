import 'package:cached_network_image/cached_network_image.dart';
import 'package:drugger/constance/app_color.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/profile/profile_controller.dart';
import '../../../routing/app_routs_name.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  final ProfileController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Obx(() =>
            controller.isLoading.value ?
            FadeShimmer(
              height: 200,
              width: Get.width,
              radius: 4,
              highlightColor: Color(0xffffffff),
              baseColor: Color(0xff2f4774),
            ) : Stack(
              alignment: Alignment.bottomCenter,
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: Get.height * .25,
                  width: double.infinity,
                  color: Colors.red,
                  child: Image(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        "https://jpeg.org/images/jpegsystems-home.jpg"),),
                ),
                Positioned(
                  bottom: -80,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 80,
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CachedNetworkImage(
                          imageUrl: controller.profileData.result.profileUrl!,
                          imageBuilder: (context, imageProvider) =>
                              CircleAvatar(
                                radius: 75,
                                backgroundImage: imageProvider,
                              ),
                          placeholder: (context,
                              url) => const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              CircleAvatar(
                                  radius: 60,
                                  child: Image.asset(
                                      "assets/images/profileimage.png")),
                        ),
                        Icon(
                          Icons.add_a_photo,
                          color: AppColor.primaryColor,
                          size: 50,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),) ,
            SizedBox(height: Get.height * .15,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: AppColor.whiteColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ]
              ),
              child: ListTile(
                leading: const Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                onTap: () {
                  controller.gotToUpdateProfile();
                },
                iconColor: AppColor.whiteColor,
                title: Text(
                  'Update Profile',
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyMedium,
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: AppColor.whiteColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ]
              ),
              child: ListTile(
                leading: const Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.black,
                ),
                onTap: () {
                  Get.toNamed(AppRoutes.myOrder);
                },
                iconColor: AppColor.whiteColor,
                title: Text(
                  'My Order',
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyMedium,
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: AppColor.whiteColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ]
              ),
              child: ListTile(
                leading: const Icon(
                  Icons.password,
                  color: Colors.black,
                ),
                onTap: () {
                  Get.toNamed(AppRoutes.updatePassword);
                },
                iconColor: AppColor.whiteColor,
                title: Text(
                  'Change Password',
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyMedium,
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: AppColor.whiteColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ]
              ),
              child: ListTile(
                leading: const Icon(
                  Icons.logout,
                  color: Colors.black,
                ),
                onTap: () {
                  controller.logOut();
                },
                iconColor: AppColor.whiteColor,
                title: Text(
                  'Logout',
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
