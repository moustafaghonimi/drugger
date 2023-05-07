import 'package:drugger/model/medicine_model.dart';
import 'package:get/get.dart';

import '../service/all_medicine_serices.dart';

class HomeController extends GetxController
{
  RxBool isLoading = false.obs;
  late MedicineModel medicineModel;

  int currentScreen = 1 ;
  int size = 5 ;
  GetAllMedicine getAllMedicineService=GetAllMedicine() ;
  getMedicine()async{
    medicineModel = await getAllMedicineService.getMedicine(page: 1,size: 10);

    print(medicineModel.medicines[0].id);
  }

  @override
  void onInit() {
    isLoading(true);
    getMedicine();
    super.onInit();
  }
}