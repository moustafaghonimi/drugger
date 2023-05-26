import 'package:drugger/controller/profile/my_order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constance/app_color.dart';
import '../../widget/stripper.dart';

class MyOrderScreen extends StatelessWidget {
  MyOrderScreen({Key? key}) : super(key: key);
  final MyOrderController controller = Get.put(MyOrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MY Order"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() => controller.isLoading.value?Center(child: CircularProgressIndicator()):ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => Container(
                margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                padding: EdgeInsets.all(8),
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                color: Colors.white,
                  boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                  ]
                ),
                child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [

                      Text("Order Id: ${controller.orderList[index].id}",style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16
                      ),overflow: TextOverflow.ellipsis,maxLines: 2,),
                      Text("Location :${controller.orderList[index].address[0]}",overflow: TextOverflow.ellipsis,maxLines: 1,style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16
                      ),),
                      Text("total Price :${controller.orderList[index].totalFinalPrice.toString()} \$",style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16
                      ),),

                      Spacer(flex: 2,),
                      EasyStripper( itemState: controller.orderList[index].status),
                      Spacer(),
                    ],
                  ),
                ),
              ),
              itemCount: controller.orderList.length,
            ),),
          ],
        ),
      ),

    );
  }
}
