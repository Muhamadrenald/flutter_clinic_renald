import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_clinic_renald/data/datasources/master_remote_datasource.dart';
import 'package:flutter_clinic_renald/data/models/request/add_patient_request_model.dart';

part 'add_patient_bloc.freezed.dart';
part 'add_patient_event.dart';
part 'add_patient_state.dart';

class AddPatientBloc extends Bloc<AddPatientEvent, AddPatientState> {
  final MasterRemoteDatasource remoteDataSource;
  AddPatientBloc(
    this.remoteDataSource,
  ) : super(const _Initial()) {
    on<_AddPatient>((event, emit) async {
      emit(const AddPatientState.loading());
      final result = await remoteDataSource.addPatient(event.data);
      result.fold(
        (l) => emit(AddPatientState.error(l)),
        (r) => emit(const AddPatientState.loaded()),
      );
    });
  }
}
