part of 'get_service_order_bloc.dart';

@freezed
class GetServiceOrderEvent with _$GetServiceOrderEvent {
  const factory GetServiceOrderEvent.started() = _Started;
  const factory GetServiceOrderEvent.getServiceOrder(int scheduleId) = _GetServiceOrder;
}