import 'package:dartz/dartz.dart';
import 'package:flutter_clinic_renald/core/constants/variables.dart';
import 'package:flutter_clinic_renald/data/datasources/auth_local_datasource.dart';
import 'package:flutter_clinic_renald/data/models/request/add_reservation_request_model.dart';
import 'package:flutter_clinic_renald/data/models/response/patient_schedule_response_model.dart';
import 'package:http/http.dart' as http;

class SchedulePatientRemoteDatasource {
  Future<Either<String, String>> addReservation(
      AddReservationRequestModel data) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url = Uri.parse('${Variables.baseUrl}/api/api-patient-schedules');
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
      return const Right('Berhasil menambahkan reservasi');
    } else {
      return const Left('Gagal menambahkan reservasi');
    }
  }

  Future<Either<String, PatientScheduleResponseModel>>
      getPatientSchedules() async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url = Uri.parse('${Variables.baseUrl}/api/api-patient-schedules');
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer ${authData?.token}',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return Right(PatientScheduleResponseModel.fromJson(response.body));
    } else {
      return const Left('Gagal menambahkan reservasi');
    }
  }
}
