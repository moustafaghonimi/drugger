import 'package:get/get.dart';

import '../../model/medicine_model.dart';
import '../../repositorie/data_source/remote.dart';
import '../../shared/network/remote/api_manger.dart';


class ItemDetailsController extends GetxController{
Medicine? medicine = Get.arguments;

 // RxBool isLiked =true.obs;
 //  var like = [].obs;
  var repo = Repo(baseRepositorie: Remote());

  Future<bool> onLikeButtonTapped(bool isLiked) async{
    try {
      var response = await repo.baseRepositorie?.commentLike(
          medicine!.id,
          // commentId
        "644da405d6178c2f80a19d15"

      );
      Get.snackbar('message',"liked");
      //
      // return response;
      update();
    } catch (e) {
      print(e);
      Get.snackbar('error', e.toString());
    }
    /// send your request here
    // final bool success= await sendRequest();

    /// if failed, you can do nothing
    // return success? !isLiked:isLiked;

    return !isLiked;
  }
  // likeComment(context,commentId) async {
  //   try {
  //     var response = await repo.baseRepositorie?.commentLike(
  //         medicine!.id,
  //         commentId
  //       // "644da405d6178c2f80a19d15"
  //
  //     );
  //     Get.snackbar('message',"liked");
  //
  //     isLiked.value=true;
  //     return response;
  //     update();
  //   } catch (e) {
  //     print(commentId);
  //     print(e);
  //     Get.snackbar('error', e.toString());
  //   }
  // }



  @override
  void onInit() {
    medicine;
    update();
    super.onInit();
  }
}

