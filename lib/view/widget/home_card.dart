import 'package:cached_network_image/cached_network_image.dart';
import 'package:drugger/constance/string_constant.dart';
import 'package:drugger/controller/cart/cart_controller.dart';
import 'package:drugger/core/function/format_date.dart';
import 'package:drugger/routing/app_routs_name.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constance/app_color.dart';
import '../../controller/wishList_controller/wishList_controller.dart';
import '../../model/medicine_model.dart';

Widget homeCard({
  required context,
  Color bgColor = Colors.grey,
  double? imageW,
  double? imageH,
  required Medicine medicineModel,
}) {
  final CartController cartController = Get.find();
  final WishListController wishListController = Get.put(WishListController());
  return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.itemDetailes,arguments:medicineModel );
      },
      child: Card(
        color: bgColor,
        shadowColor: Colors.black,
        shape: Border.all(
          color: Colors.white10,
        ),
        elevation: 10,
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: 10,
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CachedNetworkImage(
                      width: Get.width * .3,
                      height: Get.height * .16,
                      fit: BoxFit.fill,
                      imageUrl: medicineModel.medicineImage,
                      placeholder: (context, url) => FadeShimmer.round(
                        size: 10,
                        fadeTheme:
                            Get.isDarkMode ? FadeTheme.dark : FadeTheme.light,
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          // height: 55,
                          width: 190,
                          child: Text(
                            medicineModel.medicineName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                        SizedBox(
                          // height: 55,
                          width: 190,
                          child: Text(
                            medicineModel.medicineDesc,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        Text(
                          "${AppString.exp} : ${formatDate(medicineModel.medicineExpireDate)}",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Text(
                          "${AppString.stock} : ${medicineModel.medicineStock}",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Text(
                          "${AppString.price} : ${medicineModel.medicineUnitPrice} \$",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                  right: -5,
                    bottom: -5,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                          onPressed: ()async{
                            print('Icon Pressed');
                            cartController.addToCart(medicineModel.id, "1");

                          },
                          icon: const Icon(
                            Icons.shopping_cart,
                            color: AppColor.primaryColor,
                          )),
                    )),
                Positioned(
                  right: -5,
                    top: -10,
                    child:
                    IconButton(
                      icon: Obx(() => Icon(wishListController.localList.value.contains(medicineModel.id)&&wishListController.localList.value.isNotEmpty ? Icons.favorite : Icons.favorite_border)),
                      color: wishListController.localList.value.contains(medicineModel.id) ? Colors.red : Colors.black ,
                      onPressed: () {
                        wishListController.toggleLike();
                        wishListController.addWishList(medicineModel.id);

                      }
                    ),

                    )
              ],
            ),
          ),
        ),
      ),
    );
}
