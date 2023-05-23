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
                margin: EdgeInsets.symmetric(vertical: 10),
                color: Colors.white,
                height: 200,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Image(
                          height: 100,
                          image: NetworkImage('https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&w=1000&q=80'),
                        ),
                        SizedBox(width: 15,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(controller.orderList[index].products[0].name,style: Theme.of(context).textTheme.titleLarge,overflow: TextOverflow.ellipsis,maxLines: 2,),
                              Text(controller.orderList[index].products[0].description),
                              Text(controller.orderList[index].products[0].unitPrice.toString()),
                            ],
                          ),
                        )
                      ],
                    ),
                    Spacer(flex: 2,),
                    EasyStripper( itemState: controller.orderList[index].status),
                    Spacer(),
                  ],
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
