import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget addMedicineTFF({
  required context,
  required String label ,
  Widget ? icons ,
  String ? hint ,
  TextStyle ? hintStyle,
  void Function()? onTap,
  required TextEditingController controller ,
  int maxLines = 1 ,
   String? Function(String?)? validator,
  TextInputType keyboardType = TextInputType.text,

})=>Padding(
  padding: const EdgeInsets.symmetric(horizontal: 10),
  child:   TextFormField(
  
    controller: controller,
  
    maxLines:maxLines ,
  
    validator: validator,
  
    onTap:onTap ,
    keyboardType:keyboardType ,
  
    decoration: InputDecoration(
  
      suffixIcon: icons,
  
      labelText: label,
  
      labelStyle:Theme.of(context).textTheme.bodyMedium ,
  
      hintText: hint,
  
      hintStyle: Theme.of(context).textTheme.bodyMedium,
  
      border: OutlineInputBorder(
  
        borderSide: BorderSide(color: Colors.grey, width: .5),
  
        borderRadius: BorderRadius.circular(5),
  
      ),
  
      enabledBorder: OutlineInputBorder(
  
        borderSide: BorderSide(color: Colors.grey, width: .5),
  
        borderRadius: BorderRadius.circular(5),
  
      ),
  
    ),
  
  ),
);