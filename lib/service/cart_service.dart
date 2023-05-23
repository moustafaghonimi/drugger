import 'dart:convert';

import 'package:drugger/api/api_constant.dart';
import 'package:drugger/api/api_helper.dart';
import 'package:drugger/service/services.dart';

import '../model/cart_product_model.dart';

class CartService extends ApiHelper {
  MyServices myServices = MyServices();
  Map<String,String> headers = {
    "Content-Type":"application/json",
  'authorization' : token,
  };

  Future<CartProductModel> getAllCart() async {
    CartProductModel cartProductModel =
        CartProductModel.fromJson(await get(url: ApiConstance.getAllCart ,headers: headers));
    return cartProductModel ;
  }

  Future<bool> updateQuantity(String id , int newQ)async{
    var response = await update(url: "${ApiConstance.updateQuantity}/${id}",
      body: jsonEncode({
        "quantity":newQ.toString(),
      } ),headers: headers,);
    print(response.toString());
    if(response['message']=="done")
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
  
  Future getUserOrdersService()async
  {
    return await get(url:ApiConstance.userOrder,headers: headers) ;

  }

}
