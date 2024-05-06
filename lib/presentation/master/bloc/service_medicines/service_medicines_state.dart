part of 'service_medicines_bloc.dart';

@freezed
class ServiceMedicinesState with _$ServiceMedicinesState {
  const factory ServiceMedicinesState.initial() = _Initial;
  const factory ServiceMedicinesState.loading() = _Loading;
  const factory ServiceMedicinesState.loaded(List<ServiceMedicines> data) = _Loaded;
  const factory ServiceMedicinesState.error(String message) = _Error;
}
