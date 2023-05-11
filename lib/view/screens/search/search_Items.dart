import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../constance/app_color.dart';
import '../../../controller/search/search_controller.dart';
import '../../../model/medicine_model.dart';
import '../../widget/custemText.dart';

class SearchItems extends StatelessWidget {
  Medicine medicine;

  SearchItems(this.medicine, {super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Padding(
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
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
            border: Border.all(
              color: Colors.black12, // Set the color of the border
              width: 2, // Set the width of the border
            )),
        width: double.infinity,
        // color: Colors.grey,
        height: h * 0.17,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {},
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
                                    fit: BoxFit.cover,
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    placeholder: (context, url) =>
                                        const Center(
                                            child:
                                                CircularProgressIndicator()),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  CustemText(
                                    Txt:
                                        "EXP : ${medicine.medicineExpireDate.year}/${medicine.medicineExpireDate.month}",
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
                                      Txt: "Type: ${medicine.medicineType}",
                                      color: Colors.grey,
                                      size: 12,
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    CustemText(
                                      Txt:
                                          "Available : ${medicine.medicineStock.toString()} piece",
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
                                            "Description: ${medicine.medicineDesc}",
                                        maxLines: 2,
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
    );
  }
}
