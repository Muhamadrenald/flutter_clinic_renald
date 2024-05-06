import 'dart:convert';

class CreatePaymentDetailResponseModel {
  final Data? data;
  final String? message;
  final String? status;

  CreatePaymentDetailResponseModel({
    this.data,
    this.message,
    this.status,
  });

  factory CreatePaymentDetailResponseModel.fromJson(String str) =>
      CreatePaymentDetailResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CreatePaymentDetailResponseModel.fromMap(Map<String, dynamic> json) =>
      CreatePaymentDetailResponseModel(
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "data": data?.toMap(),
        "message": message,
        "status": status,
      };
}

class Data {
  final String? patientScheduleId;
  final int? patientId;
  final String? paymentMethod;
  final int? totalPrice;
  final DateTime? transactionTime;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? id;
  final PatientSchedule? patientSchedule;

  Data({
    this.patientScheduleId,
    this.patientId,
    this.paymentMethod,
    this.totalPrice,
    this.transactionTime,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.patientSchedule,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        patientScheduleId: json["patient_schedule_id"],
        patientId: json["patient_id"],
        paymentMethod: json["payment_method"],
        totalPrice: json["total_price"],
        transactionTime: json["transaction_time"] == null
            ? null
            : DateTime.parse(json["transaction_time"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"],
        patientSchedule: json["patient_schedule"] == null
            ? null
            : PatientSchedule.fromMap(json["patient_schedule"]),
      );

  Map<String, dynamic> toMap() => {
        "patient_schedule_id": patientScheduleId,
        "patient_id": patientId,
        "payment_method": paymentMethod,
        "total_price": totalPrice,
        "transaction_time": transactionTime?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
        "patient_schedule": patientSchedule?.toMap(),
      };
}

class PatientSchedule {
  final int? id;
  final int? patientId;
  final int? doctorId;
  final DateTime? scheduleTime;
  final String? complaint;
  final String? status;
  final int? noAntrian;
  final String? paymentMethod;
  final int? totalPrice;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  PatientSchedule({
    this.id,
    this.patientId,
    this.doctorId,
    this.scheduleTime,
    this.complaint,
    this.status,
    this.noAntrian,
    this.paymentMethod,
    this.totalPrice,
    this.createdAt,
    this.updatedAt,
  });

  factory PatientSchedule.fromJson(String str) =>
      PatientSchedule.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PatientSchedule.fromMap(Map<String, dynamic> json) => PatientSchedule(
        id: json["id"],
        patientId: json["patient_id"],
        doctorId: json["doctor_id"],
        scheduleTime: json["schedule_time"] == null
            ? null
            : DateTime.parse(json["schedule_time"]),
        complaint: json["complaint"],
        status: json["status"],
        noAntrian: json["no_antrian"],
        paymentMethod: json["payment_method"],
        totalPrice: json["total_price"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "patient_id": patientId,
        "doctor_id": doctorId,
        "schedule_time": scheduleTime?.toIso8601String(),
        "complaint": complaint,
        "status": status,
        "no_antrian": noAntrian,
        "payment_method": paymentMethod,
        "total_price": totalPrice,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
