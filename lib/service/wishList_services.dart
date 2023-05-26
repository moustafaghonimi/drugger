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

  Future getWishListService()async{
    return  WishListModel.fromJson(await get(url: ApiConstance.getWishList ,headers: headers));

  }


  Future<bool> addOrRemoveWishList(String id)async{
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




}
