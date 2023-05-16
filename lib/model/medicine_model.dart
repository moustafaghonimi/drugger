class MedicineModel {
  String message;
  int medicineCount;
  List<Medicine> medicines;

  MedicineModel({
    required this.message,
    required this.medicineCount,
    required this.medicines,
  });

  factory MedicineModel.fromJson(Map<String, dynamic> json) => MedicineModel(
    message: json["message"],
    medicineCount: json["medicineCount"],
    medicines: List<Medicine>.from(json["medicines"].map((x) => Medicine.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "medicineCount": medicineCount,
    "medicines": List<dynamic>.from(medicines.map((x) => x.toJson())),
  };
}

class Medicine {
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
  List<dynamic> wishUsers;
  String createdBy;
  bool isDeleted;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  List<Comment> comments;

  Medicine({
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

  factory Medicine.fromJson(Map<String, dynamic> json) => Medicine(
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
    wishUsers: List<dynamic>.from(json["wishUsers"].map((x) => x)),
    createdBy: json["createdBy"],
    isDeleted: json["isDeleted"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    comments: List<Comment>.from(json["comments"].map((x) => Comment.fromJson(x))),
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
    "comments": List<dynamic>.from(comments.map((x) => x.toJson())),
  };
}

class Comment {
  String id;
  CreatedBy createdBy;
  String medicineId;
  String commentDesc;
  List<CreatedBy> like;
  List<dynamic> unlike;
  List<Reply> reply;
  bool isDeleted;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  Comment({
    required this.id,
    required this.createdBy,
    required this.medicineId,
    required this.commentDesc,
    required this.like,
    required this.unlike,
    required this.reply,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
    id: json["_id"],
    createdBy: CreatedBy.fromJson(json["createdBy"]),
    medicineId: json["medicineId"],
    commentDesc: json["commentDesc"],
    like: List<CreatedBy>.from(json["like"].map((x) => CreatedBy.fromJson(x))),
    unlike: List<dynamic>.from(json["unlike"].map((x) => x)),
    reply: List<Reply>.from(json["reply"].map((x) => Reply.fromJson(x))),
    isDeleted: json["isDeleted"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "createdBy": createdBy.toJson(),
    "medicineId": medicineId,
    "commentDesc": commentDesc,
    "like": List<dynamic>.from(like.map((x) => x.toJson())),
    "unlike": List<dynamic>.from(unlike.map((x) => x)),
    "reply": List<dynamic>.from(reply.map((x) => x.toJson())),
    "isDeleted": isDeleted,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}

class CreatedBy {
  String? id;
  String? pharName;
  String? email;
  String? phone;

  CreatedBy({
    this.id,
    this.pharName,
    this.email,
    this.phone,
  });

  factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
    id: json["_id"],
    pharName: json["pharName"],
    email: json["email"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "pharName": pharName,
    "email": email,
    "phone": phone,
  };
}
class Reply {
  String id;
  String createdBy;
  String medicineId;
  String commentDesc;
  List<dynamic> like;
  List<dynamic> unlike;
  List<dynamic> reply;
  bool isDeleted;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  Reply({
    required this.id,
    required this.createdBy,
    required this.medicineId,
    required this.commentDesc,
    required this.like,
    required this.unlike,
    required this.reply,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Reply.fromJson(Map<String, dynamic> json) => Reply(
    id: json["_id"],
    createdBy: json["createdBy"],
    medicineId: json["medicineId"],
    commentDesc: json["commentDesc"],
    like: List<dynamic>.from(json["like"].map((x) => x)),
    unlike: List<dynamic>.from(json["unlike"].map((x) => x)),
    reply: List<dynamic>.from(json["reply"].map((x) => x)),
    isDeleted: json["isDeleted"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "createdBy": createdBy,
    "medicineId": medicineId,
    "commentDesc": commentDesc,
    "like": List<dynamic>.from(like.map((x) => x)),
    "unlike": List<dynamic>.from(unlike.map((x) => x)),
    "reply": List<dynamic>.from(reply.map((x) => x)),
    "isDeleted": isDeleted,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
