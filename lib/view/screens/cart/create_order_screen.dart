import 'package:drugger/controller/cart/checkout_controller.dart';
import 'package:drugger/core/function/validate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constance/app_color.dart';
import '../../../constance/string_constant.dart';
import '../../widget/add_medicine_tff.dart';

class CreateOrderScreen extends StatelessWidget {
  CreateOrderScreen({Key? key}) : super(key: key);
  final CheckOutController controller = Get.put(CheckOutController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        centerTitle: true,
        key:const Key("AppBarCreateOrderScreen") ,
        title: Text(
          AppString.checkOut,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: AppColor.whiteColor),
        ),
      ),
      body: Form(
        key: controller.globalKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              addMedicineTFF(
                context: context,
                label: "Phone",
                controller: controller.phone,
                validator: (value) => validateInput(value, 'phone'),
              ),
              const SizedBox(
                height: 20,
              ),
              GetBuilder<CheckOutController>(
                builder: (controller) => addMedicineTFF(
                  context: context,
                  label: "Address",
                  controller: controller.address,
                  validator:(value) => validateInput(value, 'address'),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GetBuilder<CheckOutController>(builder: (controller) => Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: ()=>controller.changePayment("Cash"),
                      child: Container(
                        margin: const EdgeInsets.only(left: 20, right: 5),
                        height: Get.height * .25,
                        decoration: BoxDecoration(
                            color: controller.payment != "Cash"?Colors.white38:Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ]),
                        child: Column(
                          children: [
                            Image(
                              width: double.infinity,
                              height: Get.height * .15,
                              image:
                              const AssetImage("assets/images/payment/cash.png"),
                            ),
                            const Spacer(),
                            const Text("Cash"),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: ()=>controller.changePayment("Card"),
                      child: Container(
                        margin: const EdgeInsets.only(left: 5, right: 20),
                        height: Get.height * .25,
                        decoration: BoxDecoration(
                            color: controller.payment != "Card"?Colors.white38:Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ]),
                        child: Column(
                          children: [
                            Image(
                              width: double.infinity,
                              height: Get.height * .15,
                              image: const AssetImage(
                                  "assets/images/payment/credit-card.png"),
                            ),
                            const Spacer(),
                            const Text("Card"),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  controller.confirm();
                },
                child: Container(
                  width: double.infinity,
                  height: Get.height * .06,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColor.primaryColor,
                  ),
                  child: Text(
                    "Confirm",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
