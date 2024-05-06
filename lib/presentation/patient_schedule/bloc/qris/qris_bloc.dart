import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_clinic_renald/data/datasources/midtrans_remote_datasource.dart';
import 'package:flutter_clinic_renald/data/models/response/qris_response_model.dart';
import 'package:flutter_clinic_renald/data/models/response/qris_status_response_model.dart';

part 'qris_bloc.freezed.dart';
part 'qris_event.dart';
part 'qris_state.dart';

class QrisBloc extends Bloc<QrisEvent, QrisState> {
  final MidtransRemoteDatasource midtransRemoteDatasource;
  QrisResponseModel? qrisResponseModel;
  QrisBloc(
    this.midtransRemoteDatasource,
  ) : super(const _Initial()) {
    on<_GenerateQRCode>((event, emit) async {
      emit(const _Loading());
      try {
        qrisResponseModel = await midtransRemoteDatasource.generateQRCode(
          event.orderId,
          event.grossAmount,
        );
        emit(_QrisResponse(qrisResponseModel!));
      } catch (e) {
        emit(_Error(e.toString()));
      }
    });

    on<_CheckPaymentStatus>((event, emit) async {
      emit(const _Loading());
      try {
        final qrisStatusResponseModel =
            await midtransRemoteDatasource.checkPaymentStatus(
          event.orderId,
        );
        if (qrisStatusResponseModel.transactionStatus == 'pending') {
          emit(_QrisResponse(qrisResponseModel!));
        }
        emit(_StatusCheck(qrisStatusResponseModel));
      } catch (e) {
        emit(_Error(e.toString()));
      }
    });
  }
}
