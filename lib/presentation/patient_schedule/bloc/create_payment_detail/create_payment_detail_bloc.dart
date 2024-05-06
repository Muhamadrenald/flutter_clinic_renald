import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_clinic_renald/data/datasources/payment_detail_remote_datasource.dart';
import 'package:flutter_clinic_renald/data/models/request/create_payment_detail_request_model.dart';
import 'package:flutter_clinic_renald/data/models/response/create_payment_detail_response_model.dart';

part 'create_payment_detail_bloc.freezed.dart';
part 'create_payment_detail_event.dart';
part 'create_payment_detail_state.dart';

class CreatePaymentDetailBloc
    extends Bloc<CreatePaymentDetailEvent, CreatePaymentDetailState> {
  final PaymentDetailRemoteDatasource paymentDetailRemoteDatasource;
  CreatePaymentDetailBloc(
    this.paymentDetailRemoteDatasource,
  ) : super(const _Initial()) {
    on<_Create>((event, emit) async {
      emit(const _Loading());
      try {
        final response =
            await paymentDetailRemoteDatasource.createPaymentDetail(
          event.createPaymentDetailRequestModel,
        );
        response.fold(
          (l) => emit(_Error(l)),
          (r) => emit(_Loaded(r)),
        );
      } catch (e) {
        emit(_Error(e.toString()));
      }
    });
  }
}
