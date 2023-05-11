import 'package:drugger/constance/app_color.dart';
import 'package:drugger/view/widget/custemText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../controller/item_and_comment/itemDetails_controller.dart';
import 'comment_detiles.dart';
import 'creatComment.dart';

class CommentScreen extends StatelessWidget {
  const CommentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ItemDetailsController controller = Get.put(ItemDetailsController());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustemText(
            Txt: 'Comments',
            size: 25,
            color: AppColor.whiteColor,
            fontWeight: FontWeight.w500),
      ),
      body: Column(
        children:  [
          const CommentDetails(),
          SizedBox(
              child: CreateComment()),

        ],
      )
    );
  }
}
