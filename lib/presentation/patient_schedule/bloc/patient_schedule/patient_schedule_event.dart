part of 'patient_schedule_bloc.dart';

@freezed
class PatientScheduleEvent with _$PatientScheduleEvent {
  const factory PatientScheduleEvent.started() = _Started;
  const factory PatientScheduleEvent.getPatientSchedule() = _GetPatientSchedule;
}