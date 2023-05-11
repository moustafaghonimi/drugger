import 'package:flutter/material.dart';

import '../../constance/app_color.dart';
typedef OnChange = String? Function(String?);

class SearchWidget extends StatelessWidget {
  OnChange? onChange;


  SearchWidget({this.onChange});

  @override
  Widget build(BuildContext context) {
    return TextField(

      onChanged: onChange,
      enableSuggestions: true,

      style: const TextStyle(color: AppColor.blackColor, fontSize: 14),
      autocorrect: true,
      cursorColor: AppColor.blackColor,
      showCursor: true,
      cursorWidth: 2,
      decoration: InputDecoration(

        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: AppColor.blackColor,
              width: 1,
            )),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.blackColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: Icon(
          Icons.search,
          color: AppColor.blackColor,
        ),
        hintText: 'Search ',
        hintStyle: TextStyle(
            color: AppColor.blackColor,
            fontWeight: FontWeight.w600,
            fontSize: 14),
        fillColor: Colors.white70,
        filled: true,
      ),
    );
  }
}
