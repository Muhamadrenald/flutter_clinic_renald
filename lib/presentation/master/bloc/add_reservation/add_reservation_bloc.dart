import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_clinic_renald/data/datasources/schedule_patient_remote_datasource.dart';
import 'package:flutter_clinic_renald/data/models/request/add_reservation_request_model.dart';

part 'add_reservation_bloc.freezed.dart';
part 'add_reservation_event.dart';
part 'add_reservation_state.dart';

class AddReservationBloc
    extends Bloc<AddReservationEvent, AddReservationState> {
  final SchedulePatientRemoteDatasource schedulePatientRemoteDatasource;
  AddReservationBloc(
    this.schedulePatientRemoteDatasource,
  ) : super(const _Initial()) {
    on<_AddReservation>((event, emit) async {
      emit(const _Loading());
      final result =
          await schedulePatientRemoteDatasource.addReservation(event.data!);
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(const _Loaded()),
      );
    });
  }
}
