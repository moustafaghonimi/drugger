import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
class ApiHelper
{
  Future<Map<String,dynamic>> get({required String url ,Map<String, String>? headers})async
  {
    http.Response response =await http.get(
      Uri.parse(url),
      headers: headers,
    );
    if(response.statusCode==200||response.statusCode==201)
    {
      Map<String,dynamic> data = jsonDecode(response.body);
      return data ;
    }
    else
    {
      throw Exception('there is a problem with status code ${response.statusCode}');
    }
  }

  Future<Map<String,dynamic>> post({required String url,@required dynamic body,Map<String, String>? headers})async
  {
    http.Response response=await http.post(
      Uri.parse(url),
      body :jsonEncode(body),
      headers: headers ,
    );
    if(response.statusCode==200||response.statusCode==201)
    {
      Map<String,dynamic> data =jsonDecode(response.body);
      return data;
    }
    else
    {
      print(response.body);
      throw Exception('there is a problem with status code ${response.statusCode}');
    }
  }

  Future<Map<String,dynamic>> update({required String url, body ,Map<String,String> ? headers})async
  {
    http.Response response=await http.patch(
        Uri.parse(url),body: body ,headers: headers);
    if(response.statusCode==200||response.statusCode==201)
    {
      Map<String,dynamic> data =jsonDecode(response.body);
      return data;
    }
    else
    {
      print(response.body);
      throw Exception('there is a problem with status code ${response.statusCode}');
    }
  }

  Future<Map<String,dynamic>> put({required url ,headers})async{
    http.Response response= await http.put(Uri.parse(url),headers: headers);
    if(response.statusCode==200)
    {
      Map<String,dynamic> data =jsonDecode(response.body);
      return data;
    }
    else
    {
      throw Exception('there is a problem with status code ${response.statusCode}');
    }
  }
}



