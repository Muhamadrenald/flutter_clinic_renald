part of 'city_bloc.dart';

@freezed
class CityEvent with _$CityEvent {
  const factory CityEvent.started() = _Started;
  const factory CityEvent.getCity(int provinceCode) = _GetCity;
}