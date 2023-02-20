// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TaskStatus {
  String get taskId => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String taskId, int percentage, String url)
        ongoing,
    required TResult Function(String taskId, String url) completed,
    required TResult Function(String taskId, String url, String? error) failed,
    required TResult Function(String taskId, String url) cancelled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String taskId, int percentage, String url)? ongoing,
    TResult? Function(String taskId, String url)? completed,
    TResult? Function(String taskId, String url, String? error)? failed,
    TResult? Function(String taskId, String url)? cancelled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String taskId, int percentage, String url)? ongoing,
    TResult Function(String taskId, String url)? completed,
    TResult Function(String taskId, String url, String? error)? failed,
    TResult Function(String taskId, String url)? cancelled,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnGoing value) ongoing,
    required TResult Function(Completed value) completed,
    required TResult Function(Failed value) failed,
    required TResult Function(Cancelled value) cancelled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnGoing value)? ongoing,
    TResult? Function(Completed value)? completed,
    TResult? Function(Failed value)? failed,
    TResult? Function(Cancelled value)? cancelled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnGoing value)? ongoing,
    TResult Function(Completed value)? completed,
    TResult Function(Failed value)? failed,
    TResult Function(Cancelled value)? cancelled,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TaskStatusCopyWith<TaskStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskStatusCopyWith<$Res> {
  factory $TaskStatusCopyWith(
          TaskStatus value, $Res Function(TaskStatus) then) =
      _$TaskStatusCopyWithImpl<$Res, TaskStatus>;
  @useResult
  $Res call({String taskId, String url});
}

/// @nodoc
class _$TaskStatusCopyWithImpl<$Res, $Val extends TaskStatus>
    implements $TaskStatusCopyWith<$Res> {
  _$TaskStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OnGoingCopyWith<$Res> implements $TaskStatusCopyWith<$Res> {
  factory _$$OnGoingCopyWith(_$OnGoing value, $Res Function(_$OnGoing) then) =
      __$$OnGoingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String taskId, int percentage, String url});
}

/// @nodoc
class __$$OnGoingCopyWithImpl<$Res>
    extends _$TaskStatusCopyWithImpl<$Res, _$OnGoing>
    implements _$$OnGoingCopyWith<$Res> {
  __$$OnGoingCopyWithImpl(_$OnGoing _value, $Res Function(_$OnGoing) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = null,
    Object? percentage = null,
    Object? url = null,
  }) {
    return _then(_$OnGoing(
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as int,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnGoing extends OnGoing {
  _$OnGoing({required this.taskId, required this.percentage, required this.url})
      : super._();

  @override
  final String taskId;
  @override
  final int percentage;
  @override
  final String url;

  @override
  String toString() {
    return 'TaskStatus.ongoing(taskId: $taskId, percentage: $percentage, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnGoing &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage) &&
            (identical(other.url, url) || other.url == url));
  }

  @override
  int get hashCode => Object.hash(runtimeType, taskId, percentage, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnGoingCopyWith<_$OnGoing> get copyWith =>
      __$$OnGoingCopyWithImpl<_$OnGoing>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String taskId, int percentage, String url)
        ongoing,
    required TResult Function(String taskId, String url) completed,
    required TResult Function(String taskId, String url, String? error) failed,
    required TResult Function(String taskId, String url) cancelled,
  }) {
    return ongoing(taskId, percentage, url);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String taskId, int percentage, String url)? ongoing,
    TResult? Function(String taskId, String url)? completed,
    TResult? Function(String taskId, String url, String? error)? failed,
    TResult? Function(String taskId, String url)? cancelled,
  }) {
    return ongoing?.call(taskId, percentage, url);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String taskId, int percentage, String url)? ongoing,
    TResult Function(String taskId, String url)? completed,
    TResult Function(String taskId, String url, String? error)? failed,
    TResult Function(String taskId, String url)? cancelled,
    required TResult orElse(),
  }) {
    if (ongoing != null) {
      return ongoing(taskId, percentage, url);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnGoing value) ongoing,
    required TResult Function(Completed value) completed,
    required TResult Function(Failed value) failed,
    required TResult Function(Cancelled value) cancelled,
  }) {
    return ongoing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnGoing value)? ongoing,
    TResult? Function(Completed value)? completed,
    TResult? Function(Failed value)? failed,
    TResult? Function(Cancelled value)? cancelled,
  }) {
    return ongoing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnGoing value)? ongoing,
    TResult Function(Completed value)? completed,
    TResult Function(Failed value)? failed,
    TResult Function(Cancelled value)? cancelled,
    required TResult orElse(),
  }) {
    if (ongoing != null) {
      return ongoing(this);
    }
    return orElse();
  }
}

