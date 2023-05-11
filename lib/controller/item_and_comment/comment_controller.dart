import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../model/medicine_model.dart';

class CommentController extends GetxController{

  Medicine? medicine = Get.arguments;
  late TextEditingController commentController;
  // late GlobalKey<FormState> formKey;



  @override
  void onInit() {
    medicine;
    commentController = TextEditingController();
    // formKey = GlobalKey<FormState>();

    super.onInit();
  }
  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }
}

