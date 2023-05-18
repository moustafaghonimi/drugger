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
    var response = await update(url: "${ApiConstance.baseURL}/medicine/${id}/WishList",
      body: jsonEncode({
      } ),headers: headers,);
    print(response.toString());
    if(response['message']=="success")
    {
      return true ;
    }
    return false;
  }

  Future<Map<String,dynamic>> addToCartService(String medicineID ,String quantity )async
  {
    var response =await post(url: ApiConstance.cart, body:
    {
      "medicineId":medicineID.toString(),
      "quantity":quantity.toString()
    },

        headers: {
          "Content-Type":"application/json",
          "authorization":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0NWZhNmFkNzkyN2FlN2NmN2E3ZTgwNSIsInVzZXJfbmFtZSI6Im1vc3RhZmExMiIsImVtYWlsIjoibW9zdGFmYXNhbWlyMTIzMUBnbWFpbC5jb20iLCJpYXQiOjE2ODQxOTk3ODR9.VpGRAhU9Lp9yZCTJqfh7LEAtDkqvWSHHTTCVRHZ8lc8"
        }
    );
    return response ;
  }

  Future clearAllCartService()async{
    return await put(url: ApiConstance.clearAllCart,headers:{
      "Content-Type":"application/json",
      "authorization":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0NWZhNmFkNzkyN2FlN2NmN2E3ZTgwNSIsInVzZXJfbmFtZSI6Im1vc3RhZmExMiIsImVtYWlsIjoibW9zdGFmYXNhbWlyMTIzMUBnbWFpbC5jb20iLCJpYXQiOjE2ODQxOTk3ODR9.VpGRAhU9Lp9yZCTJqfh7LEAtDkqvWSHHTTCVRHZ8lc8"
    } );
  }

  Future clearOneItemService(String medicineID)async{
    return await update(url:ApiConstance.clearOneItem,headers: {
      "Content-Type":"application/json",
      "authorization":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0NWZhNmFkNzkyN2FlN2NmN2E3ZTgwNSIsInVzZXJfbmFtZSI6Im1vc3RhZmExMiIsImVtYWlsIjoibW9zdGFmYXNhbWlyMTIzMUBnbWFpbC5jb20iLCJpYXQiOjE2ODQxOTk3ODR9.VpGRAhU9Lp9yZCTJqfh7LEAtDkqvWSHHTTCVRHZ8lc8"
    },body: jsonEncode({
      "medicineId":medicineID
    } ) );
  }

  Future createOrderService(String address,List<String> phone,String paymentType )async
  {
    return await post(url: ApiConstance.createOrder, body: {
      "address":address,
      "phone":phone,
      "paymentType":paymentType
    },headers:{
      "Content-Type":"application/json",
      "authorization":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0NWZhNmFkNzkyN2FlN2NmN2E3ZTgwNSIsInVzZXJfbmFtZSI6Im1vc3RhZmExMiIsImVtYWlsIjoibW9zdGFmYXNhbWlyMTIzMUBnbWFpbC5jb20iLCJpYXQiOjE2ODQxOTk3ODR9.VpGRAhU9Lp9yZCTJqfh7LEAtDkqvWSHHTTCVRHZ8lc8"
    } );
  }



}
