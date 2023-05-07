import 'package:drugger/constance/string_constant.dart';
import 'package:drugger/routing/app_routs_name.dart';
import 'package:drugger/view/widget/custemAnimetedTxt.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constance/app_color.dart';
import '../../../constance/assets_constant.dart';
import '../../../core/function/validate.dart';
import '../../../controller/auth/login_controller.dart';
import '../../widget/custemText.dart';
import '../../widget/custemTextFormFiled.dart';
import '../../widget/customButton.dart';
import 'otp_email.dart';
import 'register_screen.dart';

class LoginScreen extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  // var formKey = GlobalKey<FormState>();
  // var repo=Repo(baseRepositorie: Remote());

  // var emailControler = TextEditingController();
  // var passwordControler = TextEditingController();
  // var PharmacyID_Controller = TextEditingController();
  // bool passwordVisible = true;

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 35.0, left: 8, right: 8),
            child: CustemAnimetedText(
                Txt: AppString.welcome,
                color: AppColor.blackColor,
                size: 30,
                fontWeight: FontWeight.bold),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 35.0, left: 8, right: 8),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Image.asset(
          //         AppAssets.appBarLoginIcon,
          //         width: 60,
          //       ),
          //       Image.asset(
          //         AppAssets.cartIcon,
          //         width: 60,
          //       ),
          //     ],
          //   ),
          // ),
          SizedBox(
            height: h * .02,
          ),
          CustemText(
              Txt: AppString.druggerApp,
              color: AppColor.onPrimaryColor,
              size: 60,
              fontWeight: FontWeight.bold),
          SizedBox(
            height: h * .055,
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Colors.white),
              width: double.infinity,
              height: h * 0.62,
              child: Column(
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
                                label: AppString.pharmacyID,
                                hint: AppString.pharmacyID,
                                icons: IconButton(
                                  icon: const Icon(
                                      Icons.confirmation_num_outlined),
                                  onPressed: () {},
                                ),
                                controllers: controller.pharmacyIDController,
                                validate: (value) {
                                  return validateInput(value, 'pharID');
                                  // if (value == null || value.trim().isEmpty) {
                                  //   return 'Pharmacy ID is required';
                                  // }
                                },
                              ),

                              CustemTextFormFiled(
                                label: AppString.email,
                                hint: AppString.enterEmail,
                                icons: IconButton(
                                  icon: const Icon(Icons.email),
                                  onPressed: () {},
                                ),
                                controllers: controller.emailController,
                                keybordtype: TextInputType.emailAddress,
                                validate: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'empty';
                                  }
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
                              Obx(
                                () => CustemTextFormFiled(
                                  label: AppString.password,
                                  hint: AppString.enterPassword,
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
                                  controllers: controller.passwordController,
                                  hideText: controller.passwordVisible.value,
                                  validate: (value) {
                                    return validateInput(value, 'password');
                                  },
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 180.0, bottom: 10),
                                  child: InkWell(
                                    hoverColor: AppColor.primaryColor,
                                    onTap: () {
                                      //TODO change getto
                                      Get.offNamed(AppRoutes.otpByEmail);
                                    },
                                    child: const Text(AppString.forgotPassword,
                                        style: TextStyle(color: Colors.black)),
                                  )),
                              Container(
                                width: w * 0.9,
                                child: customButton(
                                  onPressed: () {
                                    controller.login(context);
                                  },
                                  text: 'Sign In',
                                  buttonColor: AppColor.primaryColor,
                                  buttonRedias: 10,
                                  textColor: AppColor.whiteColor,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustemText(
                                    Txt: AppString.doNotHaveAccount,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                    size: 15,
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      //TODO
                                      // Get.to(RegisterScreen());
                                      Get.toNamed(AppRoutes.registerScreen);
                                    },
                                    child: CustemText(
                                        Txt: AppString.signUp,
                                        color: AppColor.onPrimaryColor,
                                        size: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const Divider(
                                color: AppColor.blackColor,
                                height: 5,
                                indent: 16,
                                endIndent: 16,
                                thickness: 1,
                              ),

                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.center,
                              //   children: [
                              // CustemText(
                              //   Txt: "If Have A problem!",
                              //   color:AppColor.blackColor,
                              //   fontWeight: FontWeight.bold, size: 15,),

                              // TextButton(
                              //   onPressed: () {
                              // Get.to(RegisterScreen());
                              // },
                              // child: CustemText(
                              //     Txt: 'Call Admins',
                              //     color: AppColor.OnPrimaryColor,
                              //     size: 16,
                              //     fontWeight: FontWeight.bold),
                              // ),
                              // ],)
                            ],
                          )),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
