// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String status;
  String message;
  Result result;

  UserModel({
    required this.status,
    required this.message,
    required this.result,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    status: json["status"],
    message: json["message"],
    result: Result.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "result": result.toJson(),
  };
}

class Result {
  String id;
  String pharId;
  String firstName;
  String lastName;
  String pharName;
  String email;
  String gender;
  List<dynamic> wishlist;
  int v;
  String ? userName;
  String ? phone ;
  String ? age ;
  String ? profileUrl;

  Result({
    required this.id,
    required this.pharId,
    required this.firstName,
    required this.lastName,
    required this.pharName,
    required this.email,
    required this.gender,
    required this.wishlist,
    required this.v,
    this.phone,
    this.age,
    this.userName,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["_id"],
    pharId: json["pharId"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    pharName: json["pharName"],
    email: json["email"],
    gender: json["gender"],
    wishlist: List<dynamic>.from(json["wishlist"].map((x) => x)),
    v: json["__v"],
    age: json['age']??"",
    phone: json['phone']??"",
    userName: json['userName']??"",

  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "pharId": pharId,
    "firstName": firstName,
    "lastName": lastName,
    "pharName": pharName,
    "email": email,
    "gender": gender,
    "wishlist": List<dynamic>.from(wishlist.map((x) => x)),
    "__v": v,
  };
}
