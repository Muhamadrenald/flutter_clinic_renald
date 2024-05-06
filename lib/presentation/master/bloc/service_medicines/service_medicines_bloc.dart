import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_clinic_renald/data/datasources/master_remote_datasource.dart';
import 'package:flutter_clinic_renald/data/models/response/service_medicines_response_model.dart';

part 'service_medicines_bloc.freezed.dart';
part 'service_medicines_event.dart';
part 'service_medicines_state.dart';

class ServiceMedicinesBloc
    extends Bloc<ServiceMedicinesEvent, ServiceMedicinesState> {
  final MasterRemoteDatasource _remoteDatasource;
  ServiceMedicinesBloc(
    this._remoteDatasource,
  ) : super(const _Initial()) {
    on<_GetServiceMedicines>((event, emit) async {
      emit(const _Loading());
      final result = await _remoteDatasource.getServiceMedicines();
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r.data ?? [])),
      );
    });
  }
}
