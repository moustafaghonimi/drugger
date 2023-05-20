import 'package:cached_network_image/cached_network_image.dart';
import 'package:drugger/constance/string_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../constance/app_color.dart';
import '../../../controller/cart/cart_controller.dart';
import '../../../controller/wishList_controller/wishList_controller.dart';
import '../../../model/medicine_model.dart';
import '../../../routing/app_routs_name.dart';
import '../../widget/custemText.dart';

class SearchItems extends StatelessWidget {
  Medicine medicine;

  SearchItems(this.medicine, {super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    final WishListController wishListController = Get.put(WishListController());
    final CartController cartController = Get.find();

    return Stack(
      children: [
        Padding(
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

                            Get.toNamed(AppRoutes.itemDetailes,arguments:medicine );


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
                                  Column(
                                    children: [
                                      CachedNetworkImage(
                                        imageUrl: '${medicine.medicineImage}',
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
                                      CustemText(
                                        Txt:
                                            "Exp : ${medicine.medicineExpireDate.year}/${medicine.medicineExpireDate.month}",
                                        color: AppColor.onPrimaryColor,
                                        size: 14,
                                      ),
                                    ],
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
                                              Txt: medicine.medicineName,
                                              color: AppColor.blackColor,
                                              size: 22,
                                            )),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        CustemText(
                                          Txt:
                                              "${AppString.type} :  ${medicine.medicineType}",
                                          color: Colors.grey,
                                          size: 12,
                                        ),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        CustemText(
                                          Txt:
                                              " ${AppString.type} : ${medicine.medicineStock.toString()} piece",
                                          maxLines: 2,
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
                                                "${AppString.description}: ${medicine.medicineDesc}",
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
                                              "Prise : ${medicine.medicineUnitPrice.toString()}",
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
        Positioned(
            right: 9,
            bottom: 9,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                  onPressed: ()async{
                    cartController.addToCart(medicine.id, "1");

                  },
                  icon: const Icon(
                    Icons.shopping_cart,
                    color: AppColor.primaryColor,
                  )),
            )),

        Positioned(
          right: 2,
          top: 2,
          child:
          IconButton(
              icon: Obx(() => Icon(wishListController.localList.contains(medicine.id)&&wishListController.localList.isNotEmpty ? Icons.favorite : Icons.favorite_border)),
              color: wishListController.localList.contains(medicine.id) ? Colors.red : Colors.black ,
              onPressed: () {
                wishListController.toggleLike();
                wishListController.addWishList(medicine.id);

              }
          ),

        )

      ],
    );
  }
}
