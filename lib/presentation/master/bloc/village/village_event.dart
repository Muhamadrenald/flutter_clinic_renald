part of 'village_bloc.dart';

@freezed
class VillageEvent with _$VillageEvent {
  const factory VillageEvent.started() = _Started;
  const factory VillageEvent.getVillage(int districtCode) = _GetVillage;
}