import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_clinic_renald/data/datasources/midtrans_remote_datasource.dart';
import 'package:flutter_clinic_renald/data/models/response/qris_status_response_model.dart';

part 'check_status_bloc.freezed.dart';
part 'check_status_event.dart';
part 'check_status_state.dart';

class CheckStatusBloc extends Bloc<CheckStatusEvent, CheckStatusState> {
  final MidtransRemoteDatasource midtransRemoteDatasource;
  CheckStatusBloc(
    this.midtransRemoteDatasource,
  ) : super(const _Initial()) {
    on<_CheckPaymentStatus>((event, emit) async {
      emit(const _Loading());
      try {
        final qrisStatusResponseModel =
            await midtransRemoteDatasource.checkPaymentStatus(
          event.orderId,
        );

        emit(_Loaded(qrisStatusResponseModel));
      } catch (e) {
        emit(_Error(e.toString()));
      }
    });
  }
}
