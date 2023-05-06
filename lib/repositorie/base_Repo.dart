import '../model/auth/respones/ForgetPasswordOTP_Response.dart';
import '../model/auth/respones/LoginResponse.dart';
import '../model/auth/respones/responseRegister.dart';

abstract class BaseRepositorie{

  Future<ResponseRegister> register(String pharId,
      String pharName,
      String userName,
      String firstName,
      String lastName,
      String email,
      String password,
      String cPassword,
      String age,
      String phone);

   Future<LoginResponse> login(String id,
      String Email,
      String Password);

   Future<ForgetPasswordOtpResponse> forgetPasswordOTP(
      String email
      );

   Future<ForgetPasswordOtpResponse> resetPassword(
      String otp,
      String pass,
      String email,
      );



}