part of 'district_bloc.dart';

@freezed
class DistrictState with _$DistrictState {
  const factory DistrictState.initial() = _Initial;
  const factory DistrictState.loading() = _Loading;
  const factory DistrictState.loaded(List<Wilayah> districts) = _Loaded;
  const factory DistrictState.error(String message) = _Error;
}
