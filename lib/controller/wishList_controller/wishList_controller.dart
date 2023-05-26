
import 'package:drugger/service/wishList_services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/wishListModel.dart';

class WishListController extends GetxController {
  final WishListService wishListService = WishListService();
  late WishListModel wishListModel;

  RxBool isLoading = false.obs;


  RxList<String> isInFavorite = <String>[].obs;

  RxList<Wishlist> wishList = <Wishlist>[].obs;




  addOrRemoveWishList(String id)async{

    if(!isInFavorite.contains(id))
      {
        var response = await wishListService.addOrRemoveWishList(id);
        Get.snackbar('message removed', id);
        isInFavorite.remove(id);
        await getWishListData();
      }
    else
      {
        isInFavorite.remove(id);
        Wishlist wishlist=wishList.where((element) => id==element.sid).first;
        wishList.remove(wishlist);
        var response = await wishListService.addOrRemoveWishList(id);
      }
    update();
  }



  getWishListData() async {
    wishList.clear();
    wishListModel = await wishListService.getWishListService();
    for(var item in wishListModel.result.wishlist){
      {
        isInFavorite.add(item.sid);
        wishList.add(item);
        update();

      }
    }
  }

  @override
  void onInit() async {
    isLoading(true);
    await getWishListData();
    isLoading(false);
    super.onInit();

  }
}
