
import 'package:drugger/api/api_helper.dart';
import 'package:drugger/model/medicine_model.dart';


class MedicineSearch extends ApiHelper {

  Future getSearch(String query,
      {String sort = "medicineStock", int page = 1, int size = 20}) async {
    MedicineModel medicine = MedicineModel.fromJson(await get(
        url:
        "https://druggerdeployment.vercel.app/medicine?page=$page&size=$size&search=$query&sort=$sort"));
    // Get.snackbar('message', medicine.message);
    print(medicine.message);

    return medicine;
  }
}
