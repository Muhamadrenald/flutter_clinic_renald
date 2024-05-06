import 'dart:convert';

class WilayahResponseModel {
  final int? status;
  final bool? error;
  final String? message;
  final List<Wilayah>? data;

  WilayahResponseModel({
    this.status,
    this.error,
    this.message,
    this.data,
  });

  factory WilayahResponseModel.fromJson(String str) =>
      WilayahResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory WilayahResponseModel.fromMap(Map<String, dynamic> json) =>
      WilayahResponseModel(
        status: json["status"],
        error: json["error"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Wilayah>.from(json["data"]!.map((x) => Wilayah.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "error": error,
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class Wilayah {
  final String? code;
  final String? parentCode;
  final String? bpsCode;
  final String? name;

  Wilayah({
    this.code,
    this.parentCode,
    this.bpsCode,
    this.name,
  });

  factory Wilayah.fromJson(String str) => Wilayah.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Wilayah.fromMap(Map<String, dynamic> json) => Wilayah(
        code: json["code"],
        parentCode: json["parent_code"],
        bpsCode: json["bps_code"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "parent_code": parentCode,
        "bps_code": bpsCode,
        "name": name,
      };

  @override
  String toString() {
    return '$name';
  }
}
