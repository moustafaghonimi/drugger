import 'dart:convert';

import 'package:drugger/api/api_constant.dart';
import 'package:drugger/api/api_helper.dart';

import '../model/cart_product_model.dart';
import '../model/commentModel.dart';
import '../model/wishListModel.dart';

class WishListService extends ApiHelper {
  Map<String,String> headers = {
    "Content-Type":"application/json",
    'authorization' : 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0NTUxNDgyZGM1ZWZjODI4YmMyZTBmMCIsInVzZXJfbmFtZSI6Im1vc3RhZmEgZ2hvbmFpbWkiLCJlbWFpbCI6Im1vc3RhZmFnaG9uaW1pMjJAZ21haWwuY29tIiwiaWF0IjoxNjgzNDcwMzY2fQ.7mxTeEBB4hIfb8dvomQ1l4rAPFd8lAJU-cILJAGjn2E',
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
