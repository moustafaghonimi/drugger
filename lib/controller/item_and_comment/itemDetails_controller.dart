import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../model/medicine_model.dart';

class ItemDetailsController extends GetxController{

  Medicine? medicine = Get.arguments;




  @override
  void onInit() {
    medicine;

    super.onInit();
  }
}

