part of 'village_bloc.dart';

@freezed
class VillageState with _$VillageState {
  const factory VillageState.initial() = _Initial;
  const factory VillageState.loading() = _Loading;
  const factory VillageState.loaded(List<Wilayah> villages) = _Loaded;
  const factory VillageState.error(String message) = _Error;
}
