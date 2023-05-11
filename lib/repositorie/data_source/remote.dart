import 'dart:convert';


import 'package:drugger/api/api_constant.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:http/http.dart' as http;


import '../../model/auth/respones/ForgetPasswordOTP_Response.dart';
import '../../model/auth/respones/LoginResponse.dart';
import '../../model/auth/respones/responseRegister.dart';
import '../../model/medicine_model.dart';
import '../base_Repo.dart';

class Remote implements BaseRepositorie {
  @override
  Future<ForgetPasswordOtpResponse> forgetPasswordOTP(String email) async {
    Uri url = Uri.https(ApiConstance.base_Url, ApiConstance.forgetPasswordOTPUrl);
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "email": email,
      }),
    );
    return ForgetPasswordOtpResponse.fromJson(jsonDecode(response.body));
  }
//////////////////////////////////////////////////////////////////////////////////////
  @override
  Future<LoginResponse> login(String id, String Email, String Password) async {
    Uri url = Uri.https(ApiConstance.base_Url, ApiConstance.loginUrl);

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, String>{"pharId": id, "email": Email, "password": Password}),
    );
    return LoginResponse.fromJson(jsonDecode(response.body));
  }
//////////////////////////////////////////////////////////////////////////////////////

  @override
  Future<ResponseRegister> register(
      String pharId,
      String pharName,
      String userName,
      String firstName,
      String lastName,
      String email,
      String password,
      String cPassword,
      String age,
      String phone) async {
    Uri url = Uri.https(ApiConstance.base_Url, ApiConstance.registerUrl);

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "pharId": pharId,
        "pharName": pharName,
        "userName": userName,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
        "cPassword": cPassword,
        "age": age,
        "phone": phone
      }),
    );
    return ResponseRegister.fromJson(jsonDecode(response.body));
  }
//////////////////////////////////////////////////////////////////////////////////////

  @override
  Future<ForgetPasswordOtpResponse> resetPassword(
      String otp, String pass, String email) async {
    Uri url = Uri.https(
      ApiConstance.base_Url,
      '/auth/resetPasswordOTP/${email}',
    );
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "otp": otp,
        "password": pass,
      }),
    );
    return ForgetPasswordOtpResponse.fromJson(jsonDecode(response.body));
  }
  //////////////////////////////////////////////////////////////
  @override
  Future<MedicineModel> getSearch(String query,{var sort, int page=1, int size=10 ,var filter}) async{
    Uri URL=Uri.https(ApiConstance.base_Url,ApiConstance.searchUrl,{
      'search':query,
      'sort':sort,
      'page':page,
      'size':size,
      'filter':filter,
    });
    Response search=(await http.get(URL)) as Response;
    try{
      var json=jsonDecode(search.body);
      MedicineModel medicineModel=MedicineModel.fromJson(json);
      return medicineModel;
    }
    catch(e){
      print(e);
      throw e;
    }
  }
}
