class ResetPasswordModel {
  ResetPasswordModel({
    required this.status,
    required this.message,
    required this.result,
  });
  late final String status;
  late final String message;
  late final Result result;

  ResetPasswordModel.fromJson(Map<String, dynamic> json){
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
    required this.id,
    required this.pharId,
    required this.firstName,
    required this.lastName,
    required this.pharName,
    required this.email,
    required this.password,
    required this.status,
    required this.role,
    required this.gender,
    required this.isConfirmed,
    required this.isDeleted,
    required this.isBlocked,
    required this.wishlist,
    required this.createdAt,
    required this.updatedAt,
    required this.V,
  });
  late final String id;
  late final String pharId;
  late final String firstName;
  late final String lastName;
  late final String pharName;
  late final String email;
  late final String password;
  late final String status;
  late final String role;
  late final String gender;
  late final bool isConfirmed;
  late final bool isDeleted;
  late final bool isBlocked;
  late final List<dynamic> wishlist;
  late final String createdAt;
  late final String updatedAt;
  late final int V;

  Result.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    pharId = json['pharId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    pharName = json['pharName'];
    email = json['email'];
    password = json['password'];
    status = json['status'];
    role = json['role'];
    gender = json['gender'];
    isConfirmed = json['isConfirmed'];
    isDeleted = json['isDeleted'];
    isBlocked = json['isBlocked'];
    wishlist = List.castFrom<dynamic, dynamic>(json['wishlist']);
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['pharId'] = pharId;
    _data['firstName'] = firstName;
    _data['lastName'] = lastName;
    _data['pharName'] = pharName;
    _data['email'] = email;
    _data['password'] = password;
    _data['status'] = status;
    _data['role'] = role;
    _data['gender'] = gender;
    _data['isConfirmed'] = isConfirmed;
    _data['isDeleted'] = isDeleted;
    _data['isBlocked'] = isBlocked;
    _data['wishlist'] = wishlist;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['_v'] = V;
    return _data;
  }
}