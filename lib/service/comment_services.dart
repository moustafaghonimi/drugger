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
    'authorization' : 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0NmRkYjVlYjQxY2RlODNlNzg4NjU0MCIsImVtYWlsIjoibW9zdGFmYWdob25pbWkyMkBnbWFpbC5jb20iLCJpYXQiOjE2ODQ5MjE4MjJ9.N1LYjVxBPD5M-GPOVrTlvUB9sP70flIZe2zgO6w_2IQ',
  };

  static Future<bool> sendComment(List<Comment> comments) async {
    var request =
    http.MultipartRequest('POST', Uri.parse(ApiConstance.medicine));

    request.headers.addAll({
      "authorization": token
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