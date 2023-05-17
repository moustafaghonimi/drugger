import 'package:cached_network_image/cached_network_image.dart';
import 'package:drugger/constance/string_constant.dart';
import 'package:drugger/model/medicine_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constance/app_color.dart';
import '../../../controller/item_and_comment/itemDetails_controller.dart';
import '../../../core/function/format_date.dart';
import '../../../routing/app_routs_name.dart';
import '../../widget/custemAnimetedTxt.dart';
import '../../widget/custemText.dart';
import '../../widget/customButton.dart';
import '../comment/comment_detiles.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final ItemDetailsController controller = Get.put(ItemDetailsController());

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Get.offNamed(AppRoutes.homeScreen);
          },
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.black,
              )),
        ],
        elevation: 0.0,
        backgroundColor: Colors.white,
        scrolledUnderElevation: 100,
        centerTitle: true,
        title: CustemAnimetedText(
            Txt: controller.medicine!.medicineName,
            color: Colors.black,
            size: 20,
            time: 200),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        showSelectedLabels: false,
        items: [
          BottomNavigationBarItem(
              tooltip: AppString.comment,
              label: AppString.commentLabel,
              icon: customButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.commentScreen);
                  },
                  text: AppString.comment,
                  buttonColor: AppColor.onPrimaryColor,
                  buttonRedias: 20,
                  textColor: AppColor.whiteColor),
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              label: AppString.addToCartLabel,
              tooltip: AppString.addToCart,
              icon: customButton(
                  onPressed: () {},
                  text: AppString.addToCart,
                  buttonColor: AppColor.primaryColor,
                  buttonRedias: 20,
                  textColor: AppColor.whiteColor),
              backgroundColor: Colors.white),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            color: Colors.white,
            child: Column(
              children: [
                InkWell(
                  onTap: () => imageDetailsSearchBottomScheat(
                      context, controller.medicine),
                  child: Stack(
                    children: [
                      CachedNetworkImage(
                        imageUrl: '${controller.medicine?.medicineImage}',
                        width: w * 1,
                        height: h / 3,
                        fit: BoxFit.cover,
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              isAntiAlias: true,
                              image: imageProvider,
                            ),
                          ),
                        ),
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: h * .02,
                ),
                SizedBox(
                  width: w * 0.9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: w,
                          child: Text(
                            controller.medicine!.medicineName,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          )),
                      SizedBox(
                        height: h * .01,
                      ),
                      CustemText(
                        Txt:
                            "${AppString.type} :  ${controller.medicine?.medicineType}",
                        color: Colors.grey,
                        size: 18,
                      ),
                      SizedBox(
                        height: h * .02,
                      ),
                      SizedBox(
                        width: w,
                        child: CustemText(
                          Txt:
                              '${AppString.exp} : ${formatDate(controller.medicine!.medicineExpireDate)}',
                          color: AppColor.onPrimaryColor,
                          size: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: h * .02,
                      ),
                      SizedBox(
                        child: CustemText(
                            Txt:
                                "${AppString.price} : ${controller.medicine?.medicineUnitPrice} \$",
                            color: AppColor.blackColor,
                            size: 20,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: h * .02,
                      ),
                      CustemText(
                        Txt:
                            "${AppString.available} : ${controller.medicine?.medicineStock.toString()} piece In Stock",
                        maxLines: 3,
                        color: AppColor.primaryColor,
                        size: 16,
                      ),
                      SizedBox(
                        height: h * .02,
                      ),
                      CustemText(
                          Txt:
                              '${AppString.pharmacy} :${controller.medicine?.createdBy}',
                          color: Colors.grey,
                          size: 18),
                      SizedBox(
                        height: h * .02,
                      ),
                      CustemText(
                        Txt: "Description",
                        color: AppColor.blackColor,
                        size: 18,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(controller.medicine!.medicineDesc),
                      ),
                      SizedBox(
                        height: h * .05,
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(AppRoutes.commentScreen);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.comment,
                              color: AppColor.onPrimaryColor,
                            ),
                            CustemText(
                              Txt: AppString.comments,
                              color: AppColor.blackColor,
                              size: 20,
                              fontWeight: FontWeight.w500,
                              maxLines: 3,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  void imageDetailsSearchBottomScheat(context, var medicine) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
        context: context,
        backgroundColor: Colors.white70,
        useSafeArea: true,
        elevation: 4,
        isScrollControlled: true,
        builder: (context) => Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SingleChildScrollView(
              child: Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: CachedNetworkImage(
                    imageUrl: '${medicine.medicineImage}',
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.width * 0.6,
                    fit: BoxFit.cover,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
            )));
  }
}
