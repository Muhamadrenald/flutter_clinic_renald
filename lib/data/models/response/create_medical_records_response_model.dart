import 'dart:convert';

class CreateMedicalRecordsResponseModel {
  final String? message;
  final Data? data;
  final String? status;

  CreateMedicalRecordsResponseModel({
    this.message,
    this.data,
    this.status,
  });

  factory CreateMedicalRecordsResponseModel.fromJson(String str) =>
      CreateMedicalRecordsResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CreateMedicalRecordsResponseModel.fromMap(
          Map<String, dynamic> json) =>
      CreateMedicalRecordsResponseModel(
        message: json["message"],
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "data": data?.toMap(),
        "status": status,
      };
}

class Data {
  final int? patientId;
  final int? doctorId;
  final int? patientScheduleId;
  final String? status;
  final String? diagnosis;
  final String? medicalTreatments;
  final String? doctorNotes;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? id;

  Data({
    this.patientId,
    this.doctorId,
    this.patientScheduleId,
    this.status,
    this.diagnosis,
    this.medicalTreatments,
    this.doctorNotes,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        patientId: json["patient_id"],
        doctorId: json["doctor_id"],
        patientScheduleId: json["patient_schedule_id"],
        status: json["status"],
        diagnosis: json["diagnosis"],
        medicalTreatments: json["medical_treatments"],
        doctorNotes: json["doctor_notes"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "patient_id": patientId,
        "doctor_id": doctorId,
        "patient_schedule_id": patientScheduleId,
        "status": status,
        "diagnosis": diagnosis,
        "medical_treatments": medicalTreatments,
        "doctor_notes": doctorNotes,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
      };
}
