import 'dart:convert';

class ServiceOrderResponseModel {
  final List<ServiceOrder>? data;
  final String? message;
  final String? status;

  ServiceOrderResponseModel({
    this.data,
    this.message,
    this.status,
  });

  factory ServiceOrderResponseModel.fromJson(String str) =>
      ServiceOrderResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ServiceOrderResponseModel.fromMap(Map<String, dynamic> json) =>
      ServiceOrderResponseModel(
        data: json["data"] == null
            ? []
            : List<ServiceOrder>.from(
                json["data"]!.map((x) => ServiceOrder.fromMap(x))),
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
        "message": message,
        "status": status,
      };
}

class ServiceOrder {
  final int? id;
  final int? quantity;
  final String? name;
  final String? price;
  final double? total;

  ServiceOrder({
    this.id,
    this.quantity,
    this.name,
    this.price,
    this.total,
  });

  factory ServiceOrder.fromJson(String str) =>
      ServiceOrder.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ServiceOrder.fromMap(Map<String, dynamic> json) => ServiceOrder(
        id: json["id"],
        quantity: json["quantity"],
        name: json["name"],
        price: json["price"],
        total: json["total"]?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "quantity": quantity,
        "name": name,
        "price": price,
        "total": total,
      };
}
