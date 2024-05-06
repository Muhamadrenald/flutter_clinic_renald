import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_clinic_renald/data/datasources/medical_records_remote_datasource.dart';
import 'package:flutter_clinic_renald/data/models/response/service_order_response_model.dart';

part 'get_service_order_bloc.freezed.dart';
part 'get_service_order_event.dart';
part 'get_service_order_state.dart';

class GetServiceOrderBloc
    extends Bloc<GetServiceOrderEvent, GetServiceOrderState> {
  final MedicalRecordsRemoteDatasource _remoteDatasource;
  GetServiceOrderBloc(
    this._remoteDatasource,
  ) : super(const _Initial()) {
    on<_GetServiceOrder>((event, emit) async {
      emit(const _Loading());
      final result =
          await _remoteDatasource.getServiceOrderByScheduleId(event.scheduleId);
      result.fold(
        (error) => emit(_Error(error)),
        (data) => emit(_Loaded(data)),
      );
    });
  }
}
