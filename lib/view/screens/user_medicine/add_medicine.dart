import 'dart:io';

import 'package:drugger/constance/app_color.dart';
import 'package:drugger/core/function/validate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constance/string_constant.dart';
import '../../../controller/user_medicine/add_medicine_controller.dart';
import '../../widget/add_medicine_tff.dart';

class AddMedicine extends StatelessWidget {
  AddMedicine({Key? key}) : super(key: key);
  final AddMedicineController controller = Get.put(AddMedicineController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:AppColor.primaryColor,
        title: const Text(AppString.addNewMedicine),
      ),
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: SingleChildScrollView(
          child: GetBuilder<AddMedicineController>(
            builder: (controller) => Form(
              key: controller.globalKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  addMedicineTFF(
                    context: context,
                    label: AppString.name,
                    controller: controller.nameController,
                    validator: (value) => validateInput(value, 'name'),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: Get.width,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey, width: .5)),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Obx(
                          () => DropdownButtonFormField<String>(
                        decoration:
                        const InputDecoration(border: InputBorder.none),
                        hint: Text(
                          'Select the Type',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        value: controller.selectedType.value.isEmpty
                            ? null
                            : controller.selectedType.value,
                        items: controller.type.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) => controller.changeType(value),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'you must choose the type';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey,width: .5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: const BoxConstraints(
                      minHeight: 60,
                    ),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(AppString.image),
                        const SizedBox(
                          width: 10,
                        ),
                        GetBuilder<AddMedicineController>(
                          builder: (controller) => controller.pickedFile == null
                              ? GestureDetector(
                            onTap: () => Get.bottomSheet(Container(
                              height: 150,
                              color: Colors.white,
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap: () async => await controller
                                        .pickImage(false)
                                        .then((_) => Get.back()),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: const [
                                        Icon(Icons.image),
                                        Text(AppString.gallery),
                                      ],
                                    ),
                                  ),
                                  const VerticalDivider(
                                    color: Colors.grey,
                                    indent: 20,
                                    endIndent: 20,
                                  ),
                                  GestureDetector(
                                    onTap: () async => await controller
                                        .pickImage(true)
                                        .then((_) => Get.back()),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: const [
                                        Icon(Icons.camera_alt),
                                        Text(AppString.camera),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(.4),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Text(AppString.chooseImage),
                            ),
                          )
                              : Container(
                            alignment: Alignment.center,
                            height: 150,
                            width: 100,
                            child: Stack(
                              children: [
                                Image.file(
                                  File(controller.pickedFile!.path),
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                    top: -10,
                                    right: -10,
                                    child: IconButton(
                                      onPressed: () {
                                        controller.removeImage();
                                      },
                                      icon: const Icon(Icons.close,color: Colors.black,),
                                    ))
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  addMedicineTFF(
                    context: context,
                    label: AppString.expDate,
                    controller: controller.dateController,
                    onTap: () {
                      controller.selectDate(context);
                    },
                    validator: (value) => validateInput(value, 'date'),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  addMedicineTFF(
                    label: AppString.stock,
                    validator: (value) => validateInput(value, 'number'),
                    keyboardType: TextInputType.number,
                    controller: controller.stockController,
                    context: context,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  addMedicineTFF(
                    label: AppString.price,
                    keyboardType: TextInputType.number,
                    validator: (value) => validateInput(value, 'number'),
                    controller: controller.priceController,
                    context: context,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  addMedicineTFF(
                    label: AppString.description,
                    maxLines: 4,
                    validator: (value) => validateInput(value, ''),
                    controller: controller.descriptionController,
                    context: context,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Obx(
                        () => GestureDetector(
                      onTap: () => controller.uploadMedicine(),
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                          color:controller.isLoadingUpdate.value?AppColor.primaryColor.withOpacity(.2):AppColor.primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          AppString.addMedicine,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
