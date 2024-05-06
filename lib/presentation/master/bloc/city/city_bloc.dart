import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_clinic_renald/data/datasources/satusehat_master_wilayah_remote_datasource.dart';

import '../../../../data/models/response/city_response_model.dart';

part 'city_bloc.freezed.dart';
part 'city_event.dart';
part 'city_state.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  final SatusehatMasterWilayahRemoteDataSource remoteDataSource;
  CityBloc(
    this.remoteDataSource,
  ) : super(const _Initial()) {
    on<_GetCity>((event, emit) async {
      emit(const CityState.loading());
      final result = await remoteDataSource.getCities(event.provinceCode);
      result.fold(
        (l) => emit(CityState.error(l)),
        (r) => emit(CityState.loaded(r.data ?? [])),
      );
    });
  }
}
