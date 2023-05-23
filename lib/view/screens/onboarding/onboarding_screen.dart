import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../constance/app_color.dart';
import '../../../controller/on_boarding_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});
  final OnBoardingController controller=Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: (){
                  controller.skip();
                }, child: const Text("Skip",style: TextStyle(
                  fontSize: 20,
                ),)),
                const SizedBox(width: 10,),
              ],
            ),
            Expanded(
              flex: 4,
              child: PageView.builder(
                onPageChanged: (index){
                  controller.onPageChanging(index);
                },
                controller: controller.pageController,
                physics: const BouncingScrollPhysics(),
                itemBuilder:(context,index)=>Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [

                      const SizedBox(height: 30,),
                      Lottie.asset(controller.onBoardingList[index].image,height: Get.width/1.75,fit: BoxFit.fill,),
                      const SizedBox(height: 20,),
                      Text(controller.onBoardingList[index].title,style:Theme.of(context).textTheme.titleLarge,),
                      // const SizedBox(height: 80,),
                      Text(controller.onBoardingList[index].body,textAlign: TextAlign.center,style:Theme.of(context).textTheme.bodyMedium ),
                    ],
                  ),
                ) ,
                itemCount: controller.onBoardingList.length,
              ),
            ),
            const Spacer(),
            Expanded(
              child: Column(
                children: [
                  SmoothPageIndicator(
                    count: controller.onBoardingList.length,
                    effect: const ExpandingDotsEffect(
                      activeDotColor: AppColor.primaryColor,
                      dotColor: Colors.grey ,
                      dotHeight: 10,
                      dotWidth: 10,
                      expansionFactor: 2,
                      spacing: 5,
                    ),
                    controller:controller.pageController ,
                  ),
                  GestureDetector(
                    onTap: () => controller.next(),
                    child: Container(
                      margin: const EdgeInsets.only(
                        top: 15,
                        left: 35,
                        right: 35,
                      ),
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius:BorderRadius.circular(18),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        "Next",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
