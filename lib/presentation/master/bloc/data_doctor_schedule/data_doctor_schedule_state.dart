part of 'data_doctor_schedule_bloc.dart';

@freezed
class DataDoctorScheduleState with _$DataDoctorScheduleState {
  const factory DataDoctorScheduleState.initial() = _Initial;
  const factory DataDoctorScheduleState.loading() = _Loading;
  const factory DataDoctorScheduleState.loaded(List<DoctorSchedule> doctorSchedules) = _Loaded;
  const factory DataDoctorScheduleState.error(String message) = _Error;
}
