part of 'create_payment_detail_bloc.dart';

@freezed
class CreatePaymentDetailEvent with _$CreatePaymentDetailEvent {
  const factory CreatePaymentDetailEvent.started() = _Started;
  const factory CreatePaymentDetailEvent.create(
      CreatePaymentDetailRequestModel createPaymentDetailRequestModel) = _Create;
}