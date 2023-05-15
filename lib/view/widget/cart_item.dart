import 'package:cached_network_image/cached_network_image.dart';
import 'package:drugger/core/function/format_date.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constance/app_color.dart';
import '../../model/cart_product_model.dart';

Widget cartItem({
  required context,
  required MedicineId medicineId,
  required int quantity,
}) =>
    Container(
      width: Get.width,
      height: Get.height * .23,
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],),
      child: Row(
        children: [
          CachedNetworkImage(
            width: Get.width * 0.35,
            height: double.infinity,
            fit: BoxFit.fill,
            imageUrl: medicineId.medicineImage,
            placeholder: (context, url) => FadeShimmer.round(
              size: 10,
              fadeTheme: Get.isDarkMode ? FadeTheme.dark : FadeTheme.light,
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${medicineId.medicineName} (${medicineId.medicineType})',
                  style: Theme.of(context).textTheme.titleLarge,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "EXP: ${formatDate(medicineId.medicineExpireDate)}",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  "Stock : ${medicineId.medicineStock}",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  'Price : ${medicineId.medicineUnitPrice}',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      width : 30,
                      height: 30,
                      child: FloatingActionButton(
                        backgroundColor: AppColor.primaryColor,
                        onPressed: () {
                          //TODO Decrease quantity
                        },
                        shape: const BeveledRectangleBorder(
                            borderRadius: BorderRadius.zero),
                        child: const Icon(Icons.remove,
                            color: AppColor.whiteColor,),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      width: 30,
                      height: 30,
                      child: FloatingActionButton(
                        backgroundColor: AppColor.primaryColor,
                        onPressed: () {
                          Get.defaultDialog(
                            title: "Enter Quantity",
                            content: TextFormField(
                              //TODO add controller
                              // controller: ,
                              keyboardType: TextInputType.number,
                            ),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 7),
                            onConfirm: (){
                            },
                            onCancel: () {
                              Get.back();
                            },
                          );
                        },
                        shape: const BeveledRectangleBorder(
                            borderRadius: BorderRadius.zero),
                        child: Text(
                          '2',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  fontSize: 25, color: AppColor.whiteColor),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: FloatingActionButton(
                        backgroundColor: AppColor.primaryColor,
                        onPressed: () {
                          //TODO Increase quantity
                        },
                        shape: const BeveledRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        child: const Icon(
                          Icons.add,
                          color: AppColor.whiteColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
