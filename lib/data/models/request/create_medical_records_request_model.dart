import 'dart:convert';

class CreateMedicalRecordsRequestModel {
  final int? patientId;
  final int? doctorId;
  final int? patientScheduleId;
  late final List<Service>? services;
  final String? status;
  final String? diagnosis;
  final String? medicalTreatments;
  final String? doctorNotes;

  CreateMedicalRecordsRequestModel({
    this.patientId,
    this.doctorId,
    this.patientScheduleId,
    this.services,
    this.status,
    this.diagnosis,
    this.medicalTreatments,
    this.doctorNotes,
  });

  factory CreateMedicalRecordsRequestModel.fromJson(String str) =>
      CreateMedicalRecordsRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CreateMedicalRecordsRequestModel.fromMap(Map<String, dynamic> json) =>
      CreateMedicalRecordsRequestModel(
        patientId: json["patient_id"],
        doctorId: json["doctor_id"],
        patientScheduleId: json["patient_schedule_id"],
        services: json["services"] == null
            ? []
            : List<Service>.from(
                json["services"]!.map((x) => Service.fromMap(x))),
        status: json["status"],
        diagnosis: json["diagnosis"],
        medicalTreatments: json["medical_treatments"],
        doctorNotes: json["doctor_notes"],
      );

  Map<String, dynamic> toMap() => {
        "patient_id": patientId,
        "doctor_id": doctorId,
        "patient_schedule_id": patientScheduleId,
        "services": services == null
            ? []
            : List<dynamic>.from(services!.map((x) => x.toMap())),
        "status": status,
        "diagnosis": diagnosis,
        "medical_treatments": medicalTreatments,
        "doctor_notes": doctorNotes,
      };
}

class Service {
  final int? id;
  final int? quantity;

  Service({
    this.id,
    this.quantity,
  });

  factory Service.fromJson(String str) => Service.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Service.fromMap(Map<String, dynamic> json) => Service(
        id: json["id"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "quantity": quantity,
      };
}
