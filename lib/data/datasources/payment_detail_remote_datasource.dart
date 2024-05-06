import 'package:dartz/dartz.dart';
import 'package:flutter_clinic_renald/core/constants/variables.dart';
import 'package:flutter_clinic_renald/data/datasources/auth_local_datasource.dart';
import 'package:flutter_clinic_renald/data/models/request/create_payment_detail_request_model.dart';
import 'package:flutter_clinic_renald/data/models/response/create_payment_detail_response_model.dart';
import 'package:http/http.dart' as http;

class PaymentDetailRemoteDatasource {
  Future<Either<String, CreatePaymentDetailResponseModel>> createPaymentDetail(
      CreatePaymentDetailRequestModel requestModel) async {
    final authData = await AuthLocalDataSource().getAuthData();

    final url = Uri.parse('${Variables.baseUrl}/api/api-payment-details');

    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer ${authData?.token}',
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
      body: requestModel.toJson(),
    );

    if (response.statusCode == 201) {
      return Right(CreatePaymentDetailResponseModel.fromJson(response.body));
    } else {
      return const Left('Gagal menambahkan detail pembayaran');
    }
  }
}
