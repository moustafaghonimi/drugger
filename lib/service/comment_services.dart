import 'dart:convert';
import 'dart:io';


import 'package:drugger/api/api_constant.dart';
import 'package:drugger/model/medicine_model.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../api/api_helper.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';


class AddComment extends ApiHelper {

  Map<String,String> headers = {
    "Content-Type":"application/json",
    'authorization' : 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0NTUxNDgyZGM1ZWZjODI4YmMyZTBmMCIsInVzZXJfbmFtZSI6Im1vc3RhZmEgZ2hvbmFpbWkiLCJlbWFpbCI6Im1vc3RhZmFnaG9uaW1pMjJAZ21haWwuY29tIiwiaWF0IjoxNjgzNDcwMzY2fQ.7mxTeEBB4hIfb8dvomQ1l4rAPFd8lAJU-cILJAGjn2E',
  };

  static Future<bool> sendComment(List<Comment> comments) async {
    var request =
    http.MultipartRequest('POST', Uri.parse(ApiConstance.medicine));

    request.headers.addAll({
      "authorization": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0NTUxNDgyZGM1ZWZjODI4YmMyZTBmMCIsInVzZXJfbmFtZSI6Im1vc3RhZmEgZ2hvbmFpbWkiLCJlbWFpbCI6Im1vc3RhZmFnaG9uaW1pMjJAZ21haWwuY29tIiwiaWF0IjoxNjgzNDcwMzY2fQ.7mxTeEBB4hIfb8dvomQ1l4rAPFd8lAJU-cILJAGjn2E"
    });
    jsonEncode(<dynamic>[comments]);


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

  Future<bool?> addLike(String itemId,String commId)async{
    var response = await update(url: "${ApiConstance.baseURL}/medicine/$itemId/comments/$commId/like",
      body: jsonEncode({
      } ),headers: headers,);
    print(response.toString());
    if(response['message']=="Done")
    {
      return true ;
    }
    return false;
  }

}