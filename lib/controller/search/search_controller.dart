import 'package:drugger/model/medicine_model.dart';
import 'package:get/get.dart';
import '../../service/search_medicine_services.dart';

class SearchController extends GetxController {
  RxString query = ''.obs;

  var isLoading = false.obs;

  List<Medicine> searchList = [];

  MedicineSearch medicineSearch = MedicineSearch();

  Medicine? medicine;
  bool valueHightExp = false;
  bool valueLowExp = false;

  bool changeSort(bool value1, bool value2) {
    if (value1 == false && value2 == true) {
      return true;
    } else {
      return false;
    }
  }

  List<Medicine> search() {
    medicineSearch
        .getSearch(query.value,
            sort: changeSort(valueHightExp, valueLowExp)
                ? "medicineExpireDate"
                : "-medicineExpireDate",
            page:1&2&3&4&5&6&7&8&9&10 ,
            size: 10|20)
        .then(
            (searchResponces) => {searchList = searchResponces.medicines ?? []})
        .catchError(
      (error) {
        print(error);
        // Get.snackbar('message', error);
      },
    );
    return searchList;
  }

  @override
  void onInit() {
    search();

    query;
    searchList;

    super.onInit();
  }
}
