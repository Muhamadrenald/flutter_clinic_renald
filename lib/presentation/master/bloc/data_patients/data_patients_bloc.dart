import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_clinic_renald/data/datasources/master_remote_datasource.dart';

import '../../../../data/models/response/master_patient_response.dart';

part 'data_patients_bloc.freezed.dart';
part 'data_patients_event.dart';
part 'data_patients_state.dart';

class DataPatientsBloc extends Bloc<DataPatientsEvent, DataPatientsState> {
  final MasterRemoteDatasource _masterRemoteDatasource;
  DataPatientsBloc(
    this._masterRemoteDatasource,
  ) : super(const _Initial()) {
    on<_GetPatients>((event, emit) async {
      emit(const _Loading());
      final result = await _masterRemoteDatasource.getPatients();
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r.data ?? [])),
      );
    });

    on<_GetPatientByNIK>((event, emit) async {
      emit(const _Loading());
      final result = await _masterRemoteDatasource.getPatientsByNIK(event.nik);
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r.data ?? [])),
      );
    });
  }
}
