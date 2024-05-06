import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_clinic_renald/data/datasources/satusehat_master_wilayah_remote_datasource.dart';
import 'package:flutter_clinic_renald/data/models/response/wilayah_response_model.dart';

part 'district_bloc.freezed.dart';
part 'district_event.dart';
part 'district_state.dart';

class DistrictBloc extends Bloc<DistrictEvent, DistrictState> {
  final SatusehatMasterWilayahRemoteDataSource remoteDataSource;
  DistrictBloc(
    this.remoteDataSource,
  ) : super(const _Initial()) {
    on<_GetDistrict>((event, emit) async {
      emit(const DistrictState.loading());
      final result = await remoteDataSource.getDistricts(event.cityCode);
      result.fold(
        (l) => emit(DistrictState.error(l)),
        (r) => emit(DistrictState.loaded(r.data ?? [])),
      );
    });
  }
}
