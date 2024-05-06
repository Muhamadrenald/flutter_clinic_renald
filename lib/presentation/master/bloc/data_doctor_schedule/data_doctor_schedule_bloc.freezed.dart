// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_doctor_schedule_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DataDoctorScheduleEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getDoctorSchedules,
    required TResult Function(String name) getDoctorScheduleByDoctorName,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getDoctorSchedules,
    TResult? Function(String name)? getDoctorScheduleByDoctorName,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getDoctorSchedules,
    TResult Function(String name)? getDoctorScheduleByDoctorName,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetDoctorSchedules value) getDoctorSchedules,
    required TResult Function(_GetDoctorScheduleByDoctorName value)
        getDoctorScheduleByDoctorName,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetDoctorSchedules value)? getDoctorSchedules,
    TResult? Function(_GetDoctorScheduleByDoctorName value)?
        getDoctorScheduleByDoctorName,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetDoctorSchedules value)? getDoctorSchedules,
    TResult Function(_GetDoctorScheduleByDoctorName value)?
        getDoctorScheduleByDoctorName,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataDoctorScheduleEventCopyWith<$Res> {
  factory $DataDoctorScheduleEventCopyWith(DataDoctorScheduleEvent value,
          $Res Function(DataDoctorScheduleEvent) then) =
      _$DataDoctorScheduleEventCopyWithImpl<$Res, DataDoctorScheduleEvent>;
}

/// @nodoc
class _$DataDoctorScheduleEventCopyWithImpl<$Res,
        $Val extends DataDoctorScheduleEvent>
    implements $DataDoctorScheduleEventCopyWith<$Res> {
  _$DataDoctorScheduleEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$DataDoctorScheduleEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'DataDoctorScheduleEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getDoctorSchedules,
    required TResult Function(String name) getDoctorScheduleByDoctorName,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getDoctorSchedules,
    TResult? Function(String name)? getDoctorScheduleByDoctorName,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getDoctorSchedules,
    TResult Function(String name)? getDoctorScheduleByDoctorName,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetDoctorSchedules value) getDoctorSchedules,
    required TResult Function(_GetDoctorScheduleByDoctorName value)
        getDoctorScheduleByDoctorName,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetDoctorSchedules value)? getDoctorSchedules,
    TResult? Function(_GetDoctorScheduleByDoctorName value)?
        getDoctorScheduleByDoctorName,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetDoctorSchedules value)? getDoctorSchedules,
    TResult Function(_GetDoctorScheduleByDoctorName value)?
        getDoctorScheduleByDoctorName,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements DataDoctorScheduleEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$GetDoctorSchedulesImplCopyWith<$Res> {
  factory _$$GetDoctorSchedulesImplCopyWith(_$GetDoctorSchedulesImpl value,
          $Res Function(_$GetDoctorSchedulesImpl) then) =
      __$$GetDoctorSchedulesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetDoctorSchedulesImplCopyWithImpl<$Res>
    extends _$DataDoctorScheduleEventCopyWithImpl<$Res,
        _$GetDoctorSchedulesImpl>
    implements _$$GetDoctorSchedulesImplCopyWith<$Res> {
  __$$GetDoctorSchedulesImplCopyWithImpl(_$GetDoctorSchedulesImpl _value,
      $Res Function(_$GetDoctorSchedulesImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetDoctorSchedulesImpl implements _GetDoctorSchedules {
  const _$GetDoctorSchedulesImpl();

  @override
  String toString() {
    return 'DataDoctorScheduleEvent.getDoctorSchedules()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetDoctorSchedulesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getDoctorSchedules,
    required TResult Function(String name) getDoctorScheduleByDoctorName,
  }) {
    return getDoctorSchedules();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getDoctorSchedules,
    TResult? Function(String name)? getDoctorScheduleByDoctorName,
  }) {
    return getDoctorSchedules?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getDoctorSchedules,
    TResult Function(String name)? getDoctorScheduleByDoctorName,
    required TResult orElse(),
  }) {
    if (getDoctorSchedules != null) {
      return getDoctorSchedules();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetDoctorSchedules value) getDoctorSchedules,
    required TResult Function(_GetDoctorScheduleByDoctorName value)
        getDoctorScheduleByDoctorName,
  }) {
    return getDoctorSchedules(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetDoctorSchedules value)? getDoctorSchedules,
    TResult? Function(_GetDoctorScheduleByDoctorName value)?
        getDoctorScheduleByDoctorName,
  }) {
    return getDoctorSchedules?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetDoctorSchedules value)? getDoctorSchedules,
    TResult Function(_GetDoctorScheduleByDoctorName value)?
        getDoctorScheduleByDoctorName,
    required TResult orElse(),
  }) {
    if (getDoctorSchedules != null) {
      return getDoctorSchedules(this);
    }
    return orElse();
  }
}

abstract class _GetDoctorSchedules implements DataDoctorScheduleEvent {
  const factory _GetDoctorSchedules() = _$GetDoctorSchedulesImpl;
}

