import 'package:dartz/dartz.dart';
import 'package:flutter_clinic_renald/core/constants/variables.dart';
import 'package:flutter_clinic_renald/data/datasources/auth_remote_datasource.dart';
import 'package:flutter_clinic_renald/data/models/response/city_response_model.dart';
import 'package:flutter_clinic_renald/data/models/response/province_response_model.dart';
import 'package:flutter_clinic_renald/data/models/response/wilayah_response_model.dart';
import 'package:http/http.dart' as http;

class SatusehatMasterWilayahRemoteDataSource {
  Future<Either<String, ProvinceResponseModel>> getProvinces() async {
    final tokenResult = await AuthRemoteDatasource().satuSehatToken();
    final token = tokenResult.fold((l) => '-', (r) => r);
    final url =
        Uri.parse('${Variables.satuSehatUrl}/masterdata/v1/provinces?codes');
    final response = await http.get(url, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      return Right(ProvinceResponseModel.fromJson(response.body));
    } else {
      return const Left('Gagal mendapatkan data provinsi');
    }
  }

  Future<Either<String, CityResponseModel>> getCities(int provinceCode) async {
    final tokenResult = await AuthRemoteDatasource().satuSehatToken();
    final token = tokenResult.fold((l) => '-', (r) => r);
    final url = Uri.parse(
        '${Variables.satuSehatUrl}/masterdata/v1/cities?province_codes=$provinceCode');
    final response = await http.get(url, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      return Right(CityResponseModel.fromJson(response.body));
    } else {
      return const Left('Gagal mendapatkan data kota/kabupaten');
    }
  }

  Future<Either<String, WilayahResponseModel>> getDistricts(
      int cityCode) async {
    final tokenResult = await AuthRemoteDatasource().satuSehatToken();
    final token = tokenResult.fold((l) => '-', (r) => r);
    final url = Uri.parse(
        '${Variables.satuSehatUrl}/masterdata/v1/districts?city_codes=$cityCode');
    final response = await http.get(url, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      return Right(WilayahResponseModel.fromJson(response.body));
    } else {
      return const Left('Gagal mendapatkan data kecamatan');
    }
  }

  Future<Either<String, WilayahResponseModel>> getSubDistricts(
      int districtCode) async {
    final tokenResult = await AuthRemoteDatasource().satuSehatToken();
    final token = tokenResult.fold((l) => '-', (r) => r);
    final url = Uri.parse(
        '${Variables.satuSehatUrl}/masterdata/v1/sub-districts?district_codes=$districtCode');
    final response = await http.get(url, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      return Right(WilayahResponseModel.fromJson(response.body));
    } else {
      return const Left('Gagal mendapatkan data kelurahan');
    }
  }
}
