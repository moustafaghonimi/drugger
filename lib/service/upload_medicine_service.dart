import 'dart:io';


import 'package:drugger/api/api_constant.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../api/api_helper.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';


class UploadMedicineService extends ApiHelper {
  static Future<bool> sendMedicineData(String name,String type, String description,
      String expireDate, String stock, String price, XFile photo) async {
    var request =
    http.MultipartRequest('POST', Uri.parse(ApiConstance.medicine));

    request.headers.addAll({
      "authorization": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0NTY1ZTYzOWU4NTBlZTA5NThhMDg5OSIsInVzZXJfbmFtZSI6Im1vc3RhZmExMjMyIiwiZW1haWwiOiJtb3N0YWZhc2FtaXIxMjMyQGdtYWlsLmNvbSIsImlhdCI6MTY4MzY1MjA4OH0.6Zsz3pZ2FOJ8nqN9pKg_93c2sEI9Xfhhqg_0igQYZcg"
    });
    request.fields['medicineName'] = name;
    request.fields['medicineType'] = type;
    request.fields['medicineExpireDate'] = expireDate;
    request.fields['medicineDesc'] = description;
    request.fields['medicineStock'] = stock;
    request.fields['medicineUnitPrice'] = price;

    // request.fields['medicineName'] = 'Acetaminophen';


    request.files.add(
        http.MultipartFile(
            'medicineImage',
            File(photo.path).readAsBytes().asStream(),
            File(photo.path).lengthSync(),
            filename: photo.path.split("/").last,
          contentType: MediaType('image', 'jpeg')
        )
    );



    try {
      var response = await request.send();
      if (response.statusCode == 200 || response.statusCode == 201) {
        var responseBody = await response.stream.bytesToString();
        return true ;

      } else {
        var responseBody = await response.stream.bytesToString();
        return false ;
      }
    } catch (e) {
      Get.snackbar("ERROR", e.toString());
      return false;
    }
  }
}