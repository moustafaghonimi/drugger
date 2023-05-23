import 'package:cached_network_image/cached_network_image.dart';
import 'package:drugger/constance/string_constant.dart';
import 'package:drugger/routing/app_routs_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constance/app_color.dart';
import '../../../controller/wishList_controller/wishList_controller.dart';
import '../../../model/wishListModel.dart';
import '../../widget/custemText.dart';

Widget wishListItem({
  required context,
  Color bgColor = Colors.grey,
  double? imageW,
  double? imageH,
  required Wishlist wishItem,
}) {
  final WishListController wishController = Get.find();
  var h = MediaQuery.of(context).size.height;
  var w = MediaQuery.of(context).size.width;
  return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.itemDetails, arguments: wishItem);
      },
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                // Set the background color
                borderRadius: BorderRadius.circular(12),
                // Round the corners of the container
                boxShadow: [
                  // Add a shadow to the container
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
                border: Border.all(
                  color: Colors.black12, // Set the color of the border
                  width: 2, // Set the width of the border
                )),
            width: double.infinity,
            // color: Colors.grey,
            height: h * 0.19,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {

                          Get.toNamed(AppRoutes.itemDetails,arguments:wishItem );


                        },
                        child: ClipRRect(
                            borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                            child: Container(
                              width: w * 0.9,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: '${wishItem.medicineImage}',
                                    width: w * .25,
                                    height: h * 0.12,
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                    placeholder: (context, url) => const Center(
                                        child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                            width: w * .5,
                                            child: CustemText(
                                              Txt: wishItem.medicineName,
                                              color: AppColor.blackColor,
                                              size: 22,
                                            )),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        CustemText(
                                          Txt:
                                          "${AppString.type} :  ${wishItem.medicineType}",
                                          color: Colors.grey,
                                          size: 12,
                                        ),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        CustemText(
                                          Txt:
                                          " ${AppString.type} : ${wishItem.medicineStock.toString()} piece",
                                          maxLines: 2,
                                          color: AppColor.onPrimaryColor,
                                          size: 14,
                                        ),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        CustemText(
                                          Txt:
                                          "Exp : ${wishItem.medicineExpireDate}",
                                          color: AppColor.onPrimaryColor,
                                          size: 14,
                                        ),

                                        const SizedBox(
                                          height: 6,
                                        ),
                                        SizedBox(
                                          width: w * 0.58,
                                          child: CustemText(
                                            Txt:
                                            "${AppString.description}: ${wishItem.medicineDesc}",
                                            maxLines: 1,
                                            color: AppColor.blackColor,
                                            size: 14,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        CustemText(
                                          Txt:
                                          "Prise : ${wishItem.medicineUnitPrice.toString()}",
                                          color: AppColor.onPrimaryColor,
                                          size: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ));
}
