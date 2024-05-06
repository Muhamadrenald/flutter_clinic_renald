import 'dart:convert';

class AddReservationRequestModel {
  final int? patientId;
  final int? doctorId;
  final DateTime? scheduleTime;
  final String? complaint;
  final String? status;

  AddReservationRequestModel({
    this.patientId,
    this.doctorId,
    this.scheduleTime,
    this.complaint,
    this.status,
  });

  factory AddReservationRequestModel.fromJson(String str) =>
      AddReservationRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddReservationRequestModel.fromMap(Map<String, dynamic> json) =>
      AddReservationRequestModel(
        patientId: json["patient_id"],
        doctorId: json["doctor_id"],
        scheduleTime: json["schedule_time"] == null
            ? null
            : DateTime.parse(json["schedule_time"]),
        complaint: json["complaint"],
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "patient_id": patientId,
        "doctor_id": doctorId,
        "schedule_time": scheduleTime?.toIso8601String(),
        "complaint": complaint,
        "status": status,
      };
}
