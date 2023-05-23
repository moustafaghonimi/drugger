import 'package:get/get.dart';

import '../controller/profile/profile_controller.dart';
import '../controller/cart/cart_controller.dart';
import '../controller/home_controller.dart';
import '../controller/user_medicine/user_medicine_controller.dart';

class HomeBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(),fenix: true);
    Get.lazyPut(() => UserMedicineController(),fenix: true);
    Get.lazyPut(() => CartController(),fenix: true);
    Get.lazyPut(() => ProfileController(),fenix: true);
  }


}