import 'package:get/get.dart';

import '../../model/medicine_model.dart';
import '../../service/user_medicines_service.dart';

class UserMedicineController extends GetxController
{
  UserMedicineService userMedicineService = UserMedicineService();

  RxList<Medicine> userMedicineList = <Medicine>[].obs;
  getUserMedicine()async{
   var response =   await userMedicineService.getUserMedicineService();
   if(response['message']=="success")
     {
       for(var item in response['Usermedicines'])
         {
           userMedicineList.add(Medicine.fromJson(item));
         }
     }
  }

  @override
  void onInit() {
    getUserMedicine();
    super.onInit();
  }
}