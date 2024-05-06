part of 'add_patient_bloc.dart';

@freezed
class AddPatientEvent with _$AddPatientEvent {
  const factory AddPatientEvent.started() = _Started;
  const factory AddPatientEvent.addPatient(AddPatientRequestModel data) = _AddPatient;
}