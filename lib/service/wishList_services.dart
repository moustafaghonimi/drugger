import 'dart:convert';

import 'package:drugger/api/api_constant.dart';
import 'package:drugger/api/api_helper.dart';

import '../model/cart_product_model.dart';
import '../model/commentModel.dart';
import '../model/wishListModel.dart';

class WishListService extends ApiHelper {
  Map<String,String> headers = {
    "Content-Type":"application/json",
    'authorization' : token,
  };

  Future getWishList()async{
    WishListModel result = WishListModel.fromJson(await get(url: ApiConstance.getWishList ,headers: headers));
    return result ;
  }

  // Future<Result> getWishList() async {
  //   Result result =
  //   Result.fromJson(await get(url: ApiConstance.getWishList ,headers: headers));
  //   return result ;
  // }

  Future<bool> addToWishList(String id)async{
    var response = await update(url: "${ApiConstance.baseURL}/medicine/$id/WishList",
      body: jsonEncode({
      } ),headers: headers,);
    print(response.toString());
    if(response['message']=="success")
    {
      return true ;
    }
    return false;
  }

  Future<bool> removeFromWishList(String id)async{
    var response = await update(url: "${ApiConstance.baseURL}/medicine/${id}/removeWishList",
      body: jsonEncode({
      } ),headers: headers,);
    print(response.toString());
    if(response['message']=="success")
    {
      return true ;
    }
    return false;
  }



}
