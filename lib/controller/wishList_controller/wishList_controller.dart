import 'dart:convert';

import 'package:drugger/service/wishList_services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/patchWishListModel.dart';
import '../../model/wishListModel.dart';

class WishListController extends GetxController {
  final WishListService wishListService = WishListService();
  late WishListModel wishListModel;

  RxBool isLoading = false.obs;

  RxList<String> localList = RxList<String>([]);

  RxList<Wishlist> favorite = <Wishlist>[].obs;
  var isLiked = false.obs;
  var isDisliked = false.obs;

  void toggleLike() {
    isLiked.value = !isLiked.value;
    if (isLiked.value) {
      isDisliked.value = false;
    }
  }

  void loadList() async {
    final prefs = await SharedPreferences.getInstance();
    localList.value = prefs.getStringList('localList2') ?? [];
  }

  void removeFromList(int index) async {
    localList.removeAt(index);
    _saveList();
  }

  void _saveList() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('localList2', localList.toList());
  }

  addWishList(String id) async {
    var response = await wishListService.addToWishList(id);
    localList.add(id);
    _saveList();
    await getWishListData();
    update();

  }


  removeWishList(String medicineID) async {
    localList.remove(medicineID);

    Wishlist wishlist=favorite.where((element) => medicineID==element.sid).first;
    favorite.remove(wishlist);
    var response = await wishListService.removeFromWishList(medicineID);


    _saveList();
      Get.snackbar('message removed', medicineID);
    update();
  }

  getWishListData() async {
    favorite.clear();
    wishListModel = await wishListService.getWishList();
    for(var item in wishListModel.result.wishlist){
       {
          favorite.add(item);
          _saveList();
          update();

      }
    }
  }

  @override
  void onInit() async {
    localList;

    isLoading(true);
    await getWishListData();
    toggleLike();
    isLoading(false);
    super.onInit();
    loadList();

  }
}
