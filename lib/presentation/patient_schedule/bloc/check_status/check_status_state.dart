part of 'check_status_bloc.dart';

@freezed
class CheckStatusState with _$CheckStatusState {
  const factory CheckStatusState.initial() = _Initial;
  const factory CheckStatusState.loading() = _Loading;
  const factory CheckStatusState.loaded(QrisStatusResponseModel checkStatusResponse) = _Loaded;
  const factory CheckStatusState.error(String message) = _Error;
}
