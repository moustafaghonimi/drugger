import 'package:drugger/constance/app_color.dart';
import 'package:drugger/constance/assets_constant.dart';
import 'package:drugger/constance/string_constant.dart';
import 'package:drugger/view/screens/wishList/wishlist_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/wishList_controller/wishList_controller.dart';

class WishListScreen extends StatelessWidget {
   WishListScreen({Key? key}) : super(key: key);
    final WishListController controller = Get.put(WishListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(AppString.favorite),
        backgroundColor: AppColor.primaryColor,
      ),
      body: SingleChildScrollView(
        child: controller.wishList.isEmpty
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
                            wishItem: controller.wishList[index],
                          ),
                          itemCount: controller.wishList.length,
                          shrinkWrap: true,
                        ),
                    ),
              ),
      ),
    );
  }
}
