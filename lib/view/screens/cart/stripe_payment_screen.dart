import 'package:drugger/constance/app_color.dart';
import 'package:drugger/routing/app_routs_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../controller/home_controller.dart';


class StripePaymentScreen extends StatefulWidget {
  final String url ;
  const StripePaymentScreen({Key? key, required this.url}) : super(key: key);

  @override
  State<StripePaymentScreen> createState() => _StripePaymentScreenState();
}

class _StripePaymentScreenState extends State<StripePaymentScreen> {
  @override
  Widget build(BuildContext context) {
    var controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url=="http://localhost:5000/order/success") {
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
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: const Text("Pay With Stripe"),
      ),
      body: WebViewWidget(controller: controller,),
    );
  }
}
