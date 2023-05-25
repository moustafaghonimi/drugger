import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../repositorie/data_source/remote.dart';
import '../../routing/app_routs_name.dart';
import '../../shared/componant/ui_utlis.dart';
import '../../shared/network/remote/api_manger.dart';

class RegisterController extends GetxController{
  var repo=Repo(baseRepositorie: Remote());
  late GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController pharID = TextEditingController();
  late TextEditingController pharName = TextEditingController();
  // late TextEditingController userName = TextEditingController();
  late TextEditingController firstName = TextEditingController();
  late TextEditingController lastName = TextEditingController();
  late TextEditingController email = TextEditingController();
  late TextEditingController password = TextEditingController();
  late TextEditingController cPassword = TextEditingController();
  // late TextEditingController age = TextEditingController();
  // late TextEditingController phone = TextEditingController();

  RxBool passwordVisible = true.obs;
  RxBool cPasswordVisible = true.obs;

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

  changeCPasswordVisible()
  {
    if(cPasswordVisible.value)
    {
      cPasswordVisible(false);
    }
    else{
      cPasswordVisible(true);
    }
  }


  void register(context) async {
    if (formKey.currentState?.validate() == false) {
      return;
    }
    showloding('Loading...', context);
    try {

      var response = await repo.baseRepositorie?.register(
          pharID.text,
          pharName.text,
          // userName.text,
          firstName.text,
          lastName.text,
          email.text,
          password.text,
          cPassword.text
          // age.text,
          // phone.text
      );

      print(response?.message );

      hideMassage(context);

      if (response?.message != null&&response?.message!='User added successfully') {
        showMasage(
            context, "${response?.message}\n${response?.Error}" , 'OK',
                () {
              Get.back();
            });
        Get.snackbar('message', response!.Error.toString());
        return;
      }

      if (response?.user != null ) {
        Get.snackbar('User', response?.user??"");
        Get.offAllNamed(AppRoutes.loginScreen);
      }


    } catch (e) {

      showMasage(
          context, "$e" , 'OK',
              () {
            Get.back();
          });
      Get.snackbar('error', e.toString());
      // hideMassage(context);

    }
  }

  @override
  void onInit() {
     formKey = GlobalKey<FormState>();
     pharID = TextEditingController();
     pharName = TextEditingController();
     // userName = TextEditingController();
     firstName = TextEditingController();
     lastName = TextEditingController();
     email = TextEditingController();
     password = TextEditingController();
     cPassword = TextEditingController();
     // age = TextEditingController();
     // phone = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
     pharID.dispose();
     pharName.dispose();
     // userName.dispose();
     firstName.dispose();
     lastName.dispose();
     email.dispose();
     password.dispose();
     cPassword.dispose();
     // age.dispose();
     // phone.dispose();
    super.dispose();
  }
}