abstract class OnGoing extends TaskStatus {
  factory OnGoing(
      {required final String taskId,
      required final int percentage,
      required final String url}) = _$OnGoing;
  OnGoing._() : super._();

  @override
  String get taskId;
  int get percentage;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$OnGoingCopyWith<_$OnGoing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CompletedCopyWith<$Res> implements $TaskStatusCopyWith<$Res> {
  factory _$$CompletedCopyWith(
          _$Completed value, $Res Function(_$Completed) then) =
      __$$CompletedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String taskId, String url});
}

/// @nodoc
class __$$CompletedCopyWithImpl<$Res>
    extends _$TaskStatusCopyWithImpl<$Res, _$Completed>
    implements _$$CompletedCopyWith<$Res> {
  __$$CompletedCopyWithImpl(
      _$Completed _value, $Res Function(_$Completed) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = null,
    Object? url = null,
  }) {
    return _then(_$Completed(
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Completed extends Completed {
  _$Completed({required this.taskId, required this.url}) : super._();

  @override
  final String taskId;
  @override
  final String url;

  @override
  String toString() {
    return 'TaskStatus.completed(taskId: $taskId, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Completed &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            (identical(other.url, url) || other.url == url));
  }

  @override
  int get hashCode => Object.hash(runtimeType, taskId, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CompletedCopyWith<_$Completed> get copyWith =>
      __$$CompletedCopyWithImpl<_$Completed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String taskId, int percentage, String url)
        ongoing,
    required TResult Function(String taskId, String url) completed,
    required TResult Function(String taskId, String url, String? error) failed,
    required TResult Function(String taskId, String url) cancelled,
  }) {
    return completed(taskId, url);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String taskId, int percentage, String url)? ongoing,
    TResult? Function(String taskId, String url)? completed,
    TResult? Function(String taskId, String url, String? error)? failed,
    TResult? Function(String taskId, String url)? cancelled,
  }) {
    return completed?.call(taskId, url);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String taskId, int percentage, String url)? ongoing,
    TResult Function(String taskId, String url)? completed,
    TResult Function(String taskId, String url, String? error)? failed,
    TResult Function(String taskId, String url)? cancelled,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(taskId, url);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnGoing value) ongoing,
    required TResult Function(Completed value) completed,
    required TResult Function(Failed value) failed,
    required TResult Function(Cancelled value) cancelled,
  }) {
    return completed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnGoing value)? ongoing,
    TResult? Function(Completed value)? completed,
    TResult? Function(Failed value)? failed,
    TResult? Function(Cancelled value)? cancelled,
  }) {
    return completed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnGoing value)? ongoing,
    TResult Function(Completed value)? completed,
    TResult Function(Failed value)? failed,
    TResult Function(Cancelled value)? cancelled,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(this);
    }
    return orElse();
  }
}

abstract class Completed extends TaskStatus {
  factory Completed({required final String taskId, required final String url}) =
      _$Completed;
  Completed._() : super._();

  @override
  String get taskId;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$CompletedCopyWith<_$Completed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailedCopyWith<$Res> implements $TaskStatusCopyWith<$Res> {
  factory _$$FailedCopyWith(_$Failed value, $Res Function(_$Failed) then) =
      __$$FailedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String taskId, String url, String? error});
}

