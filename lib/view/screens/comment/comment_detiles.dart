import 'package:drugger/constance/app_color.dart';
import 'package:drugger/constance/string_constant.dart';
import 'package:drugger/view/widget/custemText.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../controller/item_and_comment/itemDetails_controller.dart';
import '../../../core/function/format_date_to_hour.dart';
import 'creatComment.dart';

class CommentDetails extends StatelessWidget {
  const CommentDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ItemDetailsController controller = Get.put(ItemDetailsController());

    return Expanded(
      child: ListView.builder (
          itemCount: controller.medicine?.comments.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                const SizedBox(
                  height: 4,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      width: Get.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white70,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 12,
                            offset: Offset(0, 5),
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
                                    "${AppString.publish}:${controller.medicine?.comments[index].createdBy ?? ""}",
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
                                    "${AppString.publish}: ${formatDateDetails(controller.medicine?.comments[index].createdAt).toString() ?? ""}",
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
                                child: Container(
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
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.thumb_up),
                                    onPressed: () {
                                      // Handle like button press
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.thumb_down),
                                    onPressed: () {
                                      // Handle dislike button press
                                    },
                                  ),
                                ],
                              )                            ],
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
