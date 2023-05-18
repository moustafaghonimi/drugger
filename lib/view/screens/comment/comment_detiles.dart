import 'package:drugger/constance/app_color.dart';
import 'package:drugger/constance/string_constant.dart';
import 'package:drugger/view/widget/custemText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';

import '../../../controller/item_and_comment/comment_controller.dart';
import '../../../controller/item_and_comment/itemDetails_controller.dart';
import '../../../core/function/format_date_to_hour.dart';

class CommentDetails extends StatelessWidget {
  const CommentDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ItemDetailsController controller = Get.put(ItemDetailsController());
    final CommentController commentController = Get.put(CommentController());

    return Expanded(
      child: ListView.builder(
            itemCount: controller.medicine?.comments.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white70,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 12,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 30,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                    child: CustemText(
                                  Txt:
                                      "${AppString.createBy}: ${controller.medicine?.comments[index].createdBy.pharName ?? ""}",
                                  color: AppColor.blackColor,
                                  size: 18,
                                  fontWeight: FontWeight.w300,
                                  maxLines: 2,
                                )),
                                SizedBox(
                                    child: CustemText(
                                  Txt:
                                      "${AppString.id}:${controller.medicine?.comments[index].id ?? ""}",
                                  color: AppColor.blackColor,
                                  size: 16,
                                  fontWeight: FontWeight.w200,
                                  maxLines: 2,
                                )),
                                SizedBox(
                                    child: CustemText(
                                  Txt:
                                      "${AppString.publish}: ${formatDateDetails(controller.medicine?.comments[index].createdAt).toString()}",
                                  color: AppColor.blackColor,
                                  size: 18,
                                  fontWeight: FontWeight.w300,
                                  maxLines: 2,
                                )),
                                CustemText(
                                  Txt: "${AppString.commentDesc} :",
                                  color: AppColor.blackColor,
                                  size: 18,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: SizedBox(
                                    width: Get.width * .8,
                                    child: Text(
                                      controller.medicine?.comments[index]
                                              .commentDesc ??
                                          "",
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: AppColor.onPrimaryColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      maxLines: 10,
                                    ),
                                  ),
                                ),
                                const Divider(
                                  color: AppColor.primaryColor,
                                  height: 2,
                                  thickness: 2,
                                ),
                                // Row(
                                //   crossAxisAlignment: CrossAxisAlignment.end,
                                //   children: [
                                //     IconButton(
                                //       icon: Icon(
                                //        controller.isLiked.value==true ? Icons.thumb_up_alt_rounded : Icons.thumb_up_alt_outlined,
                                //         color: controller.isLiked.value==true ? Colors.blue : Colors.black,
                                //       ),
                                //       onPressed: () {
                                //
                                //         return controller.likeComment(context,controller.medicine?.comments[index].id);
                                //         // Handle like button press
                                //       },
                                //     ),
                                //     IconButton(
                                //       icon: const Icon(Icons.thumb_down),
                                //       onPressed: () {
                                //         // Handle dislike button press
                                //       },
                                //     ),
                                //   ],
                                // )

                                LikeButton (

                                   onTap:commentController.onLikeButtonTapped,


                                  size: 30,
                                  circleColor:
                                  const CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
                                  bubblesColor: const BubblesColor(
                                    dotPrimaryColor: Color(0xff33b5e5),
                                    dotSecondaryColor: Color(0xff0099cc),
                                  ),
                                  likeBuilder: (bool isLiked) {
                                    commentController.isLike.value=isLiked;
                                    return Icon(
                                      Icons.favorite,
                                      color: isLiked ? Colors.deepPurpleAccent : Colors.grey,
                                      size: 30,
                                    );
                                  },
                                  likeCount: controller.medicine?.comments[index].like.length,
                                  countBuilder: (int? count, bool isLiked, String text) {
                                    var color = isLiked ? Colors.deepPurpleAccent : Colors.grey;
                                    Widget result;
                                    if (count == 0) {
                                      result = Text(
                                        "love",
                                        style: TextStyle(color: color),
                                      );
                                    } else {
                                      result = Text(
                                        text,
                                        style: TextStyle(color: color),
                                      );
                                    }
                                    return result;
                                  },
                                ),

                              ],
                            ),
                          ],
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              );
            }),

    );
  }
}
