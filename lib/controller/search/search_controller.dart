import 'package:drugger/model/medicine_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../repositorie/data_source/remote.dart';
import '../../service/all_medicine_serices.dart';
import '../../service/search_medicine_services.dart';
import '../../shared/network/remote/api_manger.dart';


class SearchController extends GetxController
{

    String quary = '';
  List<Medicine> searchList = [];

    MedicineSearch medicineSearch=MedicineSearch() ;
    Medicine? medicine;
  List<Medicine> search() {
    
    medicineSearch.getSearch(sort: 1 ,page: 1,size: 20)
        .then((searchResponces) => {searchList = searchResponces.medicines ?? []})
        .catchError(
      (error) {
        Get.snackbar('message',error);

        debugPrint('Error in Api ${error}');
      },
    );
    return searchList;
  }

  @override
  void onInit() {
    search();
    // getMedicine();
    super.onInit();
  }
}