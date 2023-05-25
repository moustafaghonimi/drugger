import 'package:drugger/routing/app_routs_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../api/api_constant.dart';
import '../../constance/app_color.dart';
import '../../repositorie/data_source/remote.dart';
import '../../service/resetPasswordServices.dart';
import '../../service/services.dart';
import '../../shared/componant/ui_utlis.dart';
import '../../shared/network/remote/api_manger.dart';

class ResetPassProfileController extends GetxController {
  MyServices myServices = Get.find();

  final ResetPasswordServices resetPasswordServices =ResetPasswordServices();
  // Repo repo = Repo(baseRepositorie: Remote());

  late GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController newPasswordController;
  late TextEditingController oldPasswordController;


  @override
  void onInit() {
    newPasswordController = TextEditingController();
    oldPasswordController = TextEditingController();
    formKey = GlobalKey<FormState>();
    super.onInit();
  }


  // final OtbController controller = Get.find();
  // final OtbController c =  Get.put(OtbController());


  void resetPasswordProfileValidation(context) async {
    if (formKey.currentState?.validate() == false) {
      return;
    }
    showloding('Loading...', context);

    try {
      var response = await resetPasswordServices.updatePassProfile(
        oldPasswordController.text, newPasswordController.text,);
      hideMassage(context);
      // Get.offAllNamed(AppRoutes.loginScreen);

      if (response?.status == 'success') {
        Get.snackbar('status', response!.status.toString());
        Get.snackbar('message', response.message.toString());
        myServices.sharedPreferences.remove('token');
        token='';
        Get.offAllNamed(AppRoutes.loginScreen);
      }
      // if (
      //     response?.message != 'Password updated successfully') {
      //   Get.snackbar('message', response!.message.toString());
      //   showMasage(
      //       context, "${response.message}\n" , 'OK',
      //           () {
      //         Get.back();
      //       });
      //
      //   return;
      // }
    } catch (e) {
      hideMassage(context);
print(e);
      Get.snackbar('error', e.toString());
      showMasage(
          context, "$e" , 'OK',
              () {
            Get.back();
          });

    }
  }

  @override
  void dispose() {
    newPasswordController.dispose();
    oldPasswordController.dispose();
    super.dispose();
  }
}
