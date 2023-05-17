import 'dart:convert';
import 'dart:math';

import 'package:drugger/api/api_constant.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:http/http.dart' as http;

import '../../model/auth/respones/ForgetPasswordOTP_Response.dart';
import '../../model/auth/respones/LoginResponse.dart';
import '../../model/auth/respones/responseRegister.dart';
import '../../model/commentModel.dart';
import '../base_Repo.dart';

class Remote implements BaseRepositorie {
  @override
  Future<ForgetPasswordOtpResponse> forgetPasswordOTP(String email) async {
    Uri url =
        Uri.https(ApiConstance.base_Url, ApiConstance.forgetPasswordOTPUrl);
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

  // @override
  // Future<MedicineModel> getSearch(String query,
  //     {String sort = 'medicineStock', int page = 1, int size = 20}) async {
  //   {
  //     Uri URL = Uri.https('druggerdeployment.vercel.app',
  //         '/medicine?search=$query&page=$page&size=$size&sort=$sort');
  //     http.Response search = await http.get(URL);
  //     try {
  //       var json = jsonDecode(search.body);
  //       MedicineModel searchModel = MedicineModel.fromJson(json);
  //       return searchModel;
  //     } catch (e) {
  //       print(e);
  //       throw e;
  //     }
  //   }
  // }

  @override
  Future<Comment> addComment(String commentDesc, String medicineId) async {
    Uri url = Uri.https(
        "graduationdeployment.vercel.app", "/medicine/$medicineId/comments");

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'authorization':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0NTUxNDgyZGM1ZWZjODI4YmMyZTBmMCIsInVzZXJfbmFtZSI6Im1vc3RhZmEgZ2hvbmFpbWkiLCJlbWFpbCI6Im1vc3RhZmFnaG9uaW1pMjJAZ21haWwuY29tIiwiaWF0IjoxNjgzOTg5ODUxfQ.r2Tk_hndm2s2YmrFaD87GhTsnu96OJDL-UMjmiB1FvQ',
      },
      body: jsonEncode(<String, String>{
        "commentDesc": commentDesc,
      }),
    );
    return Comment.fromJson(jsonDecode(response.body));
  }

  @override
  Future<Comment> commentLike(String idItem, String idComment) async {
    final response = await http.patch(
      Uri.parse(
          'https://graduationdeployment.vercel.app/medicine/64487b857e32e628eefab3e7/comments/64623808c1de3548fb75280f/like'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Host': '<calculated when request is sent>',
        'authorization':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0NTUxNDgyZGM1ZWZjODI4YmMyZTBmMCIsInVzZXJfbmFtZSI6Im1vc3RhZmEgZ2hvbmFpbWkiLCJlbWFpbCI6Im1vc3RhZmFnaG9uaW1pMjJAZ21haWwuY29tIiwiaWF0IjoxNjgzOTg5ODUxfQ.r2Tk_hndm2s2YmrFaD87GhTsnu96OJDL-UMjmiB1FvQ',
      },
      body: jsonEncode(<String, String>{}),
    );


      // then parse the JSON.
      return Comment.fromJson(jsonDecode(response.body).fromMap['like']);

      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception();

  }
// Future<Comment> commentLike(String idItem, String idComment) async {
//   Uri url = Uri.https("graduationdeployment.vercel.app/medicine/64487b857e32e628eefab3e7/comments/64623808c1de3548fb75280f/like");
//   // https://graduationdeployment.vercel.app/medicine/64487b857e32e628eefab3e7/comments/64623808c1de3548fb75280f/like
//   final response = await http.patch(
//     url,
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//       'authorization': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0NTUxNDgyZGM1ZWZjODI4YmMyZTBmMCIsInVzZXJfbmFtZSI6Im1vc3RhZmEgZ2hvbmFpbWkiLCJlbWFpbCI6Im1vc3RhZmFnaG9uaW1pMjJAZ21haWwuY29tIiwiaWF0IjoxNjgzOTg5ODUxfQ.r2Tk_hndm2s2YmrFaD87GhTsnu96OJDL-UMjmiB1FvQ',
//
//     },
//     body: json.decode
//   );
//   return Comment.fromJson(jsonDecode(response.body));
// }
}
