part of 'add_reservation_bloc.dart';

@freezed
class AddReservationState with _$AddReservationState {
  const factory AddReservationState.initial() = _Initial;
  const factory AddReservationState.loading() = _Loading;
  const factory AddReservationState.loaded() = _Loaded;
  const factory AddReservationState.error(String message) = _Error;
}
