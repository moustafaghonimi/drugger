import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constance/app_color.dart';

Widget notification ({
  required int notificationNumber ,
})=> Stack(
  clipBehavior: Clip.none,
  children: [
    const Icon(
      Icons.notifications,
      color: AppColor.whiteColor,
    ),
    notificationNumber!=0?Positioned(
      top: -7,
      right: -2,
      child: Container(
        padding:EdgeInsets.all(3),
        decoration: BoxDecoration(
            color: Colors.red,
            // bor
            shape: BoxShape.circle
        ),
        child: Text('$notificationNumber',style: const TextStyle(color: Colors.white,fontSize: 15),),
      ),
    ):Container(),
  ],
);