part of 'add_reservation_bloc.dart';

@freezed
class AddReservationEvent with _$AddReservationEvent {
  const factory AddReservationEvent.started() = _Started;
  const factory AddReservationEvent.addReservation({
   final AddReservationRequestModel? data,
  }) = _AddReservation;
}