/// @nodoc
abstract class _$$GetDoctorScheduleByDoctorNameImplCopyWith<$Res> {
  factory _$$GetDoctorScheduleByDoctorNameImplCopyWith(
          _$GetDoctorScheduleByDoctorNameImpl value,
          $Res Function(_$GetDoctorScheduleByDoctorNameImpl) then) =
      __$$GetDoctorScheduleByDoctorNameImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$GetDoctorScheduleByDoctorNameImplCopyWithImpl<$Res>
    extends _$DataDoctorScheduleEventCopyWithImpl<$Res,
        _$GetDoctorScheduleByDoctorNameImpl>
    implements _$$GetDoctorScheduleByDoctorNameImplCopyWith<$Res> {
  __$$GetDoctorScheduleByDoctorNameImplCopyWithImpl(
      _$GetDoctorScheduleByDoctorNameImpl _value,
      $Res Function(_$GetDoctorScheduleByDoctorNameImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$GetDoctorScheduleByDoctorNameImpl(
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetDoctorScheduleByDoctorNameImpl
    implements _GetDoctorScheduleByDoctorName {
  const _$GetDoctorScheduleByDoctorNameImpl(this.name);

  @override
  final String name;

  @override
  String toString() {
    return 'DataDoctorScheduleEvent.getDoctorScheduleByDoctorName(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetDoctorScheduleByDoctorNameImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetDoctorScheduleByDoctorNameImplCopyWith<
          _$GetDoctorScheduleByDoctorNameImpl>
      get copyWith => __$$GetDoctorScheduleByDoctorNameImplCopyWithImpl<
          _$GetDoctorScheduleByDoctorNameImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getDoctorSchedules,
    required TResult Function(String name) getDoctorScheduleByDoctorName,
  }) {
    return getDoctorScheduleByDoctorName(name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getDoctorSchedules,
    TResult? Function(String name)? getDoctorScheduleByDoctorName,
  }) {
    return getDoctorScheduleByDoctorName?.call(name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getDoctorSchedules,
    TResult Function(String name)? getDoctorScheduleByDoctorName,
    required TResult orElse(),
  }) {
    if (getDoctorScheduleByDoctorName != null) {
      return getDoctorScheduleByDoctorName(name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetDoctorSchedules value) getDoctorSchedules,
    required TResult Function(_GetDoctorScheduleByDoctorName value)
        getDoctorScheduleByDoctorName,
  }) {
    return getDoctorScheduleByDoctorName(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetDoctorSchedules value)? getDoctorSchedules,
    TResult? Function(_GetDoctorScheduleByDoctorName value)?
        getDoctorScheduleByDoctorName,
  }) {
    return getDoctorScheduleByDoctorName?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetDoctorSchedules value)? getDoctorSchedules,
    TResult Function(_GetDoctorScheduleByDoctorName value)?
        getDoctorScheduleByDoctorName,
    required TResult orElse(),
  }) {
    if (getDoctorScheduleByDoctorName != null) {
      return getDoctorScheduleByDoctorName(this);
    }
    return orElse();
  }
}

abstract class _GetDoctorScheduleByDoctorName
    implements DataDoctorScheduleEvent {
  const factory _GetDoctorScheduleByDoctorName(final String name) =
      _$GetDoctorScheduleByDoctorNameImpl;

  String get name;
  @JsonKey(ignore: true)
  _$$GetDoctorScheduleByDoctorNameImplCopyWith<
          _$GetDoctorScheduleByDoctorNameImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DataDoctorScheduleState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<DoctorSchedule> doctorSchedules) loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<DoctorSchedule> doctorSchedules)? loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<DoctorSchedule> doctorSchedules)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataDoctorScheduleStateCopyWith<$Res> {
  factory $DataDoctorScheduleStateCopyWith(DataDoctorScheduleState value,
          $Res Function(DataDoctorScheduleState) then) =
      _$DataDoctorScheduleStateCopyWithImpl<$Res, DataDoctorScheduleState>;
}

/// @nodoc
class _$DataDoctorScheduleStateCopyWithImpl<$Res,
        $Val extends DataDoctorScheduleState>
    implements $DataDoctorScheduleStateCopyWith<$Res> {
  _$DataDoctorScheduleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$DataDoctorScheduleStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'DataDoctorScheduleState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<DoctorSchedule> doctorSchedules) loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<DoctorSchedule> doctorSchedules)? loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<DoctorSchedule> doctorSchedules)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements DataDoctorScheduleState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$DataDoctorScheduleStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'DataDoctorScheduleState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<DoctorSchedule> doctorSchedules) loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<DoctorSchedule> doctorSchedules)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<DoctorSchedule> doctorSchedules)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements DataDoctorScheduleState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<DoctorSchedule> doctorSchedules});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$DataDoctorScheduleStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doctorSchedules = null,
  }) {
    return _then(_$LoadedImpl(
      null == doctorSchedules
          ? _value._doctorSchedules
          : doctorSchedules // ignore: cast_nullable_to_non_nullable
              as List<DoctorSchedule>,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(final List<DoctorSchedule> doctorSchedules)
      : _doctorSchedules = doctorSchedules;

  final List<DoctorSchedule> _doctorSchedules;
  @override
  List<DoctorSchedule> get doctorSchedules {
    if (_doctorSchedules is EqualUnmodifiableListView) return _doctorSchedules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_doctorSchedules);
  }

  @override
  String toString() {
    return 'DataDoctorScheduleState.loaded(doctorSchedules: $doctorSchedules)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality()
                .equals(other._doctorSchedules, _doctorSchedules));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_doctorSchedules));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<DoctorSchedule> doctorSchedules) loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(doctorSchedules);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<DoctorSchedule> doctorSchedules)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(doctorSchedules);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<DoctorSchedule> doctorSchedules)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(doctorSchedules);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements DataDoctorScheduleState {
  const factory _Loaded(final List<DoctorSchedule> doctorSchedules) =
      _$LoadedImpl;

  List<DoctorSchedule> get doctorSchedules;
  @JsonKey(ignore: true)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$DataDoctorScheduleStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'DataDoctorScheduleState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<DoctorSchedule> doctorSchedules) loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<DoctorSchedule> doctorSchedules)? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<DoctorSchedule> doctorSchedules)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements DataDoctorScheduleState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
