part of 'data_patients_bloc.dart';

@freezed
class DataPatientsState with _$DataPatientsState {
  const factory DataPatientsState.initial() = _Initial;
  const factory DataPatientsState.loading() = _Loading;
  //loaded
  const factory DataPatientsState.loaded(List<MasterPatient> patients) = _Loaded;
  //error
  const factory DataPatientsState.error(String message) = _Error;
}
