class UserOrderModel {
  String message;
  List<Order> orders;

  UserOrderModel({
    required this.message,
    required this.orders,
  });

  factory UserOrderModel.fromJson(Map<String, dynamic> json) => UserOrderModel(
    message: json["message"],
    orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
  );

}

class Order {
  Invoice invoice;
  String id;
  String userId;
  List<String> address;
  List<String> phone;
  List<Product> products;
  int totalFinalPrice;
  String status;
  String paymentType;
  bool isDeleted;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  Order({
    required this.invoice,
    required this.id,
    required this.userId,
    required this.address,
    required this.phone,
    required this.products,
    required this.totalFinalPrice,
    required this.status,
    required this.paymentType,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    invoice: Invoice.fromJson(json["invoice"]),
    id: json["_id"],
    userId: json["userId"],
    address: List<String>.from(json["address"].map((x) => x)),
    phone: List<String>.from(json["phone"].map((x) => x)),
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    totalFinalPrice: json["totalFinalPrice"],
    status: json["status"],
    paymentType: json["paymentType"],
    isDeleted: json["isDeleted"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

}

class Invoice {
  String id;
  String url;

  Invoice({
    required this.id,
    required this.url,
  });

  factory Invoice.fromJson(Map<String, dynamic> json) => Invoice(
    id: json["id"],
    url: json["url"],
  );

}


class Product {
  String medicineId;
  String name;
  String description;
  int quantity;
  int unitPrice;
  int finalPrice;
  String id;

  Product({
    required this.medicineId,
    required this.name,
    required this.description,
    required this.quantity,
    required this.unitPrice,
    required this.finalPrice,
    required this.id,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    medicineId: json["medicineId"],
    name: json["name"],
    description: json["description"],
    quantity: json["quantity"],
    unitPrice: json["unitPrice"],
    finalPrice: json["finalPrice"],
    id: json["_id"],
  );

}





