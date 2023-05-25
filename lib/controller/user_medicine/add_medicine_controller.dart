import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/function/format_date.dart';
import '../../service/user_medicines_service.dart';

class AddMedicineController extends GetxController {
  late TextEditingController nameController;
  late TextEditingController dateController;

  late TextEditingController stockController;

  late TextEditingController priceController;

  late TextEditingController descriptionController;

  late XFile? pickedFile;

  late GlobalKey<FormState> globalKey;

  final selectedType = ''.obs;
  RxBool isLoadingUpdate =false.obs ;

  List<String> type = [
    "Capsules",
    "Tablets",
    "Injections",
    "Syrups",
    "Inhalers",
    "Topical preparations",
    "Drops",
    "Powders",
    "Sprays",
    "Solutions",
  ];

  changeType(value)
  {
    selectedType.value = value ;
  }

  removeImage()
  {
    pickedFile = null ;
    update();
  }

  Future pickImage(bool camera) async {
    final ImagePicker picker = ImagePicker();
    pickedFile = (camera == true
        ? await picker.pickImage(source: ImageSource.camera)
        : await picker.pickImage(source: ImageSource.gallery));
    update();
    // if (pickedFile != null) {
    //   return File(pickedFile.path);
    // }
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2040),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Get.isDarkMode ? ThemeData.dark() : ThemeData.light(),
          child: child!,
        );
      },
    );
    dateController.text = formatDate(selected!).toString();
  }

  uploadMedicine()async {
    if (globalKey.currentState!.validate()) {
      isLoadingUpdate.value =true ;
      if (pickedFile != null) {
        print("test");
        bool success = await UserMedicineService.sendMedicineData(
            nameController.text,
            selectedType.value,
            descriptionController.text,
            dateController.text,
            stockController.text,
            priceController.text,
            pickedFile!
        );
       if(success)
         {

           Get.snackbar('Done', "Your Medicine has been published");
             nameController.clear();
             dateController.clear();
             stockController.clear();
             priceController.clear();
             descriptionController.clear();
            pickedFile=null;
            selectedType.value = '';
            update();
         }
      } else {
        Get.snackbar('you Must Choose a image', '');
      }
      isLoadingUpdate(false) ;
    }
  }

  @override
  void onInit() {
    dateController = TextEditingController();
    nameController = TextEditingController();
    stockController = TextEditingController();
    priceController = TextEditingController();
    descriptionController = TextEditingController();
    globalKey = GlobalKey<FormState>();
    pickedFile = null;
    super.onInit();
  }
  @override
  void dispose() {
    nameController.dispose();
    dateController.dispose();
    stockController.dispose();
    priceController.dispose();
    descriptionController.dispose();

    super.dispose();
  }
}
