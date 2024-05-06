import 'package:dartz/dartz.dart';
import 'package:flutter_clinic_renald/core/constants/variables.dart';
import 'package:flutter_clinic_renald/data/models/request/add_patient_request_model.dart';
import 'package:flutter_clinic_renald/data/models/response/doctor_schedule_response_model.dart';
import 'package:flutter_clinic_renald/data/models/response/master_doctor_response_model.dart';
import 'package:flutter_clinic_renald/data/models/response/master_patient_response.dart';
import 'package:flutter_clinic_renald/data/models/response/service_medicines_response_model.dart';

import 'auth_local_datasource.dart';
import 'package:http/http.dart' as http;

class MasterRemoteDatasource {
  Future<Either<String, MasterDoctorResponseModel>> getDoctors() async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url = Uri.parse('${Variables.baseUrl}/api/api-doctors');
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer ${authData?.token}',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return Right(MasterDoctorResponseModel.fromJson(response.body));
    } else {
      return const Left('Gagal mendapatkan data dokter');
    }
  }

  Future<Either<String, MasterDoctorResponseModel>> getDoctorsByName(
      String name) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url = Uri.parse('${Variables.baseUrl}/api/api-doctors?name=$name');
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer ${authData?.token}',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return Right(MasterDoctorResponseModel.fromJson(response.body));
    } else {
      return const Left('Gagal mendapatkan data dokter');
    }
  }

  Future<Either<String, MasterPatientResponseModel>> getPatients() async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url = Uri.parse('${Variables.baseUrl}/api/api-patients');
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer ${authData?.token}',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return Right(MasterPatientResponseModel.fromJson(response.body));
    } else {
      return const Left('Gagal mendapatkan data patients');
    }
  }

  Future<Either<String, MasterPatientResponseModel>> getPatientsByNIK(
      String nik) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url = Uri.parse('${Variables.baseUrl}/api/api-patients?nik=$nik');
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer ${authData?.token}',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return Right(MasterPatientResponseModel.fromJson(response.body));
    } else {
      return const Left('Gagal mendapatkan data patients');
    }
  }

  Future<Either<String, DoctorScheduleResponseModel>>
      getDoctorSchedules() async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url = Uri.parse('${Variables.baseUrl}/api/api-doctor-schedules');
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer ${authData?.token}',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return Right(DoctorScheduleResponseModel.fromJson(response.body));
    } else {
      return const Left('Gagal mendapatkan data jadwal dokter');
    }
  }

  Future<Either<String, DoctorScheduleResponseModel>>
      getDoctorSchedulesByDoctorName(String name) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url =
        Uri.parse('${Variables.baseUrl}/api/api-doctor-schedules?name=$name');
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer ${authData?.token}',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return Right(DoctorScheduleResponseModel.fromJson(response.body));
    } else {
      return const Left('Gagal mendapatkan data jadwal dokter');
    }
  }

  Future<Either<String, ServiceMedicinesResponseModel>>
      getServiceMedicines() async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url = Uri.parse('${Variables.baseUrl}/api/api-service-medicines');
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer ${authData?.token}',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return Right(ServiceMedicinesResponseModel.fromJson(response.body));
    } else {
      return const Left('Gagal mendapatkan data service medicines');
    }
  }

  Future<Either<String, ServiceMedicinesResponseModel>>
      getServiceMedicinesByName(String name) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url =
        Uri.parse('${Variables.baseUrl}/api/api-service-medicines?name=$name');
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer ${authData?.token}',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return Right(ServiceMedicinesResponseModel.fromJson(response.body));
    } else {
      return const Left('Gagal mendapatkan data service medicines');
    }
  }

  Future<Either<String, String>> addPatient(AddPatientRequestModel data) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url = Uri.parse('${Variables.baseUrl}/api/api-patients');
    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer ${authData?.token}',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: data.toJson(),
    );

    if (response.statusCode == 201) {
      return const Right('add patient success');
    } else {
      return const Left('Gagal menambahkan data patients');
    }
  }
}
