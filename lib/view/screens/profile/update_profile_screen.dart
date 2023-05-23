import 'package:drugger/constance/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/profile/update_profile_controller.dart';


bool? save = false;
bool? changed = false;

class UpdateProfileScreen extends StatelessWidget{
   UpdateProfileScreen({super.key});
  final UpdateProfileController controller = Get.put(UpdateProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   leading: IconButton(
        //       onPressed: () {
        //         save == false && changed == true
        //             ? showDialog(
        //                 context: context,
        //                 builder: (context) {
        //                   return AlertDialog(
        //                     title: Text('you want to save'),
        //                     content: Text('Cancle Changes..'),
        //                     actions: [
        //                       TextButton(
        //                           onPressed: () {
        //                             Navigator.of(context).pop();
        //                           },
        //                           child: Text('No')),
        //                       SizedBox(width: 20),
        //                       TextButton(
        //                           onPressed: () {
        //                             setState(() {
        //                               save = true;
        //                               changed = false;
        //                             });
        //
        //                             Navigator.of(context).pop();
        //                           },
        //                           child: Text('Yes')),
        //                     ],
        //                   );
        //                 },
        //               )
        //             : Navigator.of(context).pop();
        //       },
        //       icon: Icon(Icons.arrow_back_ios)),
        // ),
      appBar: AppBar(
        title: const Text("Update Your Data"),
      ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: GetBuilder<UpdateProfileController>(
              builder: (controller) =>  Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child:  TextFormField(
                          controller: controller.firstName,
                          // initialValue: "controller.firstName.text",
                          decoration: InputDecoration(
                            label: TextButton.icon(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.person,
                                ),
                                label: const Text('Fist name')),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: controller.lastName,
                          decoration: InputDecoration(
                            label: TextButton.icon(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.person,
                                ),
                                label: const Text('Last name')),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (value) {
                    },
                    // initialValue: email,
                    controller: controller.email,
                    readOnly: true,
                    decoration: InputDecoration(
                      label: TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.email,
                          ),
                          label: const Text('Email')),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: controller.phone,
                    onChanged: (value) {
                      // setState(() {
                      //   p_value = value;
                      // });
                    },
                    // initialValue: phoneNumber,
                    decoration: InputDecoration(
                      label: TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.phone_android,
                          ),
                          label: const Text('Phone')),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: controller.gender,
                          onChanged: (value) {
                            // setState(() {
                            //   g_value = value;
                            // });
                          },
                          // initialValue: gender,
                          decoration: InputDecoration(
                            label: TextButton.icon(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.wc,
                                ),
                                label: const Text('Gender')),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: controller.age,
                          onChanged: (value) {
                            // setState(() {
                            //   a_value == value;
                            // });
                          },
                          // initialValue: a_value.toString(),
                          decoration: InputDecoration(
                            label: TextButton.icon(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.date_range,
                                ),
                                label: const Text('Age')),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Save",style: TextStyle(
                      color: Colors.white
                    ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),);
  }
}
