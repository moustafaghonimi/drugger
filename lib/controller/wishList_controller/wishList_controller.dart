import 'dart:convert';

import 'package:drugger/service/wishList_services.dart';
import 'package:get/get.dart';

import '../../model/patchWishListModel.dart';
import '../../model/wishListModel.dart';

class WishListController extends GetxController {
  final WishListService wishListService = WishListService();
  late WishListModel wishListModel;

  RxBool isLoading = false.obs;


  RxList<WishListModel> wishList = <WishListModel>[].obs;

  RxList<Wishlist> add = <Wishlist>[].obs;

  var isLiked = false.obs;
  var isDisliked = false.obs;

  void toggleLike() {
    isLiked.value = !isLiked.value;
    if (isLiked.value) {
      isDisliked.value = false;
    }
  }

  addWishList(String id) async {
    await wishListService.addToWishList(id);

    Get.snackbar('message', id);
  }


  getWishListData() async {
    wishListModel = await wishListService.getWishList();
    if (wishListModel.result != null) {
      if (wishListModel.result.wishlist.isEmpty) {
        for (Wishlist element in wishListModel.result.wishlist) {
          {
            add.add(element);
          }
        }
      }
    }
  }

  // getWishListData()async{
  //   wishList.clear();
  //   result= await wishListService.getWishList();
  //   for(var item in result.wishlist){
  //     wishList.add(item);
  //   }
  // }


  @override
  void onInit() async {
    isLoading(true);
    await getWishListData();
    toggleLike();
    isLoading(false);
    super.onInit();
  }
}
