import 'package:drugger/view/screens/cart/stripe_payment_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geocoding/geocoding.dart';

import '../../service/cart_service.dart';


class CheckOutController extends GetxController
{
  late GlobalKey<FormState> globalKey ;
  late TextEditingController phone ;
  late TextEditingController address ;
  String payment = 'Cash';

  RxBool isLoadingLocation = false.obs;
  Position ? currentPosition;
  late PermissionStatus permissionStatus;

  final CartService cartService =CartService();

  void requestPermission() async {
    isLoadingLocation(true);
    permissionStatus = await Permission.location.request();
    if (permissionStatus == PermissionStatus.granted) {
      getCurrentLocation();
    } else {
      currentPosition = null ;
    }
  }

  void getCurrentLocation() async {
    currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    getAddressFromLatLng(currentPosition!);
  }

  Future<void> getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
        currentPosition!.latitude, currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      address.text = "${place.street}, ${place.subLocality},${place.subAdministrativeArea}, ${place.postalCode}";
      update();
    }).catchError((e) {
      Get.snackbar("ERROR", e.toString());
      // debugPrint(e);
    });
    isLoadingLocation(false);
  }

  void changePayment(type)
  {
    payment = type ;
    update();
  }

  confirm()async
  {
    if(globalKey.currentState!.validate())
      {
       var response =await cartService.createOrderService(address.text, [phone.text], payment=="Cash"?"COD":payment);
       print(response);
       if(response["status"]=="success"&&payment=="Card")
         {
           Get.to(()=>StripePaymentScreen(url: response["Url"],));
         }
      }

  }

  @override
  void onInit() {
    globalKey = GlobalKey<FormState>();
    requestPermission();
    phone = TextEditingController();
    address = TextEditingController();
    super.onInit();
  }
}