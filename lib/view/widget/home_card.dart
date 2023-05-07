import 'package:cached_network_image/cached_network_image.dart';
import 'package:drugger/constance/string_constant.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget homeCard({
  required context ,
  Color bgColor=Colors.grey ,
  double ? imageW,
  double? imageH  ,
  required String imageURL ,
  required String name ,
  required int stock ,
  required int price ,
})=>Card(
  color: bgColor,
  shadowColor: Colors.black,
  shape: Border.all(
    color: Colors.white10,
  ),
  elevation: 10,
  child: SizedBox(
    width: imageW ?? Get.width*.4 ,
    height:imageH?? Get.height*.25,
    child: Padding(
      padding:  const EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CachedNetworkImage(
            width: Get.width*.3,
            height: Get.height*.16,
            fit: BoxFit.fill,
            imageUrl: imageURL,
            placeholder: (context, url) => FadeShimmer.round(
              size: 10,
              fadeTheme:Get.isDarkMode?FadeTheme.dark:FadeTheme.light,
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme
                .of(context)
                .textTheme
                .displayMedium,
          ),
          const Spacer(),
           //TODO
           Text("${AppString.stock} : $stock",style: Theme.of(context).textTheme.bodyMedium,),
           Text("${AppString.price} : $price",style: Theme.of(context).textTheme.bodyMedium,),
        ],
      ),
    ),
  ),
);