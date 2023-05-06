import 'package:get/get.dart';

validateInput(value ,String type,)
{
  if(value.isEmpty)
  {
    return 'value can not be Empty';
  }
  if(type=="pharID")
    {
      if (value == null || value.trim().isEmpty) {
        return 'Pharmacy ID is required';
      }
    }
  if(type=='username')
  {
    if(!GetUtils.isUsername(value)){
      return 'Not valid User Name';
    }
  }
  if(type=='email')
    {
      if(!GetUtils.isEmail(value)){
        return 'Not valid Email';
      }
    }
  if(type=='password'){
    RegExp passwordRegExp = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'
    );
    if(passwordRegExp.hasMatch(value))
      {
        return 'password must contain spacial character \n'
            ' and number and capital character';
      }
  }
  if(type=='cPassword'){
    RegExp passwordRegExp = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'
    );
    if(passwordRegExp.hasMatch(value))
      {
        return 'password must contain spacial character \n'
            ' and number and capital character';
      }
  }
  if(type=='phone')
  {
    if(!GetUtils.isPhoneNumber(value)){
      return 'Not valid Phone number';
    }
  }


  return null ;

}