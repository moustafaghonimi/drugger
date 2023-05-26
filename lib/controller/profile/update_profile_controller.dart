import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../model/user_model.dart';

class UpdateProfileController extends GetxController
{
  late UserModel userData ;
  late TextEditingController userName  ;
  late TextEditingController firstName  ;
  late TextEditingController lastName  ;
  late TextEditingController pharName  ;
  late TextEditingController email  ;
  late TextEditingController age  ;
  late TextEditingController phone  ;
  late TextEditingController gender ;

  initValues(UserModel userData)
  {
    print(userData.status);
    firstName.text = userData.result.firstName;
    lastName.text = userData.result.lastName ;
    userName.text = userData.result.userName??"";
    pharName.text= userData.result.pharName ;
    email.text = userData.result.email ;
    age.text = userData.result.age.toString() ;
    phone.text = userData.result.phone.toString() ;
    gender.text = userData.result.gender ;
    update();
  }

  @override
  void onInit() {
      userData = Get.arguments['profileData'];
      userName =TextEditingController() ;
      firstName =TextEditingController() ;
      lastName =TextEditingController() ;
      pharName =TextEditingController() ;
      email =TextEditingController() ;
      age =TextEditingController() ;
      phone =TextEditingController() ;
      gender =TextEditingController();
      initValues(userData);
    super.onInit();
  }
}