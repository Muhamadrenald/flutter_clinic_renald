part of 'create_medical_record_bloc.dart';

@freezed
class CreateMedicalRecordState with _$CreateMedicalRecordState {
  const factory CreateMedicalRecordState.initial() = _Initial;
  const factory CreateMedicalRecordState.loading() = _Loading;
  const factory CreateMedicalRecordState.loaded(CreateMedicalRecordsResponseModel responseModel) = _Loaded;
  const factory CreateMedicalRecordState.error(String message) = _Error;
}
