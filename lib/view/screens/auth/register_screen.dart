import 'package:drugger/core/function/validate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constance/app_color.dart';
import '../../../constance/assets_constant.dart';
import '../../../constance/string_constant.dart';
import '../../../controller/auth/register_controller.dart';
import '../../../routing/app_routs_name.dart';
import '../../widget/custemTextFormFiled.dart';
import '../../widget/customButton.dart';

class RegisterScreen extends StatelessWidget {
final RegisterController controller = Get.put(RegisterController());

   RegisterScreen({super.key});

@override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          AppString.signUp,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Image.asset(
            AppAssets.loginIcon,
            width: 100,
          ),
          SizedBox(
            height: h / 40,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      CustemTextFormFiled(
                        label : AppString.phar,
                        hint : AppString.pharName,
                        icons: IconButton(
                          icon: const Icon(Icons.title),
                          onPressed: () {},
                        ),
                        controllers: controller.pharName,
                        validate: (value) {
                          return  validateInput(value, '');
                        },
                      ),
                      CustemTextFormFiled(
                        label:AppString.pharmacyID,
                        hint:AppString.pharmacyID,
                        icons: IconButton(
                          icon: const Icon(Icons.confirmation_num_outlined),
                          onPressed: () {},
                        ),
                        controllers: controller.pharID,
                        validate: (value) {
                          return validateInput(value, "pharID");
                          // if (value == null || value.trim().isEmpty) {
                          //   return 'Pharmacy ID is required';
                          // }
                        },
                      ),
                      CustemTextFormFiled(
                        label:AppString.userName,
                        hint:AppString.userName,
                        icons: IconButton(
                          icon: const Icon(Icons.person),
                          onPressed: () {},
                        ),
                        controllers: controller.userName,
                        validate: (value) {

                          return validateInput(value, 'username');

                          // if (value == null || value.trim().isEmpty) {
                          //   return 'user name Required';
                          // }
                        },
                      ),
                      // CustemTextFormFiled(
                      //   label:AppString.firstName,
                      //   hint:AppString.firstName,
                      //   icons: IconButton(
                      //     icon: const Icon(Icons.looks_one),
                      //     onPressed: () {},
                      //   ),
                      //   controllers: controller.firstName,
                      //   validate: (value) {
                      //     return validateInput(value, '');
                      //
                      //     // if (value == null || value.trim().isEmpty) {
                      //     //   return 'First name Required';
                      //     // }
                      //   },
                      // ),
                      // CustemTextFormFiled(
                      //   label:AppString.lastName,
                      //   icons: IconButton(
                      //     icon: const Icon(Icons.looks_two),
                      //     onPressed: () {},
                      //   ),
                      //   controllers: controller.lastName,
                      //   validate: (value) {
                      //     return validateInput(value, '');
                      //
                      //
                      //     // if (value == null || value.trim().isEmpty) {
                      //     //   return 'Last name Required';
                      //     // }
                      //   },
                      // ),
                      // CustemTextFormFiled(
                      //   label:AppString.phone,
                      //   icons: IconButton(
                      //     icon: const Icon(Icons.phone),
                      //     onPressed: () {},
                      //   ),
                      //   keybordtype: TextInputType.phone,
                      //   controllers: controller.phone,
                      //   validate: (value) {
                      //     return validateInput(value, 'phone');
                      //     // if (value == null || value.trim().isEmpty) {
                      //     //   return 'Village name Required';
                      //     // }
                      //
                      //   },
                      // ),
                      // CustemTextFormFiled(
                      //    label: AppString.age,
                      //   icons: IconButton(
                      //     icon: const Icon(Icons.numbers),
                      //     onPressed: () {},
                      //   ),
                      //   keybordtype: TextInputType.number,
                      //   controllers: controller.age,
                      //   validate: (value) {
                      //      return validateInput(value, '');
                      //
                      //   //   if (value == null || value.trim().isEmpty) {
                      //   //     return 'Your Age Required';
                      //   //   }
                      //   },
                      // ),
                      CustemTextFormFiled(
                        label: AppString.email,
                        icons: IconButton(
                          icon: const Icon(Icons.email),
                          onPressed: () {},
                        ),
                        controllers: controller.email,
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
                          
                        },
                      ),
                      Obx(
                        ()=> CustemTextFormFiled(
                          label:'Password',
                          icons: IconButton(
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
                          controllers: controller.password,
                          hideText: controller.passwordVisible.value,
                          validate: (value) {
                            return validateInput(value, 'password');
                            
                            // if (value == null || value.trim().isEmpty) {
                            //   return 'Password not validate';
                            // }
                          },
                        ),
                      ),
                      Obx(
                        ()=> CustemTextFormFiled(
                          label:AppString.rePassword,
                          hint: AppString.enterRePassword,
                          icons: IconButton(
                            icon: Icon(
                                // Based on passwordVisible state choose the icon
                                controller.cPasswordVisible.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            onPressed: () {
                              controller.changeCPasswordVisible();
                              // // Update the state i.e. toogle the state of passwordVisible variable
                              // setState(() {
                              //   cpasswordVisible = !cpasswordVisible;
                              // });
                            },
                          ),
                          controllers: controller.cPassword,
                          hideText: controller.cPasswordVisible.value,
                          validate: (value) {
                            return validateInput(value, 'cPassword');

                            // if (value == null || value.trim().isEmpty) {

                              if(controller.password.text!=controller.cPassword.text){
                                return 'two password not same';
                              }
                              
                            //   return 'Re Password not validate';
                            // }
                          },
                        ),
                      ),
                      SizedBox(
                        width: w * 0.9,
                        child: customButton(
                          onPressed: () {
                            controller.register(context);
                            // return register_validation();
                          },
                          text: 'Sign Up',
                          buttonColor: AppColor.primaryColor,
                          buttonRedias: 10,
                          textColor: AppColor.blackColor,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(AppString.iHaveAnAccount,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54)),
                          TextButton(
                              onPressed: () {
                                Get.offAllNamed(AppRoutes.loginScreen);
                                // Get.to(LoginScreen_UI());
                              },
                              child: const Text(AppString.signIn,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: AppColor.onPrimaryColor))),
                        ],
                      )
                    ],
                  )),
            ),
          )
        ],
      ),
    );
  }


}
