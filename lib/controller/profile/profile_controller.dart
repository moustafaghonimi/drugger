import 'package:drugger/api/api_constant.dart';
import 'package:drugger/service/services.dart';
import 'package:get/get.dart';

import '../../model/user_model.dart';
import '../../routing/app_routs_name.dart';
import '../../service/profile_service.dart';

class ProfileController extends GetxController
{

  MyServices myServices = Get.find();

  ProfileService profileService =ProfileService();
  late UserModel profileData ;

  RxBool isLoading =false.obs ;

  getUserData()async{
    // print(await profileService.getUserData());
    profileData = UserModel.fromJson(await profileService.getUserData());
    print("object");
    print(profileData.message);
    isLoading(false);
  }


  gotToUpdateProfile()
  {
    Get.toNamed(AppRoutes.updateProfileScreen,arguments: {
      'profileData': profileData
    });
  }


  logOut()
  {
    print('logOut');
    myServices.sharedPreferences.remove('token');
    token='';
    Get.offAllNamed(AppRoutes.loginScreen);
  }

  @override
  void onInit() {
    isLoading(true);
    getUserData();
    super.onInit();
  }
}