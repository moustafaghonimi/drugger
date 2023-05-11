import 'package:flutter/material.dart';

// typedef Validator = String? Function(String?);
typedef OnSaved = String? Function(String?);

class CustemTextFormFiled extends StatelessWidget {
  String? hint;
  String label;
  Widget? icons;
  TextEditingController? controllers;
  String? Function(String?)? validate;
  OnSaved? onSaved;
  bool hideText;
  TextInputType keybordtype;
  VoidCallback? ontap;
  int maxLine ;

  CustemTextFormFiled(
      {super.key,  this.hint,
      required this.label,
      this.icons,
      this.validate,
      this.onSaved,
      this.controllers,
      this.hideText = false,
      this.keybordtype = TextInputType.text,
      this.ontap,
      this.maxLine = 1
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        onSaved: onSaved,
        textInputAction: TextInputAction.next,
        controller: controllers,
        validator: validate,
        obscureText: hideText,
        keyboardType: keybordtype,
        maxLines: maxLine,
        onTap: ontap,
        decoration: InputDecoration(
          suffixIcon: icons,
          labelText: label,
          hintText: hint,
          hintStyle: TextStyle(color: Colors.black),
          fillColor: Color.fromRGBO(242, 245, 248, 1.0),
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
