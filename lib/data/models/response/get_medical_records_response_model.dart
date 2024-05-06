import 'dart:convert';

import 'package:flutter_clinic_renald/data/models/response/master_doctor_response_model.dart';
import 'package:flutter_clinic_renald/data/models/response/master_patient_response.dart';
import 'package:flutter_clinic_renald/data/models/response/patient_schedule_response_model.dart';

class GetMedicalRecordsResponseModel {
  final List<MedicalRecord>? data;
  final String? message;
  final String? status;

  GetMedicalRecordsResponseModel({
    this.data,
    this.message,
    this.status,
  });

  factory GetMedicalRecordsResponseModel.fromJson(String str) =>
      GetMedicalRecordsResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetMedicalRecordsResponseModel.fromMap(Map<String, dynamic> json) =>
      GetMedicalRecordsResponseModel(
        data: json["data"] == null
            ? []
            : List<MedicalRecord>.from(
                json["data"]!.map((x) => MedicalRecord.fromMap(x))),
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

class MedicalRecord {
  final int? id;
  final int? patientId;
  final int? doctorId;
  final int? patientScheduleId;
  final String? diagnosis;
  final String? medicalTreatments;
  final String? doctorNotes;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? status;
  final MasterDoctor? doctor;
  final MasterPatient? patient;
  final List<ServiceAndMedicine>? serviceAndMedicine;
  final PatientSchedule? patientSchedule;

  MedicalRecord({
    this.id,
    this.patientId,
    this.doctorId,
    this.patientScheduleId,
    this.diagnosis,
    this.medicalTreatments,
    this.doctorNotes,
    this.createdAt,
    this.updatedAt,
    this.status,
    this.doctor,
    this.patient,
    this.serviceAndMedicine,
    this.patientSchedule,
  });

  factory MedicalRecord.fromJson(String str) =>
      MedicalRecord.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MedicalRecord.fromMap(Map<String, dynamic> json) => MedicalRecord(
        id: json["id"],
        patientId: json["patient_id"],
        doctorId: json["doctor_id"],
        patientScheduleId: json["patient_schedule_id"],
        diagnosis: json["diagnosis"],
        medicalTreatments: json["medical_treatments"],
        doctorNotes: json["doctor_notes"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        status: json["status"],
        doctor: json["doctor"] == null
            ? null
            : MasterDoctor.fromMap(json["doctor"]),
        patient: json["patient"] == null
            ? null
            : MasterPatient.fromMap(json["patient"]),
        serviceAndMedicine: json["service_and_medicine"] == null
            ? []
            : List<ServiceAndMedicine>.from(json["service_and_medicine"]!
                .map((x) => ServiceAndMedicine.fromMap(x))),
        patientSchedule: json["patient_schedule"] == null
            ? null
            : PatientSchedule.fromMap(json["patient_schedule"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "patient_id": patientId,
        "doctor_id": doctorId,
        "patient_schedule_id": patientScheduleId,
        "diagnosis": diagnosis,
        "medical_treatments": medicalTreatments,
        "doctor_notes": doctorNotes,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "status": status,
        "doctor": doctor?.toMap(),
        "patient": patient?.toMap(),
        "service_and_medicine": serviceAndMedicine == null
            ? []
            : List<dynamic>.from(serviceAndMedicine!.map((x) => x.toMap())),
        "patient_schedule": patientSchedule?.toMap(),
      };
}

class ServiceAndMedicine {
  final int? id;
  final String? name;
  final String? category;
  final int? price;
  final dynamic quantity;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Pivot? pivot;

  ServiceAndMedicine({
    this.id,
    this.name,
    this.category,
    this.price,
    this.quantity,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  factory ServiceAndMedicine.fromJson(String str) =>
      ServiceAndMedicine.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ServiceAndMedicine.fromMap(Map<String, dynamic> json) =>
      ServiceAndMedicine(
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
        pivot: json["pivot"] == null ? null : Pivot.fromMap(json["pivot"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "category": category,
        "price": price,
        "quantity": quantity,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "pivot": pivot?.toMap(),
      };
}

class Pivot {
  final int? medicalRecordId;
  final int? serviceAndMedicineId;

  Pivot({
    this.medicalRecordId,
    this.serviceAndMedicineId,
  });

  factory Pivot.fromJson(String str) => Pivot.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Pivot.fromMap(Map<String, dynamic> json) => Pivot(
        medicalRecordId: json["medical_record_id"],
        serviceAndMedicineId: json["service_and_medicine_id"],
      );

  Map<String, dynamic> toMap() => {
        "medical_record_id": medicalRecordId,
        "service_and_medicine_id": serviceAndMedicineId,
      };
}
