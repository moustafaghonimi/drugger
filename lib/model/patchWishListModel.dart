/// message : "success"
/// pharmecy : {"_id":"64551482dc5efc828bc2e0f0","pharId":"7641336140","userName":"mostafa ghonaimi","firstName":"Mostafa ","lastName":"Ghonaimi ","pharName":"mostafa pharmacy ","email":"mostafaghonimi22@gmail.com","age":22,"password":"$2a$08$FPjiCBE24f.uOEH/FOptleD7fg.taJPatRyy5XhIJUVykrMZaAuWK","phone":"01552545647","status":"Active","role":"user","gender":"male","isConfirmed":true,"isDeleted":false,"isBlocked":false,"wishlist":["64487b857e32e628eefab3e7"],"createdAt":"2023-05-05T14:36:50.623Z","updatedAt":"2023-05-18T09:23:04.267Z","__v":0,"changeAccountInfo":"2023-05-07T14:02:01.487Z","otp":"$2a$08$zPwFfD1OsrjD8gLo7oypO.scHYqWRoWcOAf/O3tFEaFXDUWdlfroC","otpexp":"2023-05-11T11:32:32.016Z"}

class PatchWishListModel {
  PatchWishListModel({
      this.message, 
      this.pharmecy,});

  PatchWishListModel.fromJson(dynamic json) {
    message = json['message'];
    pharmecy = json['pharmecy'] != null ? Pharmecy.fromJson(json['pharmecy']) : null;
  }
  String? message;
  Pharmecy? pharmecy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (pharmecy != null) {
      map['pharmecy'] = pharmecy?.toJson();
    }
    return map;
  }

}

/// _id : "64551482dc5efc828bc2e0f0"
/// pharId : "7641336140"
/// userName : "mostafa ghonaimi"
/// firstName : "Mostafa "
/// lastName : "Ghonaimi "
/// pharName : "mostafa pharmacy "
/// email : "mostafaghonimi22@gmail.com"
/// age : 22
/// password : "$2a$08$FPjiCBE24f.uOEH/FOptleD7fg.taJPatRyy5XhIJUVykrMZaAuWK"
/// phone : "01552545647"
/// status : "Active"
/// role : "user"
/// gender : "male"
/// isConfirmed : true
/// isDeleted : false
/// isBlocked : false
/// wishlist : ["64487b857e32e628eefab3e7"]
/// createdAt : "2023-05-05T14:36:50.623Z"
/// updatedAt : "2023-05-18T09:23:04.267Z"
/// __v : 0
/// changeAccountInfo : "2023-05-07T14:02:01.487Z"
/// otp : "$2a$08$zPwFfD1OsrjD8gLo7oypO.scHYqWRoWcOAf/O3tFEaFXDUWdlfroC"
/// otpexp : "2023-05-11T11:32:32.016Z"

class Pharmecy {
  Pharmecy({
      this.id, 
      this.pharId, 
      this.userName, 
      this.firstName, 
      this.lastName, 
      this.pharName, 
      this.email, 
      this.age, 
      this.password, 
      this.phone, 
      this.status, 
      this.role, 
      this.gender, 
      this.isConfirmed, 
      this.isDeleted, 
      this.isBlocked, 
      this.wishlist, 
      this.createdAt, 
      this.updatedAt, 
      this.v, 
      this.changeAccountInfo, 
      this.otp, 
      this.otpexp,});

  Pharmecy.fromJson(dynamic json) {
    id = json['_id'];
    pharId = json['pharId'];
    userName = json['userName'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    pharName = json['pharName'];
    email = json['email'];
    age = json['age'];
    password = json['password'];
    phone = json['phone'];
    status = json['status'];
    role = json['role'];
    gender = json['gender'];
    isConfirmed = json['isConfirmed'];
    isDeleted = json['isDeleted'];
    isBlocked = json['isBlocked'];
    wishlist = json['wishlist'] != null ? json['wishlist'].cast<String>() : [];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    changeAccountInfo = json['changeAccountInfo'];
    otp = json['otp'];
    otpexp = json['otpexp'];
  }
  String? id;
  String? pharId;
  String? userName;
  String? firstName;
  String? lastName;
  String? pharName;
  String? email;
  num? age;
  String? password;
  String? phone;
  String? status;
  String? role;
  String? gender;
  bool? isConfirmed;
  bool? isDeleted;
  bool? isBlocked;
  List<String>? wishlist;
  String? createdAt;
  String? updatedAt;
  num? v;
  String? changeAccountInfo;
  String? otp;
  String? otpexp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['pharId'] = pharId;
    map['userName'] = userName;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['pharName'] = pharName;
    map['email'] = email;
    map['age'] = age;
    map['password'] = password;
    map['phone'] = phone;
    map['status'] = status;
    map['role'] = role;
    map['gender'] = gender;
    map['isConfirmed'] = isConfirmed;
    map['isDeleted'] = isDeleted;
    map['isBlocked'] = isBlocked;
    map['wishlist'] = wishlist;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    map['changeAccountInfo'] = changeAccountInfo;
    map['otp'] = otp;
    map['otpexp'] = otpexp;
    return map;
  }

}