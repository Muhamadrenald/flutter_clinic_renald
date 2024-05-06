import 'dart:convert';

class DoctorScheduleResponseModel {
  final String? status;
  final List<DoctorSchedule>? data;
  final String? message;

  DoctorScheduleResponseModel({
    this.status,
    this.data,
    this.message,
  });

  factory DoctorScheduleResponseModel.fromJson(String str) =>
      DoctorScheduleResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DoctorScheduleResponseModel.fromMap(Map<String, dynamic> json) =>
      DoctorScheduleResponseModel(
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<DoctorSchedule>.from(
                json["data"]!.map((x) => DoctorSchedule.fromMap(x))),
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
        "message": message,
      };
}

class DoctorSchedule {
  final int? id;
  final int? doctorId;
  final String? day;
  final String? time;
  final String? status;
  final String? note;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Doctor? doctor;

  DoctorSchedule({
    this.id,
    this.doctorId,
    this.day,
    this.time,
    this.status,
    this.note,
    this.createdAt,
    this.updatedAt,
    this.doctor,
  });

  factory DoctorSchedule.fromJson(String str) =>
      DoctorSchedule.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DoctorSchedule.fromMap(Map<String, dynamic> json) => DoctorSchedule(
        id: json["id"],
        doctorId: json["doctor_id"],
        day: json["day"],
        time: json["time"],
        status: json["status"],
        note: json["note"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        doctor: json["doctor"] == null ? null : Doctor.fromMap(json["doctor"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "doctor_id": doctorId,
        "day": day,
        "time": time,
        "status": status,
        "note": note,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "doctor": doctor?.toMap(),
      };
}

class Doctor {
  final int? id;
  final String? doctorName;
  final String? doctorSpecialist;
  final String? doctorPhone;
  final String? doctorEmail;
  final String? photo;
  final String? address;
  final String? sip;
  final dynamic idIhs;
  final dynamic nik;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Doctor({
    this.id,
    this.doctorName,
    this.doctorSpecialist,
    this.doctorPhone,
    this.doctorEmail,
    this.photo,
    this.address,
    this.sip,
    this.idIhs,
    this.nik,
    this.createdAt,
    this.updatedAt,
  });

  factory Doctor.fromJson(String str) => Doctor.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Doctor.fromMap(Map<String, dynamic> json) => Doctor(
        id: json["id"],
        doctorName: json["doctor_name"],
        doctorSpecialist: json["doctor_specialist"],
        doctorPhone: json["doctor_phone"],
        doctorEmail: json["doctor_email"],
        photo: json["photo"],
        address: json["address"],
        sip: json["sip"],
        idIhs: json["id_ihs"],
        nik: json["nik"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "doctor_name": doctorName,
        "doctor_specialist": doctorSpecialist,
        "doctor_phone": doctorPhone,
        "doctor_email": doctorEmail,
        "photo": photo,
        "address": address,
        "sip": sip,
        "id_ihs": idIhs,
        "nik": nik,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
