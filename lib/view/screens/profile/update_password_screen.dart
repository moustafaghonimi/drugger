import 'package:drugger/constance/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../constance/string_constant.dart';
import '../../../controller/profile/resetPasswordProfileController.dart';
import '../../../core/function/validate.dart';
import '../../widget/add_medicine_tff.dart';
import '../../widget/customButton.dart';

class UpdatePasswordScreen extends StatelessWidget {
  const UpdatePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ResetPassProfileController controller = Get.put(ResetPassProfileController());
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Change Your Password"),
        backgroundColor: AppColor.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              addMedicineTFF(
                context: context,
                label: 'Old Password',
                controller: controller.oldPasswordController,
                validator: (value) {
                  return validateInput(value, 'password');
                },
              ),
              SizedBox(
                height: 15,
              ),
              addMedicineTFF(
                context: context,
                label: 'New Password',
                controller: controller.newPasswordController,
                validator: (value) {
                  return validateInput(value, 'password');
                },
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                width: w * 0.5,
                child: customButton(
                  onPressed: () {
                    return controller.resetPasswordProfileValidation(context);
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
      ),
    );
  }
}
