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
  String userName;
  String firstName;
  String lastName;
  String pharName;
  String email;
  int age;
  String phone;
  String gender;
  List<Wishlist> wishlist;
  int v;
  String ? profileUrl;

  Result({
    required this.id,
    required this.pharId,
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.pharName,
    required this.email,
    required this.age,
    required this.phone,
    required this.gender,
    required this.wishlist,
    required this.v,
    required this.profileUrl,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["_id"],
    pharId: json["pharId"],
    userName: json["userName"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    pharName: json["pharName"],
    email: json["email"],
    age: json["age"],
    phone: json["phone"],
    gender: json["gender"],
    wishlist: List<Wishlist>.from(json["wishlist"].map((x) => Wishlist.fromJson(x))),
    v: json["__v"],
    profileUrl: json["profileURL"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "pharId": pharId,
    "userName": userName,
    "firstName": firstName,
    "lastName": lastName,
    "pharName": pharName,
    "email": email,
    "age": age,
    "phone": phone,
    "gender": gender,
    "wishlist": List<dynamic>.from(wishlist.map((x) => x.toJson())),
    "__v": v,
    "profileURL": profileUrl,
  };
}

class Wishlist {
  String id;
  String medicineName;
  String medicineSlug;
  String customId;
  String medicineImage;
  String medicineType;
  DateTime medicineExpireDate;
  String medicineDesc;
  int medicineStock;
  int medicineUnitPrice;
  List<String> wishUsers;
  String createdBy;
  bool isDeleted;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  List<String> comments;

  Wishlist({
    required this.id,
    required this.medicineName,
    required this.medicineSlug,
    required this.customId,
    required this.medicineImage,
    required this.medicineType,
    required this.medicineExpireDate,
    required this.medicineDesc,
    required this.medicineStock,
    required this.medicineUnitPrice,
    required this.wishUsers,
    required this.createdBy,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.comments,
  });

  factory Wishlist.fromJson(Map<String, dynamic> json) => Wishlist(
    id: json["_id"],
    medicineName: json["medicineName"],
    medicineSlug: json["medicineSlug"],
    customId: json["customId"],
    medicineImage: json["medicineImage"],
    medicineType: json["medicineType"],
    medicineExpireDate: DateTime.parse(json["medicineExpireDate"]),
    medicineDesc: json["medicineDesc"],
    medicineStock: json["medicineStock"],
    medicineUnitPrice: json["medicineUnitPrice"],
    wishUsers: List<String>.from(json["wishUsers"].map((x) => x)),
    createdBy: json["createdBy"],
    isDeleted: json["isDeleted"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    comments: List<String>.from(json["comments"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "medicineName": medicineName,
    "medicineSlug": medicineSlug,
    "customId": customId,
    "medicineImage": medicineImage,
    "medicineType": medicineType,
    "medicineExpireDate": medicineExpireDate.toIso8601String(),
    "medicineDesc": medicineDesc,
    "medicineStock": medicineStock,
    "medicineUnitPrice": medicineUnitPrice,
    "wishUsers": List<dynamic>.from(wishUsers.map((x) => x)),
    "createdBy": createdBy,
    "isDeleted": isDeleted,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "comments": List<dynamic>.from(comments.map((x) => x)),
  };
}
