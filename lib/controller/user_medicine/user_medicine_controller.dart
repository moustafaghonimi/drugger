import 'package:drugger/routing/app_routs_name.dart';
import 'package:get/get.dart';

import '../../model/medicine_model.dart';
import '../../service/user_medicines_service.dart';

class UserMedicineController extends GetxController
{
  UserMedicineService userMedicineService = UserMedicineService();

  RxList<Medicine> userMedicineList = <Medicine>[].obs;
  getUserMedicine()async{
   var response = await userMedicineService.getUserMedicineService();
   if(response['message']=="success")
     {
       for(var item in response['Usermedicines'])
         {
           userMedicineList.add(Medicine.fromJson(item));
         }
     }
  }

  goToEditMedicine(Medicine medicine)
  {
    Get.toNamed(AppRoutes.addNewMedicine,arguments: medicine);
  }
  goToAddMedicine()
  {
    Get.toNamed(AppRoutes.addNewMedicine,arguments: null);
  }
  deleteMedicine(Medicine medicine)
  {
    userMedicineList.removeWhere((element) => element.id==medicine.id);

  }

  @override
  void onInit() {
    getUserMedicine();
    super.onInit();
  }
}