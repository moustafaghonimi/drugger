import 'package:drugger/constance/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/screens/cart/stripe_payment_screen.dart';
import '../routing/app_routs_name.dart';
import '../routing/routs.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: AppTheme.customLightTheme,
        // darkTheme: ,
        debugShowCheckedModeBanner: false,
        getPages: routes,
        initialRoute: AppRoutes.splashScreen,
      // home: const StripePaymentScreen(url: 'https://checkout.stripe.com/c/pay/cs_test_a18b0weLDUmF9VhktuSyNOjU9s23AnTAuhsZa6zEgzZEGNHpM9Oko9us4q#fidkdWxOYHwnPyd1blpxYHZxWjA0SzR9PWJAY1ZOVDJQQGsxVU5DdUBtY2E3MX1rX3dSR0xHamB0UDF3R0dxN0xKV3J8PTFRfURQYzJXd00zYFZpTGcyN1FqXWZSdDBcc0JpUk1UNjZkTlZANTVTUWZORlYzPCcpJ2N3amhWYHdzYHcnP3F3cGApJ2lkfGpwcVF8dWAnPyd2bGtiaWBabHFgaCcpJ2BrZGdpYFVpZGZgbWppYWB3dic%2FcXdwYHgl',),
    );
  }
}

