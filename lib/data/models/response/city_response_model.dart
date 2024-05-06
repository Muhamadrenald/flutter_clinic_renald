import 'dart:convert';

class CityResponseModel {
  final int? status;
  final bool? error;
  final String? message;
  final List<City>? data;

  CityResponseModel({
    this.status,
    this.error,
    this.message,
    this.data,
  });

  factory CityResponseModel.fromJson(String str) =>
      CityResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CityResponseModel.fromMap(Map<String, dynamic> json) =>
      CityResponseModel(
        status: json["status"],
        error: json["error"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<City>.from(json["data"]!.map((x) => City.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "error": error,
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class City {
  final String? code;
  final String? parentCode;
  final String? bpsCode;
  final String? name;

  City({
    this.code,
    this.parentCode,
    this.bpsCode,
    this.name,
  });

  factory City.fromJson(String str) => City.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory City.fromMap(Map<String, dynamic> json) => City(
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
