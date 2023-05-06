

import 'package:flutter/material.dart';

Widget customButton ({
 required String text,
VoidCallback? onPressed,
Color textColor=Colors.black,
Color buttonColor = Colors.black,
double buttonRedias=5 ,
double fontSize=20,
})=>ElevatedButton(
  onPressed: onPressed,
  style: ElevatedButton.styleFrom(
      backgroundColor: buttonColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(buttonRedias),
      )),
  child: Text(
    text,
    style: TextStyle(
      color: textColor,
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
    ),
  ),
);