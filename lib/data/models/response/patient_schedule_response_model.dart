import 'dart:convert';

class PatientScheduleResponseModel {
  final List<PatientSchedule>? data;
  final String? message;
  final String? status;

  PatientScheduleResponseModel({
    this.data,
    this.message,
    this.status,
  });

  factory PatientScheduleResponseModel.fromJson(String str) =>
      PatientScheduleResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PatientScheduleResponseModel.fromMap(Map<String, dynamic> json) =>
      PatientScheduleResponseModel(
        data: json["data"] == null
            ? []
            : List<PatientSchedule>.from(
                json["data"]!.map((x) => PatientSchedule.fromMap(x))),
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
  final Patient? patient;

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
    this.patient,
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
        patient:
            json["patient"] == null ? null : Patient.fromMap(json["patient"]),
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
        "patient": patient?.toMap(),
      };
}

class Patient {
  final int? id;
  final String? nik;
  final String? kk;
  final String? name;
  final String? phone;
  final String? email;
  final String? gender;
  final String? birthPlace;
  final DateTime? birthDate;
  final int? isDeceased;
  final String? addressLine;
  final String? city;
  final String? cityCode;
  final String? province;
  final String? provinceCode;
  final String? district;
  final String? districtCode;
  final String? village;
  final String? villageCode;
  final String? rt;
  final String? rw;
  final String? postalCode;
  final String? maritalStatus;
  final String? relationshipName;
  final String? relationshipPhone;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Patient({
    this.id,
    this.nik,
    this.kk,
    this.name,
    this.phone,
    this.email,
    this.gender,
    this.birthPlace,
    this.birthDate,
    this.isDeceased,
    this.addressLine,
    this.city,
    this.cityCode,
    this.province,
    this.provinceCode,
    this.district,
    this.districtCode,
    this.village,
    this.villageCode,
    this.rt,
    this.rw,
    this.postalCode,
    this.maritalStatus,
    this.relationshipName,
    this.relationshipPhone,
    this.createdAt,
    this.updatedAt,
  });

  factory Patient.fromJson(String str) => Patient.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Patient.fromMap(Map<String, dynamic> json) => Patient(
        id: json["id"],
        nik: json["nik"],
        kk: json["kk"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        gender: json["gender"],
        birthPlace: json["birth_place"],
        birthDate: json["birth_date"] == null
            ? null
            : DateTime.parse(json["birth_date"]),
        isDeceased: json["is_deceased"],
        addressLine: json["address_line"],
        city: json["city"],
        cityCode: json["city_code"],
        province: json["province"],
        provinceCode: json["province_code"],
        district: json["district"],
        districtCode: json["district_code"],
        village: json["village"],
        villageCode: json["village_code"],
        rt: json["rt"],
        rw: json["rw"],
        postalCode: json["postal_code"],
        maritalStatus: json["marital_status"],
        relationshipName: json["relationship_name"],
        relationshipPhone: json["relationship_phone"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nik": nik,
        "kk": kk,
        "name": name,
        "phone": phone,
        "email": email,
        "gender": gender,
        "birth_place": birthPlace,
        "birth_date":
            "${birthDate!.year.toString().padLeft(4, '0')}-${birthDate!.month.toString().padLeft(2, '0')}-${birthDate!.day.toString().padLeft(2, '0')}",
        "is_deceased": isDeceased,
        "address_line": addressLine,
        "city": city,
        "city_code": cityCode,
        "province": province,
        "province_code": provinceCode,
        "district": district,
        "district_code": districtCode,
        "village": village,
        "village_code": villageCode,
        "rt": rt,
        "rw": rw,
        "postal_code": postalCode,
        "marital_status": maritalStatus,
        "relationship_name": relationshipName,
        "relationship_phone": relationshipPhone,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
