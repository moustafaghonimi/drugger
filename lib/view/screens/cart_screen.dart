import 'package:cached_network_image/cached_network_image.dart';
import 'package:drugger/model/cart_product_model.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constance/app_color.dart';
import '../../constance/string_constant.dart';
import '../widget/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: Get.width,
                      height: 80,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      decoration: const BoxDecoration(
                        color: AppColor.primaryColor,
                      ),
                      child: Text(
                        AppString.cart,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: AppColor.whiteColor),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => cartItem(
                      context: context,
                      medicineId: MedicineId(
                          id: '',
                          medicineName: 'medicineName',
                          medicineImage:
                          'https://res.cloudinary.com/dj0xqaovt/image/upload/v1682473658/DruggerApp/medicines/mn4J46zQhJrU_TZ-Xgd6f/medicineImage/mn4J46zQhJrU_TZ-Xgd6fmedicinePic.jpg',
                          medicineType: 'mostafa',
                          medicineExpireDate: DateTime(2001),
                          medicineDesc: 'medicineDesc',
                          medicineStock: 100,
                          medicineUnitPrice: 100,
                          comments: ['comments']),
                      quantity: 10,
                    ),
                      itemCount: 10,
                      shrinkWrap: true,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      child: Row(
                        children: [
                          Text('Total : '),
                          Spacer(),
                          Text("12000"),
                        ],
                      ),
                    ),
                    const Divider(endIndent: 20, indent: 20),
                    Container(
                      width: double.infinity,
                      height: Get.height * .06,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColor.primaryColor,
                      ),
                      child: Text(
                        "Check Out",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
