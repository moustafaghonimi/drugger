import 'package:get/get.dart';

validateInput(value ,String type)
{
  if(value.isEmpty)
  {
    return 'value can not be Empty';
  }
  else if(type=="pharID")
  {
      if (value == null || value.trim().isEmpty) {
        return 'Pharmacy ID is required';
      }
  }
  else if(type=='username')
  {
    if(!GetUtils.isUsername(value)){
      return 'Not valid User Name';
    }
  }
  else if(type=='email')
    {
      if(!GetUtils.isEmail(value)){
        return 'Not valid Email';
      }
    }
  else if(type=='password'){
    RegExp passwordRegExp = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'
    );
    if(!passwordRegExp.hasMatch(value))
      {
        return 'password must contain spacial character \n'
            ' and number and capital character';
      }
  }
  else if(type=='phone')
  {
    if(!GetUtils.isPhoneNumber(value)){
      return 'Not valid Phone number';
    }
  }
  else if(type=='otp')
  {
    if (value == null || value.trim().isEmpty) {
      return 'OTP Code is Required';
    }
  }

  return null ;

}