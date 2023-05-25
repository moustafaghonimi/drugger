import 'package:drugger/constance/app_color.dart';
import 'package:drugger/constance/assets_constant.dart';
import 'package:drugger/constance/string_constant.dart';
import 'package:drugger/view/screens/wishList/wishListItem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../controller/home_controller.dart';
import '../../../controller/wishList_controller/wishList_controller.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final WishListController controller = Get.put(WishListController());
//    controller.getWishListData();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(AppString.favorite),
        backgroundColor: AppColor.onPrimaryColor,
      ),
      body: SingleChildScrollView(
        child: controller.favorite.isEmpty
            ? Column(
                children: [
                  Image.asset(
                    AppAssets.wishEmpty,
                  ),
                  const Center(
                      child: Text(
                    AppString.addFavorite,
                    style: TextStyle(color: AppColor.onPrimaryColor),
                  )),
                ],
              )
            : Obx(
                () => controller.isLoading.value
                    ? const Center(child: CircularProgressIndicator())
                    : GetBuilder<WishListController>(
                  builder: (controller) =>
                       ListView.builder(
                          key: const Key("WishScreenListView"),
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => wishListItem(
                            context: context,
                            // index: index,
                            controller: controller,
                            wishItem: controller.favorite[index],
                          ),
                          itemCount: controller.favorite.length,
                          shrinkWrap: true,
                        ),
                    ),
              ),
      ),
    );
  }
}
