import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constance/app_color.dart';
import '../../../constance/string_constant.dart';
import '../../../controller/cart/cart_controller.dart';
import '../../../routing/app_routs_name.dart';
import '../../widget/cart_item.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
  final CartController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: Get.width,
                      height: 80,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      decoration: const BoxDecoration(
                        color: AppColor.primaryColor,
                      ),
                      child: Text(
                        AppString.cart,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: AppColor.whiteColor),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                      TextButton(onPressed: (){
                        controller.clearAllCart();
                      }, child: const Text("Clear All",style: TextStyle(
                        fontSize: 20,
                      ),),),
                        const SizedBox(width: 8,),
                    ],
                    ),
                    // const SizedBox(
                    //   height: 30,
                    // ),
                  Obx(() =>controller.isLoading.value?const Center(child: CircularProgressIndicator()):
                  ListView.builder(
                    key: const Key("CartScreenListView"),
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => cartItem(
                      context: context,
                      productList: controller.cartList[index],
                      index: index, controller: controller,
                    ),
                    itemCount: controller.cartList.length,
                    shrinkWrap: true,
                  ),),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      child: Row(
                        children:  [
                          const Text('Total : '),
                          const Spacer(),
                          Obx(() => controller.isLoading.value?const Text(''):GetBuilder<CartController>(builder: (controller) => Text(controller.cartProductModel.totalPrice.toString()),)),
                        ],
                      ),
                    ),
                    const Divider(endIndent: 20, indent: 20),
                    InkWell(
                      onTap: (){
                        Get.toNamed(AppRoutes.createOrder );
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
                          "Check Out",
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
