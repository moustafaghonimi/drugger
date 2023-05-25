import 'package:drugger/api/api_helper.dart';

import '../api/api_constant.dart';

class ProfileService extends ApiHelper{
  Future getUserData()async{
    return await get(url: ApiConstance.userProfile,headers: {
      "authorization" : token
    });
  }
}