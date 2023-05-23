import 'package:drugger/api/api_constant.dart';
import 'package:get/get.dart';

import '../../model/user_order_model.dart';
import '../../service/cart_service.dart';

class MyOrderController extends GetxController{


  RxList<Order> orderList = <Order>[].obs;
  late UserOrderModel userOrderModel;
  CartService cartService = CartService();
  RxBool isLoading = false.obs ;

  getUserOrder()async
  {
    userOrderModel = UserOrderModel.fromJson(await cartService.getUserOrdersService());
    for(var item in userOrderModel.orders)
      {
        orderList.add(item);
      }
    print(userOrderModel.message);
    isLoading(false);
  }

  @override
  void onInit() {
    isLoading(true);
    getUserOrder();
    super.onInit();
  }
}