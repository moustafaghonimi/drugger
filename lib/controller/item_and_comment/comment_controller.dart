import 'package:drugger/constance/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../model/medicine_model.dart';
import '../../repositorie/data_source/remote.dart';
import '../../shared/componant/ui_utlis.dart';
import '../../shared/network/remote/api_manger.dart';
import '../home_controller.dart';
import 'itemDetails_controller.dart';

class CommentController extends GetxController {

  late TextEditingController commentController;
  late GlobalKey<FormState> theKey;
  late final ItemDetailsController controller;

  var repo = Repo(baseRepositorie: Remote());

   addComment(context) async {
    if (theKey.currentState!.validate()) {
      showloding('Loading...', context);
      try {
        var response = await repo.baseRepositorie?.addComment(
            commentController.text,
            controller.medicine!.id
            // "644da405d6178c2f80a19d15"

            );
        hideMassage(context);
        Get.snackbar('message',"Comment is added");

        return response;

      } catch (e) {
        print(e);
        hideMassage(context);
        print(e);
        Get.snackbar('error', e.toString());
      }
    }


   }

  @override
  void onInit() {
    controller= Get.put(ItemDetailsController());
    // medicine;
    // Get.snackbar('message', medicine!.id);
    update();
    commentController = TextEditingController();
    theKey = GlobalKey<FormState>();
    super.onInit();
  }

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }
}
