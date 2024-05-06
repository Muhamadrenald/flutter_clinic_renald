import 'dart:convert';

import 'package:flutter_clinic_renald/data/models/response/qris_response_model.dart';
import 'package:flutter_clinic_renald/data/models/response/qris_status_response_model.dart';
import 'package:http/http.dart' as http;

class MidtransRemoteDatasource {
  String generateBasicAuthHeader(String serverKey) {
    final base64Credentials = base64Encode(utf8.encode('$serverKey:'));
    final authHeader = 'Basic $base64Credentials';

    return authHeader;
  }

  Future<QrisResponseModel> generateQRCode(
      String orderId, int grossAmount) async {
    const serverKey =
        'SB-Mid-server-KEY'; //ganti dengan server key yang didapat dari midtrans
    // 'SB-Mid-server-GUJOPIhHF9b1D1ffzjmtPHnf';
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': generateBasicAuthHeader(serverKey),
    };
    final body = jsonEncode({
      "payment_type": "gopay",
      "transaction_details": {
        "order_id": orderId,
        "gross_amount": grossAmount,
      }
    });

    final response = await http.post(
      Uri.parse('https://api.sandbox.midtrans.com/v2/charge'),
      // Uri.parse('https://api.midtrans.com/v2/charge'),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      return QrisResponseModel.fromJson(response.body);
    } else {
      throw Exception('Failed to generate QR Code.');
    }
  }

  Future<QrisStatusResponseModel> checkPaymentStatus(String orderId) async {
    const serverKey =
        'SB-Mid-server-KEY'; //ganti dengan server key yang didapat dari midtrans
    // 'SB-Mid-server-GUJOPIhHF9b1D1ffzjmtPHnf'; //ganti dengan server key yang didapat dari midtrans

    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': generateBasicAuthHeader(serverKey),
    };

    final response = await http.get(
      // Uri.parse('https://api.midtrans.com/v2/$orderId/status'),
      Uri.parse('https://api.sandbox.midtrans.com/v2/$orderId/status'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      return QrisStatusResponseModel.fromJson(response.body);
    } else {
      throw Exception('Failed to check payment status.');
    }
  }
}
