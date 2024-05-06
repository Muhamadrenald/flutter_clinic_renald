import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_clinic_renald/data/datasources/master_remote_datasource.dart';

import '../../../../data/models/response/doctor_schedule_response_model.dart';

part 'data_doctor_schedule_bloc.freezed.dart';
part 'data_doctor_schedule_event.dart';
part 'data_doctor_schedule_state.dart';

class DataDoctorScheduleBloc
    extends Bloc<DataDoctorScheduleEvent, DataDoctorScheduleState> {
  final MasterRemoteDatasource _remoteDatasource;
  DataDoctorScheduleBloc(
    this._remoteDatasource,
  ) : super(const _Initial()) {
    on<_GetDoctorSchedules>((event, emit) async {
      emit(const _Loading());
      final result = await _remoteDatasource.getDoctorSchedules();
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r.data ?? [])),
      );
    });

    on<_GetDoctorScheduleByDoctorName>((event, emit) async {
      emit(const _Loading());
      final result =
          await _remoteDatasource.getDoctorSchedulesByDoctorName(event.name);
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r.data ?? [])),
      );
    });
  }
}
