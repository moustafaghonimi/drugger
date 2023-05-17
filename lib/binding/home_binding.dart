import 'package:get/get.dart';

import '../controller/add_medicine_controller.dart';
import '../controller/cart/cart_controller.dart';
import '../controller/home_controller.dart';

class HomeBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(),fenix: true);
    Get.lazyPut(() => AddMedicineController(),fenix: true);
    Get.lazyPut(() => CartController(),fenix: true);
  }


}