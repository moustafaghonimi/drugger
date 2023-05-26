import 'package:drugger/constance/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constance/string_constant.dart';
import '../../../controller/user_medicine/user_medicine_controller.dart';
import '../../../routing/app_routs_name.dart';
import '../../widget/user_medicine_card.dart';
import 'add_medicine.dart';

class UserMedicineScreen extends StatelessWidget {
   UserMedicineScreen({Key? key}) : super(key: key);
  final UserMedicineController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          controller.goToAddMedicine();
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
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
                AppString.medicine,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: AppColor.whiteColor),
              ),
            ),
            Obx(
              () => Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => userMedicinesCard(
                    context: context,
                    medicineModel:controller.userMedicineList[index],
                    bgColor: Colors.white,
                  ),
                  itemCount: controller.userMedicineList.length,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
