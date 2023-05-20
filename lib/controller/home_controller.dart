import 'package:drugger/constance/string_constant.dart';
import 'package:drugger/controller/wishList_controller/wishList_controller.dart';
import 'package:drugger/model/medicine_model.dart';
import 'package:get/get.dart';

import '../service/all_medicine_serices.dart';

class HomeController extends GetxController
{
  WishListController controller=Get.put(WishListController());
  RxBool isLoading = false.obs;
  RxBool isLoadingMore = false.obs ;
  late MedicineModel medicineModel;
  List<Medicine> homeMedicines = <Medicine>[].obs ;
  RxInt selectedCategoryIndex = 0.obs ;

  late int currentScreen ;
  int size = 3 ;
  GetAllMedicine getAllMedicineService = GetAllMedicine() ;

  getMedicine()async{
    currentScreen++ ;
    medicineModel = await getAllMedicineService.getMedicine(page: currentScreen,size: size);
    if(medicineModel.message=='success'){
      if(medicineModel.medicines.isNotEmpty)
        {
          for (Medicine element in medicineModel.medicines) {
            if(element.medicineType.toLowerCase()==AppString.category[selectedCategoryIndex.value].toLowerCase()||selectedCategoryIndex.value==0)
              {
                homeMedicines.add(element);
              }

          }
          if(homeMedicines.length<3&&selectedCategoryIndex<10)
            {
              getMedicine();
            }
        }
      }
    isLoading(false);
  }


  changeSelectedCategory(int index)async{
    if(index == selectedCategoryIndex.value )return;
    selectedCategoryIndex.value = index ;
    currentScreen = 0 ;
    homeMedicines.clear();
    await getMedicine();
  }

  @override
  void onInit() {
    currentScreen = 0 ;
    isLoading(true);
    getMedicine();
    super.onInit();
    controller.loadList();

  }
}