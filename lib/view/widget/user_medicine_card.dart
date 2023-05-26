import 'package:cached_network_image/cached_network_image.dart';
import 'package:drugger/constance/string_constant.dart';
import 'package:drugger/core/function/format_date.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/user_medicine/user_medicine_controller.dart';
import '../../model/medicine_model.dart';

Widget userMedicinesCard({
  required context,
  Color bgColor = Colors.grey,
  double? imageW,
  double? imageH,
  required Medicine medicineModel,
}) {
  final UserMedicineController controller = Get.find();
  return Card(
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
              top: 0,
              right: 0,
              child: PopupMenuButton<String>(
                onSelected: (value) {
                  // Navigate to the selected screen
                  if (value == '1') {
                    print("edit inside");

                    controller.goToEditMedicine(medicineModel);

                  } else if (value == '2') {
                    print("delete inside");
                    controller.deleteMedicine(medicineModel);
                  }
                },
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: '1',
                    child: Text('Edit'),
                  ),
                  PopupMenuItem(
                    value: '2',
                    child: Text('Delete'),
                  ),
                ],
                child: Icon(Icons.more_horiz),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
