import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_clinic_renald/data/datasources/satusehat_master_wilayah_remote_datasource.dart';
import 'package:flutter_clinic_renald/data/models/response/province_response_model.dart';

part 'province_bloc.freezed.dart';
part 'province_event.dart';
part 'province_state.dart';

class ProvinceBloc extends Bloc<ProvinceEvent, ProvinceState> {
  final SatusehatMasterWilayahRemoteDataSource remoteDataSource;
  ProvinceBloc(
    this.remoteDataSource,
  ) : super(const _Initial()) {
    on<_GetProvinces>((event, emit) async {
      emit(const _Loading());
      final result = await remoteDataSource.getProvinces();
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r.data ?? [])),
      );
    });
  }
}
