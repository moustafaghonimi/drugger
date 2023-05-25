import 'package:drugger/api/api_constant.dart';
import 'package:drugger/api/api_helper.dart';
import 'package:drugger/model/medicine_model.dart';

class GetAllMedicine extends ApiHelper
{
   Future getMedicine({required int page ,required int size})async{
   MedicineModel medicine = MedicineModel.fromJson(await get(url: "${ApiConstance.baseURLMed}/medicine?page=$page&size=$size"));
   return medicine ;
  }
}