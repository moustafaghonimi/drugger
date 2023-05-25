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

}

class Comment {
  String id;
  CreatedBy ? createdBy;
  String medicineId;
  String commentDesc;
  List<CreatedBy> like;
  List<dynamic> unlike;
  List<Comment> reply;
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
    reply: List<Comment>.from(json["reply"].map((x) => Comment.fromJson(x))),
    isDeleted: json["isDeleted"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );
}

class CreatedBy {
  String id;
  String pharName;
  String email;
  String? phone;
  String? profileUrl;

  CreatedBy({
    required this.id,
    required this.pharName,
    required this.email,
    required this.phone,
    this.profileUrl,
  });

  factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
    id: json["_id"],
    pharName:json["pharName"],
    email: json["email"],
    phone: json["phone"],
    profileUrl: json["profileURL"],
  );

}

