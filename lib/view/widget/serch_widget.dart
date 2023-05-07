import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget search(
{required VoidCallback onTap , }
    ) => GestureDetector(
  onTap:onTap ,
  child:   Container(
        margin: const EdgeInsets.only(
          top: 30,
        ),
        padding: const EdgeInsets.only(
          left: 7,
        ),
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xff2f365a)),
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
