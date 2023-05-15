class CartProductModel {
  String message;
  List<ProductList> productList;

  CartProductModel({
    required this.message,
    required this.productList,
  });

  factory CartProductModel.fromJson(Map<String, dynamic> json) => CartProductModel(
    message: json["message"],
    productList: List<ProductList>.from(json["productList"].map((x) => ProductList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "productList": List<dynamic>.from(productList.map((x) => x.toJson())),
  };
}

class ProductList {
  MedicineId medicineId;
  int quantity;
  String id;

  ProductList({
    required this.medicineId,
    required this.quantity,
    required this.id,
  });

  factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
    medicineId: MedicineId.fromJson(json["medicineId"]),
    quantity: json["quantity"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "medicineId": medicineId.toJson(),
    "quantity": quantity,
    "_id": id,
  };
}

class MedicineId {
  String id;
  String medicineName;
  String medicineImage;
  String medicineType;
  DateTime medicineExpireDate;
  String medicineDesc;
  int medicineStock;
  int medicineUnitPrice;
  List<String> comments;

  MedicineId({
    required this.id,
    required this.medicineName,
    required this.medicineImage,
    required this.medicineType,
    required this.medicineExpireDate,
    required this.medicineDesc,
    required this.medicineStock,
    required this.medicineUnitPrice,
    required this.comments,
  });

  factory MedicineId.fromJson(Map<String, dynamic> json) => MedicineId(
    id: json["_id"],
    medicineName: json["medicineName"],
    medicineImage: json["medicineImage"],
    medicineType: json["medicineType"],
    medicineExpireDate: DateTime.parse(json["medicineExpireDate"]),
    medicineDesc: json["medicineDesc"],
    medicineStock: json["medicineStock"],
    medicineUnitPrice: json["medicineUnitPrice"],
    comments: List<String>.from(json["comments"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "medicineName": medicineName,
    "medicineImage": medicineImage,
    "medicineType": medicineType,
    "medicineExpireDate": medicineExpireDate.toIso8601String(),
    "medicineDesc": medicineDesc,
    "medicineStock": medicineStock,
    "medicineUnitPrice": medicineUnitPrice,
    "comments": List<dynamic>.from(comments.map((x) => x)),
  };
}