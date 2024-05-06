part of 'district_bloc.dart';

@freezed
class DistrictEvent with _$DistrictEvent {
  const factory DistrictEvent.started() = _Started;
  const factory DistrictEvent.getDistrict(int cityCode) = _GetDistrict;
}