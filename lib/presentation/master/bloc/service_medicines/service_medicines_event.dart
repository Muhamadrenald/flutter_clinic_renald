part of 'service_medicines_bloc.dart';

@freezed
class ServiceMedicinesEvent with _$ServiceMedicinesEvent {
  const factory ServiceMedicinesEvent.started() = _Started;
  const factory ServiceMedicinesEvent.getServiceMedicines() = _GetServiceMedicines;
  const factory ServiceMedicinesEvent.getServiceMedicinesByName(String name) = _GetServiceMedicinesByName;
}