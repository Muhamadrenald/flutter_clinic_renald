import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_clinic_renald/data/datasources/schedule_patient_remote_datasource.dart';
import 'package:flutter_clinic_renald/data/models/response/patient_schedule_response_model.dart';

part 'patient_schedule_bloc.freezed.dart';
part 'patient_schedule_event.dart';
part 'patient_schedule_state.dart';

class PatientScheduleBloc
    extends Bloc<PatientScheduleEvent, PatientScheduleState> {
  final SchedulePatientRemoteDatasource schedulePatientRemoteDatasource;
  PatientScheduleBloc(
    this.schedulePatientRemoteDatasource,
  ) : super(const _Initial()) {
    on<_GetPatientSchedule>((event, emit) async {
      emit(const _Loading());
      final result =
          await schedulePatientRemoteDatasource.getPatientSchedules();
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r.data ?? [])),
      );
    });
  }
}
