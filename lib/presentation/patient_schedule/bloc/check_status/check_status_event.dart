part of 'check_status_bloc.dart';

@freezed
class CheckStatusEvent with _$CheckStatusEvent {
  const factory CheckStatusEvent.started() = _Started;
  const factory CheckStatusEvent.checkPaymentStatus(String orderId) = _CheckPaymentStatus;
}