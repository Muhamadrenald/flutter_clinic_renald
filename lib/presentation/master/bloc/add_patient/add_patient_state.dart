part of 'add_patient_bloc.dart';

@freezed
class AddPatientState with _$AddPatientState {
  const factory AddPatientState.initial() = _Initial;
  const factory AddPatientState.loading() = _Loading;
  const factory AddPatientState.loaded() = _Loaded;
  const factory AddPatientState.error(String message) = _Error;
}
