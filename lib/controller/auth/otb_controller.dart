import 'package:drugger/routing/app_routs_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../constance/app_color.dart';
import '../../repositorie/data_source/remote.dart';
import '../../service/services.dart';
import '../../shared/componant/ui_utlis.dart';
import '../../shared/network/remote/api_manger.dart';

class OtbController extends GetxController{
  MyServices myServices = Get.find();

  Repo repo=Repo(baseRepositorie: Remote());
  late GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  String? email;

  @override
  void onInit() {
    emailController = TextEditingController();
    formKey = GlobalKey<FormState>();
    super.onInit();
  }

  void forgetPasswordOtpValidation(context) async {
    if (formKey.currentState?.validate() == false) {
      return;
    }
    Get.snackbar('Loading', "Call server To Get Otp code",
        backgroundColor: AppColor.primaryColor,
        progressIndicatorBackgroundColor: AppColor.onPrimaryColor);
    showloding('Loading...', context);

    try {
      var response = await repo.baseRepositorie?.forgetPasswordOTP(
        emailController.text,
      );
      hideMassage(context);

      if (response?.status != null) {
        Get.snackbar('status', response!.status.toString());
        Get.offNamed(AppRoutes.resetPass);
      }
      if (response?.message == null ||
          response?.message != 'OTP code have been sent to your account') {
        Get.snackbar('Email  Is Incorrect', response!.message.toString());
        showMasage(
            context, "${response.message}\n" , 'OK',
                () {
              Get.back();
            });

        return;
      }

    } catch (e) {
      // hideMassage(context);
      print(e);
      Get.snackbar('error', e.toString());
    }
  }




  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

}