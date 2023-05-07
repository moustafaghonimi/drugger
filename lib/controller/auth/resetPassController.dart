import 'package:drugger/routing/app_routs_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../constance/app_color.dart';
import '../../repositorie/data_source/remote.dart';
import '../../service/services.dart';
import '../../shared/componant/ui_utlis.dart';
import '../../shared/network/remote/api_manger.dart';
import 'otb_controller.dart';

class ResetPassController extends GetxController {
  MyServices myServices = Get.find();

  RxBool passwordVisible = true.obs;

  Repo repo = Repo(baseRepositorie: Remote());
  late GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController passwordController;
  late TextEditingController otpCodeController;

  // String? email;

  @override
  void onInit() {
    passwordController = TextEditingController();
    otpCodeController = TextEditingController();
    formKey = GlobalKey<FormState>();
    super.onInit();
  }

  changeVisible() {
    if (passwordVisible.value) {
      passwordVisible(false);
    } else {
      passwordVisible(true);
    }
  }

  final OtbController controller = Get.find();
  final OtbController c =  Get.put(OtbController());


  void resetPasswordOtpValidation(context) async {
    if (formKey.currentState?.validate() == false) {
      return;
    }
    showloding('Loading...', context);

    try {
      var response = await repo.baseRepositorie?.resetPassword(
          otpCodeController.text, passwordController.text, controller.email!);
      hideMassage(context);
      if (response?.status != null) {
        Get.snackbar('status', response!.status.toString());
        Get.snackbar('message', response.message.toString());
        Get.offNamed(AppRoutes.loginScreen);
      }
      if (response?.message == null ||
          response?.message != 'Password has been changed successfully') {
        Get.snackbar('message', response!.message.toString());
        showMasage(
            context, "${response.message}\n" , 'OK',
                () {
              Get.back();
            });

        return;
      }
    } catch (e) {
      hideMassage(context);

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
    passwordController.dispose();
    otpCodeController.dispose();
    super.dispose();
  }
}
