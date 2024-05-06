import 'dart:convert';

class ServiceMedicinesResponseModel {
  final List<ServiceMedicines>? data;
  final String? message;
  final String? status;

  ServiceMedicinesResponseModel({
    this.data,
    this.message,
    this.status,
  });

  factory ServiceMedicinesResponseModel.fromJson(String str) =>
      ServiceMedicinesResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ServiceMedicinesResponseModel.fromMap(Map<String, dynamic> json) =>
      ServiceMedicinesResponseModel(
        data: json["data"] == null
            ? []
            : List<ServiceMedicines>.from(
                json["data"]!.map((x) => ServiceMedicines.fromMap(x))),
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

class ServiceMedicines {
  final int? id;
  final String? name;
  final String? category;
  final String? price;
  final int? quantity;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ServiceMedicines({
    this.id,
    this.name,
    this.category,
    this.price,
    this.quantity,
    this.createdAt,
    this.updatedAt,
  });

  factory ServiceMedicines.fromJson(String str) =>
      ServiceMedicines.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ServiceMedicines.fromMap(Map<String, dynamic> json) =>
      ServiceMedicines(
        id: json["id"],
        name: json["name"],
        category: json["category"],
        price: json["price"],
        quantity: json["quantity"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "category": category,
        "price": price,
        "quantity": quantity,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
