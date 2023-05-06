import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../repositorie/data_source/remote.dart';
import '../../service/services.dart';
import '../../shared/componant/ui_utlis.dart';
import '../../shared/network/remote/api_manger.dart';

class LoginController extends GetxController{

  MyServices myServices = Get.find();


  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController pharmacyIDController;
  RxBool passwordVisible = true.obs;

  late GlobalKey<FormState> formKey;
  var repo=Repo(baseRepositorie: Remote());


  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    pharmacyIDController = TextEditingController();

    formKey = GlobalKey<FormState>();
    // print("login controller init");
    super.onInit();
  }

  changeVisible()
  {
    if(passwordVisible.value)
      {
        passwordVisible(false);
      }
    else{
      passwordVisible(true);
    }
  }

  login (context) async{
      if (formKey.currentState!.validate()) {
        showloding('Loading...', context);
        try {
          var response = await repo.baseRepositorie?.login(
              pharmacyIDController.text,
              emailController.text,
              passwordController.text
          );
          hideMassage(context);

          var authorization=response?.authorization;

          if (response?.message != null && response?.message!='Logged in successfully') {
            showMasage(
                context, response?.message ?? "Email OR Password not correct !", 'OK',
                    () {
                  Get.back();
                });
            Get.snackbar('message', response!.message.toString());
            return;
          }
          if (authorization?.token != null ) {
            Get.snackbar('token', authorization?.token??"");
          }
          myServices.sharedPreferences.setString("token", authorization?.token ?? "token null");
          // print(sharedPref);
          // showMasage(context, response.token??'', 'ok', () {Get.back(); });

          //TODO
          // Get.off(() => MainPage_bottomNavigation());

        } catch (e) {
          Get.snackbar('error', e.toString());
        }
      }

  }




  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    pharmacyIDController.dispose();
    super.dispose();
  }
}