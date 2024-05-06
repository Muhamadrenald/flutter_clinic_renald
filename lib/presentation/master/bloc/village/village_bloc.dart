import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_clinic_renald/data/datasources/satusehat_master_wilayah_remote_datasource.dart';
import 'package:flutter_clinic_renald/data/models/response/wilayah_response_model.dart';

part 'village_bloc.freezed.dart';
part 'village_event.dart';
part 'village_state.dart';

class VillageBloc extends Bloc<VillageEvent, VillageState> {
  final SatusehatMasterWilayahRemoteDataSource remoteDataSource;
  VillageBloc(
    this.remoteDataSource,
  ) : super(const _Initial()) {
    on<_GetVillage>((event, emit) async {
      emit(const VillageState.loading());
      final result = await remoteDataSource.getSubDistricts(event.districtCode);
      result.fold(
        (l) => emit(VillageState.error(l)),
        (r) => emit(VillageState.loaded(r.data ?? [])),
      );
    });
  }
}