/// @nodoc
class __$$FailedCopyWithImpl<$Res>
    extends _$TaskStatusCopyWithImpl<$Res, _$Failed>
    implements _$$FailedCopyWith<$Res> {
  __$$FailedCopyWithImpl(_$Failed _value, $Res Function(_$Failed) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = null,
    Object? url = null,
    Object? error = freezed,
  }) {
    return _then(_$Failed(
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$Failed extends Failed {
  _$Failed({required this.taskId, required this.url, this.error}) : super._();

  @override
  final String taskId;
  @override
  final String url;
  @override
  final String? error;

  @override
  String toString() {
    return 'TaskStatus.failed(taskId: $taskId, url: $url, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Failed &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, taskId, url, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailedCopyWith<_$Failed> get copyWith =>
      __$$FailedCopyWithImpl<_$Failed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String taskId, int percentage, String url)
        ongoing,
    required TResult Function(String taskId, String url) completed,
    required TResult Function(String taskId, String url, String? error) failed,
    required TResult Function(String taskId, String url) cancelled,
  }) {
    return failed(taskId, url, error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String taskId, int percentage, String url)? ongoing,
    TResult? Function(String taskId, String url)? completed,
    TResult? Function(String taskId, String url, String? error)? failed,
    TResult? Function(String taskId, String url)? cancelled,
  }) {
    return failed?.call(taskId, url, error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String taskId, int percentage, String url)? ongoing,
    TResult Function(String taskId, String url)? completed,
    TResult Function(String taskId, String url, String? error)? failed,
    TResult Function(String taskId, String url)? cancelled,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(taskId, url, error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnGoing value) ongoing,
    required TResult Function(Completed value) completed,
    required TResult Function(Failed value) failed,
    required TResult Function(Cancelled value) cancelled,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnGoing value)? ongoing,
    TResult? Function(Completed value)? completed,
    TResult? Function(Failed value)? failed,
    TResult? Function(Cancelled value)? cancelled,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnGoing value)? ongoing,
    TResult Function(Completed value)? completed,
    TResult Function(Failed value)? failed,
    TResult Function(Cancelled value)? cancelled,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class Failed extends TaskStatus {
  factory Failed(
      {required final String taskId,
      required final String url,
      final String? error}) = _$Failed;
  Failed._() : super._();

  @override
  String get taskId;
  @override
  String get url;
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$FailedCopyWith<_$Failed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CancelledCopyWith<$Res> implements $TaskStatusCopyWith<$Res> {
  factory _$$CancelledCopyWith(
          _$Cancelled value, $Res Function(_$Cancelled) then) =
      __$$CancelledCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String taskId, String url});
}

/// @nodoc
class __$$CancelledCopyWithImpl<$Res>
    extends _$TaskStatusCopyWithImpl<$Res, _$Cancelled>
    implements _$$CancelledCopyWith<$Res> {
  __$$CancelledCopyWithImpl(
      _$Cancelled _value, $Res Function(_$Cancelled) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = null,
    Object? url = null,
  }) {
    return _then(_$Cancelled(
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Cancelled extends Cancelled {
  _$Cancelled({required this.taskId, required this.url}) : super._();

  @override
  final String taskId;
  @override
  final String url;

  @override
  String toString() {
    return 'TaskStatus.cancelled(taskId: $taskId, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Cancelled &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            (identical(other.url, url) || other.url == url));
  }

  @override
  int get hashCode => Object.hash(runtimeType, taskId, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CancelledCopyWith<_$Cancelled> get copyWith =>
      __$$CancelledCopyWithImpl<_$Cancelled>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String taskId, int percentage, String url)
        ongoing,
    required TResult Function(String taskId, String url) completed,
    required TResult Function(String taskId, String url, String? error) failed,
    required TResult Function(String taskId, String url) cancelled,
  }) {
    return cancelled(taskId, url);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String taskId, int percentage, String url)? ongoing,
    TResult? Function(String taskId, String url)? completed,
    TResult? Function(String taskId, String url, String? error)? failed,
    TResult? Function(String taskId, String url)? cancelled,
  }) {
    return cancelled?.call(taskId, url);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String taskId, int percentage, String url)? ongoing,
    TResult Function(String taskId, String url)? completed,
    TResult Function(String taskId, String url, String? error)? failed,
    TResult Function(String taskId, String url)? cancelled,
    required TResult orElse(),
  }) {
    if (cancelled != null) {
      return cancelled(taskId, url);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnGoing value) ongoing,
    required TResult Function(Completed value) completed,
    required TResult Function(Failed value) failed,
    required TResult Function(Cancelled value) cancelled,
  }) {
    return cancelled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnGoing value)? ongoing,
    TResult? Function(Completed value)? completed,
    TResult? Function(Failed value)? failed,
    TResult? Function(Cancelled value)? cancelled,
  }) {
    return cancelled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnGoing value)? ongoing,
    TResult Function(Completed value)? completed,
    TResult Function(Failed value)? failed,
    TResult Function(Cancelled value)? cancelled,
    required TResult orElse(),
  }) {
    if (cancelled != null) {
      return cancelled(this);
    }
    return orElse();
  }
}

abstract class Cancelled extends TaskStatus {
  factory Cancelled({required final String taskId, required final String url}) =
      _$Cancelled;
  Cancelled._() : super._();

  @override
  String get taskId;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$CancelledCopyWith<_$Cancelled> get copyWith =>
      throw _privateConstructorUsedError;
}
