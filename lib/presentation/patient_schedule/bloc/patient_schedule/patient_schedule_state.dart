part of 'patient_schedule_bloc.dart';

@freezed
class PatientScheduleState with _$PatientScheduleState {
  const factory PatientScheduleState.initial() = _Initial;
  const factory PatientScheduleState.loading() = _Loading;
  const factory PatientScheduleState.loaded(List<PatientSchedule> data) = _Loaded;
  const factory PatientScheduleState.error(String message) = _Error;
}
