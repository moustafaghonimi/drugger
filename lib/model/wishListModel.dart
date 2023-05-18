class WishListModel {
  WishListModel({
    required this.status,
    required this.message,
    required this.result,
  });
  late final String status;
  late final String message;
  late final Result result;

  WishListModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    result = Result.fromJson(json['result']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['result'] = result.toJson();
    return _data;
  }
}

class Result {
  Result({
    required this.sid,
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
    required this.V,
  });
  late final String sid;
  late final String pharId;
  late final String userName;
  late final String firstName;
  late final String lastName;
  late final String pharName;
  late final String email;
  late final int age;
  late final String phone;
  late final String gender;
  late final List<Wishlist> wishlist;
  late final int V;

  Result.fromJson(Map<String, dynamic> json){
    sid = json['_id'];
    pharId = json['pharId'];
    userName = json['userName'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    pharName = json['pharName'];
    email = json['email'];
    age = json['age'];
    phone = json['phone'];
    gender = json['gender'];
    wishlist = List.from(json['wishlist']).map((e)=>Wishlist.fromJson(e)).toList();
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = sid;
    _data['pharId'] = pharId;
    _data['userName'] = userName;
    _data['firstName'] = firstName;
    _data['lastName'] = lastName;
    _data['pharName'] = pharName;
    _data['email'] = email;
    _data['age'] = age;
    _data['phone'] = phone;
    _data['gender'] = gender;
    _data['wishlist'] = wishlist.map((e)=>e.toJson()).toList();
    _data['__v'] = V;
    return _data;
  }
}

class Wishlist {
  Wishlist({
    required this.sid,
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
    required this.V,
    required this.comments,
  });
  late final String sid;
  late final String medicineName;
  late final String medicineSlug;
  late final String customId;
  late final String medicineImage;
  late final String medicineType;
  late final String medicineExpireDate;
  late final String medicineDesc;
  late final int medicineStock;
  late final int medicineUnitPrice;
  late final List<String> wishUsers;
  late final String createdBy;
  late final bool isDeleted;
  late final String createdAt;
  late final String updatedAt;
  late final int V;
  late final List<String> comments;

  Wishlist.fromJson(Map<String, dynamic> json){
    sid = json['_id'];
    medicineName = json['medicineName'];
    medicineSlug = json['medicineSlug'];
    customId = json['customId'];
    medicineImage = json['medicineImage'];
    medicineType = json['medicineType'];
    medicineExpireDate = json['medicineExpireDate'];
    medicineDesc = json['medicineDesc'];
    medicineStock = json['medicineStock'];
    medicineUnitPrice = json['medicineUnitPrice'];
    wishUsers = List.castFrom<dynamic, String>(json['wishUsers']);
    createdBy = json['createdBy'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    V = json['__v'];
    comments = List.castFrom<dynamic, String>(json['comments']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = sid;
    _data['medicineName'] = medicineName;
    _data['medicineSlug'] = medicineSlug;
    _data['customId'] = customId;
    _data['medicineImage'] = medicineImage;
    _data['medicineType'] = medicineType;
    _data['medicineExpireDate'] = medicineExpireDate;
    _data['medicineDesc'] = medicineDesc;
    _data['medicineStock'] = medicineStock;
    _data['medicineUnitPrice'] = medicineUnitPrice;
    _data['wishUsers'] = wishUsers;
    _data['createdBy'] = createdBy;
    _data['isDeleted'] = isDeleted;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['__v'] = V;
    _data['comments'] = comments;
    return _data;
  }
}