import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constance/app_color.dart';
import '../../../constance/assets_constant.dart';
import '../../../constance/string_constant.dart';
import '../../../controller/auth/otb_controller.dart';
import '../../../controller/auth/resetPassController.dart';
import '../../../core/function/validate.dart';
import '../../widget/custemText.dart';
import '../../widget/custemTextFormFiled.dart';
import '../../widget/customButton.dart';


class ResetPass extends StatelessWidget {
  static const routeName = 'reset';

   const ResetPass({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPassController());
    Get.put(OtbController());

    final ResetPassController controller = Get.find();
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColor.blackColor),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: CustemText(
            Txt: AppString.resetPass, color: AppColor.blackColor, size: 20),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.resetPassImage,
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
                  Txt:
                       AppString.resetMessage,
                  color: AppColor.onPrimaryColor,
                  size: 18,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: h * 0.01,
            ),
            Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    CustemTextFormFiled(
                     hint:  AppString.otpCode,
                     label: AppString.resetOtb,
                      icons: IconButton(
                        icon: const Icon(Icons.numbers),
                        onPressed: () {},
                      ),
                      controllers: controller.otpCodeController,
                      validate: (value) {
                        return validateInput(value, 'otp');
                      },
                    ),
                    CustemTextFormFiled(
                      hint:AppString.restNewPass,
                     label: AppString.newPass,
                      icons:IconButton(
                    icon: Icon(
                    // Based on passwordVisible state choose the icon
                    controller.passwordVisible.value
                      ? Icons.visibility_off
                      : Icons.visibility,
                    ),
              onPressed: () {
                controller.changeVisible();
              },
            ),

        controllers: controller.passwordController,
                      hideText:controller.passwordVisible.value
                          ? true : false,
                      validate: (value) {
                        return validateInput(value, 'password');                      },
                    ),
                  ],
                )),
            SizedBox(
              height: h * 0.01,
            ),
            SizedBox(
              width: w * 0.5,
              child: customButton(
                onPressed: () {
                  return controller.resetPasswordOtpValidation(context);
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
