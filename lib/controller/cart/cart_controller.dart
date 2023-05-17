import 'package:drugger/model/cart_product_model.dart';
import 'package:get/get.dart';

import '../../service/cart_service.dart';

class CartController extends GetxController
{


  final CartService cartService =CartService();
  late CartProductModel cartProductModel ;
  RxBool isLoading = false.obs ;
  RxList<ProductList> cartList = <ProductList>[].obs ;

  getCartData()async{
    cartList.clear();
   cartProductModel = await cartService.getAllCart();
   for(var item in cartProductModel.productList){
     cartList.add(item);
   }
  }

  increaseQuantity(String id , int oldQuantity,index)async
  {
    int newQuantity = oldQuantity+1 ;
    cartList[index].quantity=newQuantity;
    cartProductModel.totalPrice =cartProductModel.totalPrice + cartList[index].medicineId.medicineUnitPrice ;
    update();
    await cartService.updateQuantity(id, newQuantity) ;
  }


  decreaseQuantity(String id , int oldQuantity,index)async
  {
    int newQuantity = oldQuantity - 1 ;
    if(newQuantity == 0) return ;
    cartList[index].quantity=newQuantity;
    cartProductModel.totalPrice =cartProductModel.totalPrice - cartList[index].medicineId.medicineUnitPrice ;
    update();
    await cartService.updateQuantity(id, newQuantity) ;
  }


  customQuantity(String id, newQuantity,index)async{
    cartList[index].quantity=newQuantity;
    int total = 0 ;
    //TEST
    for(var item in cartList)
      {
        total = total +  item.quantity * item.medicineId.medicineUnitPrice ;
      }
    cartProductModel.totalPrice = total ;
    update();
    await cartService.updateQuantity(id, newQuantity);
  }

  addToCart(String medicineID ,String quantity)async{
    var response = await cartService.addToCartService(medicineID, quantity);
    await getCartData();
    update();
  }


  clearAllCart()async{
   var response = await cartService.clearAllCartService();
   if(response['message']=="Done"){
     cartProductModel.totalPrice = 0 ;
     cartList.clear();
     update();
   }
  }


  clearOneItem(medicineID)async
  {
    ProductList productList = cartList.where((item) => item.medicineId.id==medicineID).first;
    cartProductModel.totalPrice = cartProductModel.totalPrice - productList.quantity*productList.medicineId.medicineUnitPrice ;
    cartList.remove(productList);
    var response = await cartService.clearOneItemService(medicineID);
    update();
  }

  @override
  void onInit()async {
    isLoading(true);
    await getCartData();
    isLoading(false);
    super.onInit();
  }
}