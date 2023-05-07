import 'package:cached_network_image/cached_network_image.dart';
import 'package:drugger/routing/app_routs_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constance/string_constant.dart';
import '../../controller/home_controller.dart';
import '../widget/home_card.dart';
import '../widget/serch_widget.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double mainAxisExtent = Get.height*.25 ;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: Get.width,
          height: Get.height,
          padding: EdgeInsets.only(top: 20, left: 10, right: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppString.hello,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        //TODO and the text  get image url

                        Text(
                          'Mostafa Samir',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                    CachedNetworkImage(
                      width: 50,
                      height: 50,
                      imageUrl: ' controller.userData.data!.image',
                      imageBuilder: (context, imageProvider) => CircleAvatar(
                        backgroundImage: imageProvider,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        radius: 60,
                      ),
                      errorWidget: (context, url, error) => CircleAvatar(
                        radius: 60,
                        child: Image.asset(
                          "assets/images/profileimage.png",
                          height: 50,
                          width: 50,
                        ),
                      ),
                    ),
                  ],
                ),
                search(onTap: () {
                  Get.toNamed(AppRoutes.searchScreen);
                }),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  AppString.mostPopularMedicine,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 15,
                ),
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    mainAxisExtent: 230,
                  ),
                  itemBuilder: (context, index) => homeCard(
                      context: context,
                      bgColor: Colors.grey,
                      imageURL: controller
                          .medicineModel.medicines[index].medicineImage,
                      name: controller
                          .medicineModel.medicines[index].medicineName,
                      stock: controller
                          .medicineModel.medicines[index].medicineStock,
                      price: controller
                          .medicineModel.medicines[index].medicineUnitPrice),
                  itemCount: controller.medicineModel.medicines.length,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
