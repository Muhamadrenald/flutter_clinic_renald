part of 'data_patients_bloc.dart';

@freezed
class DataPatientsEvent with _$DataPatientsEvent {
  const factory DataPatientsEvent.started() = _Started;
  const factory DataPatientsEvent.getPatients() = _GetPatients;
  const factory DataPatientsEvent.getPatientByNIK(String nik) = _GetPatientByNIK;
}