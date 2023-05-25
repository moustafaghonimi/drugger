import 'package:drugger/constance/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../model/medicine_model.dart';
import '../../repositorie/data_source/remote.dart';
import '../../service/comment_services.dart';
import '../../shared/componant/ui_utlis.dart';
import '../../shared/network/remote/api_manger.dart';
import '../home_controller.dart';
import 'itemDetails_controller.dart';

class CommentController extends GetxController {

  late TextEditingController commentController;
  late GlobalKey<FormState> theKey;
  late final ItemDetailsController controller;

  final AddComment addComments = AddComment();

  var repo = Repo(baseRepositorie: Remote());

  // var isLike = false.obs;
  var isDisliked = false.obs;


  Future<bool> onLikeButtonTapped(bool isLiked) async {
    // isLike.value=isLiked;
    await addComments.addLike(controller.medicine!.id,"64623c0c5cf0a00b2bd23838");

    Get.snackbar('liked',controller.medicine!.id);
    return !isLiked;
  }





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
        controller.medicine!.comments;
        return response;

      } catch (e) {
        print(e);
        hideMassage(context);
        print(e);
        Get.snackbar('error', e.toString());
      }
    }
    update();

commentController.clear();
   }

  @override
  void onInit() {
    controller= Get.put(ItemDetailsController());

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
