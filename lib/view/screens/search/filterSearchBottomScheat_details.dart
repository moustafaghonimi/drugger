import 'package:flutter/material.dart';

import '../../../constance/app_color.dart';
import '../../../constance/string_constant.dart';
import '../../widget/custemText.dart';
import '../../widget/customCheckBox_widget.dart';

class FilterSearchBottomScheatDetails extends StatelessWidget {
  const FilterSearchBottomScheatDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustemText(
                Txt: AppString.sortPrise,
                size: 25,
                color: AppColor.blackColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CustomCheckBoxWidget(
                    value: false,
                    activeColor: AppColor.onPrimaryColor,
                    onChanged: (bool value) {},
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  CustemText(
                    Txt: AppString.lowestPriced,
                    size: 20,
                    color: AppColor.blackColor,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CustomCheckBoxWidget(
                    value: false,
                    activeColor: AppColor.onPrimaryColor,
                    onChanged: (bool value) {},
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  CustemText(
                    Txt: AppString.highestPriced,
                    size: 20,
                    color: AppColor.blackColor,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
            const Divider(color: AppColor.onPrimaryColor,endIndent: 10,indent: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustemText(
                Txt: AppString.sortExpireDate,
                size: 25,
                color: AppColor.blackColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CustomCheckBoxWidget(
                    value: false,
                    activeColor: AppColor.onPrimaryColor,
                    onChanged: (bool value) {},
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  CustemText(
                    Txt: AppString.lowExp,
                    size: 20,
                    color: AppColor.blackColor,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CustomCheckBoxWidget(
                    value: false,
                    activeColor: AppColor.onPrimaryColor,
                    onChanged: (bool value) {},
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  CustemText(
                    Txt: AppString.highExp,
                    size: 20,
                    color: AppColor.blackColor,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
