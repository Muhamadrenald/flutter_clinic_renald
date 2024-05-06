import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_clinic_renald/core/constants/variables.dart';
import 'package:flutter_clinic_renald/data/datasources/auth_local_datasource.dart';
import 'package:flutter_clinic_renald/data/models/response/auth_response_model.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDatasource {
  Future<Either<String, AuthResponseModel>> login(
      String email, String password) async {
    final url = Uri.parse('${Variables.baseUrl}/api/login');
    final response = await http.post(
      url,
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      await AuthLocalDataSource()
          .saveAuthData(AuthResponseModel.fromJson(response.body));
      return Right(AuthResponseModel.fromJson(response.body));
    } else {
      return const Left('Gagal login');
    }
  }

  Future<Either<String, String>> logout() async {
    final authDataModel = await AuthLocalDataSource().getAuthData();
    final url = Uri.parse('${Variables.baseUrl}/api/logout');
    final response = await http.post(url, headers: {
      'Authorization': 'Bearer ${authDataModel?.token}',
    });

    if (response.statusCode == 200) {
      await AuthLocalDataSource().removeAuthData();
      return const Right('Logout berhasil');
    } else {
      return const Left('Logout gagal');
    }
  }

  Future<Either<String, String>> satuSehatToken() async {
    final url = Uri.parse('${Variables.baseUrl}/api/satusehat-token');
    final response = await http.get(url, headers: {
      'Accept': 'application/json',
    });

    if (response.statusCode == 200) {
      return Right(jsonDecode(response.body)['token']);
    } else {
      return const Left('Gagal mendapatkan token');
    }
  }
}
