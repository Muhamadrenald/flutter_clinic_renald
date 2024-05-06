import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_clinic_renald/data/datasources/medical_records_remote_datasource.dart';
import 'package:flutter_clinic_renald/data/models/request/create_medical_records_request_model.dart';
import 'package:flutter_clinic_renald/data/models/response/create_medical_records_response_model.dart';

part 'create_medical_record_bloc.freezed.dart';
part 'create_medical_record_event.dart';
part 'create_medical_record_state.dart';

class CreateMedicalRecordBloc
    extends Bloc<CreateMedicalRecordEvent, CreateMedicalRecordState> {
  final MedicalRecordsRemoteDatasource remoteDatasource;
  CreateMedicalRecordBloc(
    this.remoteDatasource,
  ) : super(const _Initial()) {
    on<_CreateMedicalRecord>((event, emit) async {
      emit(const _Loading());
      final response =
          await remoteDatasource.createMedicalRecordPatient(event.request);
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
