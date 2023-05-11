import 'package:drugger/constance/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget search({
  required VoidCallback onTap,
                      }) =>
    GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(
          top: 30,
        ),
        padding: const EdgeInsets.only(
          left: 7,
        ),
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.blackColor),
          borderRadius: BorderRadius.circular(
            12,
          ),
          color: AppColor.whiteColor
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Icon(
              Icons.search,
              color: AppColor.blackColor,
              size: 22,
            ),
            SizedBox(
              width: 7,
            ),
            Text(
              'Search',
              style:
                  TextStyle(color: Color(0xff656985), fontSize: 15),
            ),
          ],
        ),
      ),
    );
