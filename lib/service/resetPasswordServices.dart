import 'dart:convert';

import 'package:drugger/api/api_constant.dart';
import 'package:drugger/api/api_helper.dart';

import '../model/cart_product_model.dart';
import '../model/commentModel.dart';
import '../model/wishListModel.dart';

class ResetPasswordServices extends ApiHelper {
  Map<String, String> headers = {
    "Content-Type": "application/json",
    'authorization': token,
  };

  // Future getWishList()async{
  //   WishListModel result = WishListModel.fromJson(await get(url: ApiConstance.getWishList ,headers: headers));
  //   return result ;
  // }
  //
  // // Future<Result> getWishList() async {
  // //   Result result =
  // //   Result.fromJson(await get(url: ApiConstance.getWishList ,headers: headers));
  // //   return result ;
  // // }
  //
  // Future updatePassProfile(String oldPass,String newPass)async{
  //   return await update(url:ApiConstance.updatePassProfile,headers: {
  //     "Content-Type":"application/json",
  //     "authorization":token
  //   },body: jsonEncode({
  //     "oldPassword": oldPass, "newPassword": newPass
  //   } ) );
  // }

  Future updatePassProfile(String oldPass,String newPass)async{
    var response = await update(
      url: "${ApiConstance.baseURL}/phar/changePassword",
      body: jsonEncode({"oldPassword": oldPass, "newPassword": newPass}),
      headers: headers,
    );
    print(response.toString());
    if (response['message'] == "success") {
return response;
    }}
//
//     // return await update(url:ApiConstance.updatePassProfile,headers: {
//     //   "Content-Type":"application/json",
//     //   "authorization":token
//     // },body: jsonEncode({
//     //   "oldPassword":oldPass,
//     //   "newPassword":newPass
//     // } ) );
//   }

  // Future<bool> removeFromWishList(String oldPass, String newPass) async {
  //   var response = await update(
  //     url: "${ApiConstance.baseURL}/phar/changePassword",
  //     body: jsonEncode({"oldPassword": oldPass, "newPassword": newPass}),
  //     headers: headers,
  //   );
  //   print(response.toString());
  //   if (response['message'] == "success") {
  //     return true;
  //   }
  //   return false;
  // }
}
