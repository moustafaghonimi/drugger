


import '../../model/auth/respones/ForgetPasswordOTP_Response.dart';
import '../../model/auth/respones/LoginResponse.dart';
import '../../model/auth/respones/responseRegister.dart';

import '../../model/commentModel.dart';
import '../base_Repo.dart';
import 'package:http/http.dart' as http;


class LocalDB implements BaseRepositorie{
  @override
  Future<ForgetPasswordOtpResponse> forgetPasswordOTP(String email) {
    // TODO: implement forgetPasswordOTP
    throw UnimplementedError();
  }

  @override
  Future<LoginResponse> login(String id, String Email, String Password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<ResponseRegister> register(String pharId, String pharName,
      String userName,
      // String firstName, String lastName,
      String email, String password, String cPassword,
      // String age, String phone
      ) {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future<ForgetPasswordOtpResponse> resetPassword(String otp, String pass, String email) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  // @override
  // Future<MedicineModel> getSearch(String query, {String sort='',  int page=1,  int size=10}) {
  //   // TODO: implement getSearch
  //   throw UnimplementedError();
  // }

  @override
  Future<Comment> addComment( String commentDesc,String medicineId) {
    // TODO: implement addComment
    throw UnimplementedError();
  }

  @override
  Future<Comment> commentLike(String idItem, String idComment) {
    // TODO: implement commentLike
    throw UnimplementedError();
  }



}