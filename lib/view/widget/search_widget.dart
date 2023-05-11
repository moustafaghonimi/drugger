<<<<<<< HEAD
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
=======
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

<<<<<<<< HEAD:lib/view/widget/search_widget.dart
import '../../constance/app_color.dart';

Widget search({
  required VoidCallback onTap,
}) =>
========
Widget search({
  required VoidCallback onTap,
                      }) =>
>>>>>>>> origin/master:lib/view/widget/serch_widget.dart
    GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(
          top: 30,
          left: 8,
          right: 8,
        ),
        padding: const EdgeInsets.only(
          left: 7,
        ),
        height: 40,
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          // border: Border.all(color: const Color(0xff2f365a)),
          borderRadius: BorderRadius.circular(
            12,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.search,
              color: const Color(0xff656985),
              size: 22,
            ),
            const SizedBox(
              width: 7,
            ),
            const Text(
              'Search',
              style:
                  const TextStyle(color: const Color(0xff656985), fontSize: 15),
            ),
          ],
        ),
      ),
    );
>>>>>>> origin/master
