import 'package:drugger/api/api_helper.dart';

import '../api/api_constant.dart';

class ProfileService extends ApiHelper{
  Future getUserData()async{
    return await get(url: ApiConstance.userProfile,headers: {
      "authorization" : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0NWZhNmFkNzkyN2FlN2NmN2E3ZTgwNSIsImVtYWlsIjoibW9zdGFmYXNhbWlyMTIzMUBnbWFpbC5jb20iLCJpYXQiOjE2ODQ1MTM0ODN9.fpCsX-7duB5hOVPi9NeQ8NnXD8Lh0KTbIjwKMK5iPTY"
    });
  }
}