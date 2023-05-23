import 'package:drugger/constance/app_color.dart';
import 'package:flutter/material.dart';

import '../../widget/add_medicine_tff.dart';

class UpdatePasswordScreen extends StatelessWidget {
  const UpdatePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change Your Password"),
      backgroundColor: AppColor.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10 ,),
        child: Column(
          children: [
            SizedBox(height: 20,),
            addMedicineTFF(context:context, label: 'Old Password', controller: TextEditingController(),),
            SizedBox(height: 15,),
            addMedicineTFF(context:context, label: 'New Password', controller: TextEditingController(),),
            SizedBox(height: 15,),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                "Confirm",
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
