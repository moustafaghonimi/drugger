import 'package:drugger/api/api_constant.dart';
import 'package:drugger/api/api_helper.dart';
import 'package:drugger/model/medicine_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MedicineSearch extends ApiHelper
{
  // String query
  //search=$query&
  Future getSearch({var sort, int page=1, int size=10 })async{
    MedicineModel medicine = MedicineModel.fromJson(await get(url: "${ApiConstance.baseURL}/medicine?page=$page&size=$size&sort=$sort"));
    Get.snackbar('message',medicine.message);
    print(medicine.message);

    return medicine ;
  }
}