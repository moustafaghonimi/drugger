import 'package:flutter/cupertino.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

import '../model/onboarding_model.dart';
import '../routing/app_routs_name.dart';
import '../service/services.dart';


class OnBoardingController extends GetxController
{
  PageController pageController = PageController();
  int currentPage=0;
  MyServices myServices =Get.find();
  List<OnBoardingModel> onBoardingList = [
    OnBoardingModel(title:"Welcome To Drugger", image:"assets/images/onboarding/welcome.json", body:" your trusted online pharmacy!"),
    OnBoardingModel(title:"Easy Ordering" , image: "assets/images/onboarding/search.json", body:"Placing an order is a breeze. Simply search for your desired items, add them to your cart, and proceed to checkout with our streamlined ordering process."),
    OnBoardingModel(title:"Fast and Reliable Delivery" , image: "assets/images/onboarding/delivery.json", body:" We understand the importance of receiving your medications promptly. Rest assured, our dedicated delivery team will ensure your package reaches you safely and on time."),
    OnBoardingModel(title:"Secure Payments" , image:"assets/images/onboarding/payment.json" , body:" Your financial security is important to us. Our app provides a secure payment gateway, allowing you to make transactions with confidence and peace of mind." ),
  ];

  void next()
  {
    currentPage++;
    if(currentPage>onBoardingList.length-1)
    {
      myServices.sharedPreferences.setBool('onBoarding', true);
      Get.offAllNamed(AppRoutes.loginScreen);
    }
    else
    {
      pageController.animateToPage(currentPage, duration: const Duration(seconds: 1), curve: Curves.easeInOut);
    }
  }

  onPageChanging(index)
  {
    currentPage=index;
    update();
  }

  skip()
  {
    myServices.sharedPreferences.setBool('onBoarding', true);
    Get.offAllNamed(AppRoutes.loginScreen);
  }

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    super.onReady();
  }

}