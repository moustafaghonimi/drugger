import 'package:drugger/view/screens/cart/stripe_payment_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geocoding/geocoding.dart';

import '../../constance/app_color.dart';
import '../../model/user_model.dart';
import '../../routing/app_routs_name.dart';
import '../../service/cart_service.dart';
import '../../service/profile_service.dart';
import '../home_controller.dart';

class CheckOutController extends GetxController {
  late GlobalKey<FormState> globalKey;

  late TextEditingController phone;

  late TextEditingController address;

  String payment = 'Cash';

  RxBool isLoading = false.obs;
  Position? currentPosition;
  late PermissionStatus permissionStatus;

  final CartService cartService = CartService();

  void requestPermission() async {
    print("req");

    permissionStatus = await Permission.location.request();
    if (permissionStatus == PermissionStatus.granted) {
      getCurrentLocation();
    } else {
      currentPosition = null;
    }
  }

  void getCurrentLocation() async {

    print("cur");
    currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    getAddressFromLatLng(currentPosition!);
  }

  Future<void> getAddressFromLatLng(Position position) async {
    print("add");
    await placemarkFromCoordinates(
            currentPosition!.latitude, currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      address.text =
          "${place.street}, ${place.subLocality},${place.subAdministrativeArea}, ${place.postalCode}";
      update();
    }).catchError((e) {
      Get.snackbar("ERROR", e.toString());
      // debugPrint(e);
    });
  }

  void changePayment(type) {
    payment = type;
    update();
  }

  confirm() async {
    if (globalKey.currentState!.validate()) {
      var response = await cartService.createOrderService(
          address.text, [phone.text], payment == "Cash" ? "COD" : payment);
      if (response["status"] == "success" && payment == "Card") {

        Get.to(() => StripePaymentScreen(
              url: response["Url"],
            ));
      } else if (response["status"] == "success" && payment != "Card") {
        Get.defaultDialog(
          title: "Ordered success",
          content: const Text("Check Your Email for receipt"),
          confirm: GestureDetector(
            onTap: () {
              print("object");
              HomeController homeController = Get.find();
              homeController.onInit();
              Get.offAllNamed(AppRoutes.homeScreen);
            },
            child: Container(
              height: 45,
              width: 90,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(10)),
              child: const Text(
                'OK',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          barrierDismissible: false,
        );
      }
    }
  }

  getUserPhone() async {
    ProfileService profileService = ProfileService();
    UserModel userModel =
        UserModel.fromJson(await profileService.getUserData());
    phone.text = userModel.result.phone??"";
    update();
    isLoading(false);
  }

  @override
  void onInit() {
    isLoading(true);
    globalKey = GlobalKey<FormState>();
    getUserPhone();
    requestPermission();
    phone = TextEditingController();
    address = TextEditingController();
    super.onInit();
  }
}
