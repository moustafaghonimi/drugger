import 'dart:convert';


import 'package:drugger/api/api_constant.dart';
import 'package:http/http.dart' as http;


import '../../model/auth/respones/ForgetPasswordOTP_Response.dart';
import '../../model/auth/respones/LoginResponse.dart';
import '../../model/auth/respones/responseRegister.dart';
import '../base_Repo.dart';

class Remote implements BaseRepositorie {
  @override
  Future<ForgetPasswordOtpResponse> forgetPasswordOTP(String email) async {
    Uri url = Uri.https(ApiConstance.BASE_URL, ApiConstance.ForgetPasswordOTP);
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
    Uri url = Uri.https(ApiConstance.BASE_URL, ApiConstance.Login_URL);

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
    Uri url = Uri.https(ApiConstance.BASE_URL, ApiConstance.Register_URL);

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
      ApiConstance.BASE_URL,
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
}
