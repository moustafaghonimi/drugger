import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../constance/app_color.dart';
import '../../../constance/assets_constant.dart';
import '../../../constance/string_constant.dart';
import '../../../controller/auth/otb_controller.dart';
import '../../../core/function/validate.dart';
import '../../widget/custemText.dart';
import '../../widget/custemTextFormFiled.dart';
import '../../widget/customButton.dart';




class OtpByEmail extends StatelessWidget {
  static const routeName = 'otp';


  OtpByEmail({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OtbController());

    final OtbController controller = Get.find();

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColor.blackColor),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: CustemText(Txt: 'OTP', color: AppColor.blackColor, size: 20),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.otpImage,
              width: w,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: h * 0.01,
            ),
            CustemText(
                Txt: AppString.otp,
                color: AppColor.primaryColor,
                size: 25,
                fontWeight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustemText(
                  Txt: AppString.messageOtp,
                  color: AppColor.onPrimaryColor,
                  size: 18,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: h * 0.01,
            ),
            Form(
              key: controller.formKey,
              child: CustemTextFormFiled(
                label:AppString.email,
                hint:AppString.emilExample,
                icons: IconButton(
                  icon: Icon(Icons.email),
                  onPressed: () {},
                ),
                controllers: controller.emailController,
                keybordtype: TextInputType.emailAddress,
                validate: (value) {
                  return validateInput(value, 'email');
                  // if (value == null || value.trim().isEmpty) {
                  //   return 'Email not validate';
                  // }
                  // final bool emailValid = RegExp(
                  //         r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  //     .hasMatch(value);
                  // if (!emailValid) {
                  //   return 'Please Enter Valid Email';
                  // }
                  // return null;
                },
              ),
            ),
            SizedBox(
              height: h * 0.01,
            ),
            Container(
              width: w * 0.5,
              child: customButton(
                onPressed: () {
                  controller.email = controller.emailController.text;
                  print(controller.email);
                  return controller.forgetPasswordOtpValidation(context);
                },
                text: AppString.send,
                buttonColor: AppColor.primaryColor,
                buttonRedias: 10,
                textColor: AppColor.whiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }


}
