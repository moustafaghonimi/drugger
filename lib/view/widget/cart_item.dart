import 'package:cached_network_image/cached_network_image.dart';
import 'package:drugger/controller/cart/cart_controller.dart';
import 'package:drugger/core/function/format_date.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constance/app_color.dart';
import '../../model/cart_product_model.dart';

Widget cartItem({
  required context,
  required ProductList productList,
  required int index ,
  required CartController controller ,
}) {
  final TextEditingController customQuantityController = TextEditingController();
  return Container(
      width: Get.width,
      height: Get.height * .24,
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      padding: const EdgeInsets.all(7),
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
            imageUrl: productList.medicineId.medicineImage,
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
                  '${productList.medicineId.medicineName} (${productList.medicineId.medicineType})',
                  style: Theme.of(context).textTheme.titleLarge,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "EXP: ${formatDate(productList.medicineId.medicineExpireDate)}",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  "Stock : ${productList.medicineId.medicineStock}",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  'Price : ${productList.medicineId.medicineUnitPrice}',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    SizedBox(
                      width : 30,
                      height: 30,
                      child: FloatingActionButton(
                        key: Key("${productList.medicineId.id}3"),
                        backgroundColor: AppColor.primaryColor,
                        onPressed:(){
                          controller.decreaseQuantity(productList.medicineId.id, productList.quantity,index);
                        },
                        shape: const BeveledRectangleBorder(
                            borderRadius: BorderRadius.zero),
                        child: const Icon(Icons.remove,
                            color: AppColor.whiteColor,),
                      ),
                    ),
                    GetBuilder<CartController>(builder: (controller) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      width: 30,
                      height: 30,
                      child: FloatingActionButton(
                        key: Key("${productList.medicineId.id}1"),
                        backgroundColor: AppColor.primaryColor,
                        onPressed: () {
                          Get.defaultDialog(
                            title: "Enter Quantity",
                            content: TextFormField(
                              controller:customQuantityController ,
                              keyboardType: TextInputType.number,
                            ),
                            contentPadding:
                            const EdgeInsets.symmetric(horizontal: 7),
                            onConfirm: (){
                              controller.customQuantity(productList.medicineId.id, int.parse(customQuantityController.text), index);
                              Get.back();
                            },
                            onCancel: () {
                              Get.back();
                            },
                          );
                        },
                        shape: const BeveledRectangleBorder(
                            borderRadius: BorderRadius.zero),
                        child: Text(
                          productList.quantity.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                              fontSize: 25, color: AppColor.whiteColor),
                        ),
                      ),
                    ),),
                    GestureDetector(
                      onTap: (){
                      },
                      child: SizedBox(
                        width: 30,
                        height: 30,
                        child: FloatingActionButton(
                          key: Key("${productList.medicineId.id}2"),
                          backgroundColor: AppColor.primaryColor,
                          onPressed:(){
                            controller.increaseQuantity(productList.medicineId.id, productList.quantity,index);
                          } ,
                          shape: const BeveledRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                          child: const Icon(
                            Icons.add,
                            color: AppColor.whiteColor,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(flex: 2,),
                    IconButton(onPressed: (){
                      controller.clearOneItem(productList.medicineId.id);
                    }, icon: const Icon(Icons.delete,color: Colors.red,),),

                      ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
}

