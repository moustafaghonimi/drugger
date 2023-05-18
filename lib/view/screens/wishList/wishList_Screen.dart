import 'package:drugger/constance/app_color.dart';
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

    return Scaffold(
      appBar: AppBar(centerTitle: true,
      title: const Text(AppString.favorite),
        backgroundColor: AppColor.onPrimaryColor,
      ),
      body: Obx(() =>controller.isLoading.value?const Center(child: CircularProgressIndicator()):
      ListView.builder(
        key: const Key("CartScreenListView"),
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => wishListItem(
          context: context,
          wishItem: controller.add[index],
        ),
        itemCount: controller.add.length,
        shrinkWrap: true,
      ),),


    );
  }
}
