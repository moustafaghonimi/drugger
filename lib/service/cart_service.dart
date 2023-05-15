import 'package:drugger/api/api_constant.dart';
import 'package:drugger/api/api_helper.dart';
import 'package:get/get.dart';

import '../model/cart_product_model.dart';

class CartService extends ApiHelper {
  Future getAllCart() async {
    CartProductModel cartProductModel =
        CartProductModel.fromJson(await get(url: ApiConstance.getAllCart , ));
  }

// Future getMedicine({required int page ,required int size})async{
//   MedicineModel medicine = MedicineModel.fromJson(await get(url: "${ApiConstance.baseURL}/medicine?page=$page&size=$size"));
//   return medicine ;
// }
}
