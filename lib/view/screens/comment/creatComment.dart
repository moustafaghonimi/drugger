import 'package:drugger/routing/app_routs_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../controller/item_and_comment/comment_controller.dart';
import 'comment_detiles.dart';


class CreateComment extends StatelessWidget {
   const CreateComment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CommentController controller = Get.put(CommentController());

    return Container(
      width: Get.width,
      padding: const EdgeInsets.all(6),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft:  Radius.circular(20)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey,
            blurRadius: 12,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Form(
        key: controller.theKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Add a comment:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: controller.commentController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Type your comment here',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your comment';
                }
                return null;
              },
            ),
            const SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {
                  // String comment = controller.commentController.text;
                   controller.addComment(context);
                   Get.back();


              },
              child: const Text('Submit'),
            )
          ],
        ),
      ),
    );
  }
}
