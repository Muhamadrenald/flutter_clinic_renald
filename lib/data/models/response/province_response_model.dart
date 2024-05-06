import 'dart:convert';

class ProvinceResponseModel {
  final int? status;
  final bool? error;
  final String? message;
  final List<Province>? data;

  ProvinceResponseModel({
    this.status,
    this.error,
    this.message,
    this.data,
  });

  factory ProvinceResponseModel.fromJson(String str) =>
      ProvinceResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProvinceResponseModel.fromMap(Map<String, dynamic> json) =>
      ProvinceResponseModel(
        status: json["status"],
        error: json["error"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Province>.from(
                json["data"]!.map((x) => Province.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "error": error,
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class Province {
  final String? code;
  final String? parentCode;
  final String? bpsCode;
  final String? name;

  Province({
    this.code,
    this.parentCode,
    this.bpsCode,
    this.name,
  });

  factory Province.fromJson(String str) => Province.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Province.fromMap(Map<String, dynamic> json) => Province(
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
