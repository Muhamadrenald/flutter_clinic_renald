part of 'create_medical_record_bloc.dart';

@freezed
class CreateMedicalRecordEvent with _$CreateMedicalRecordEvent {
  const factory CreateMedicalRecordEvent.started() = _Started;
  const factory CreateMedicalRecordEvent.createMedicalRecord(
      CreateMedicalRecordsRequestModel request) = _CreateMedicalRecord;
}