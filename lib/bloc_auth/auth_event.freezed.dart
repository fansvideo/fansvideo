// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'auth_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$AuthEventTearOff {
  const _$AuthEventTearOff();

// ignore: unused_element
  AuthInitialEvent initial() {
    return const AuthInitialEvent();
  }

// ignore: unused_element
  AuthLogOutEvent logOut() {
    return const AuthLogOutEvent();
  }
}

// ignore: unused_element
const $AuthEvent = _$AuthEventTearOff();

mixin _$AuthEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result logOut(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result logOut(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(AuthInitialEvent value),
    @required Result logOut(AuthLogOutEvent value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(AuthInitialEvent value),
    Result logOut(AuthLogOutEvent value),
    @required Result orElse(),
  });
}

abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res>;
}

class _$AuthEventCopyWithImpl<$Res> implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  final AuthEvent _value;
  // ignore: unused_field
  final $Res Function(AuthEvent) _then;
}

abstract class $AuthInitialEventCopyWith<$Res> {
  factory $AuthInitialEventCopyWith(
          AuthInitialEvent value, $Res Function(AuthInitialEvent) then) =
      _$AuthInitialEventCopyWithImpl<$Res>;
}

class _$AuthInitialEventCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res>
    implements $AuthInitialEventCopyWith<$Res> {
  _$AuthInitialEventCopyWithImpl(
      AuthInitialEvent _value, $Res Function(AuthInitialEvent) _then)
      : super(_value, (v) => _then(v as AuthInitialEvent));

  @override
  AuthInitialEvent get _value => super._value as AuthInitialEvent;
}

class _$AuthInitialEvent implements AuthInitialEvent {
  const _$AuthInitialEvent();

  @override
  String toString() {
    return 'AuthEvent.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is AuthInitialEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result logOut(),
  }) {
    assert(initial != null);
    assert(logOut != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result logOut(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(AuthInitialEvent value),
    @required Result logOut(AuthLogOutEvent value),
  }) {
    assert(initial != null);
    assert(logOut != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(AuthInitialEvent value),
    Result logOut(AuthLogOutEvent value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class AuthInitialEvent implements AuthEvent {
  const factory AuthInitialEvent() = _$AuthInitialEvent;
}

abstract class $AuthLogOutEventCopyWith<$Res> {
  factory $AuthLogOutEventCopyWith(
          AuthLogOutEvent value, $Res Function(AuthLogOutEvent) then) =
      _$AuthLogOutEventCopyWithImpl<$Res>;
}

class _$AuthLogOutEventCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res>
    implements $AuthLogOutEventCopyWith<$Res> {
  _$AuthLogOutEventCopyWithImpl(
      AuthLogOutEvent _value, $Res Function(AuthLogOutEvent) _then)
      : super(_value, (v) => _then(v as AuthLogOutEvent));

  @override
  AuthLogOutEvent get _value => super._value as AuthLogOutEvent;
}

class _$AuthLogOutEvent implements AuthLogOutEvent {
  const _$AuthLogOutEvent();

  @override
  String toString() {
    return 'AuthEvent.logOut()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is AuthLogOutEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result logOut(),
  }) {
    assert(initial != null);
    assert(logOut != null);
    return logOut();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result logOut(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (logOut != null) {
      return logOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(AuthInitialEvent value),
    @required Result logOut(AuthLogOutEvent value),
  }) {
    assert(initial != null);
    assert(logOut != null);
    return logOut(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(AuthInitialEvent value),
    Result logOut(AuthLogOutEvent value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (logOut != null) {
      return logOut(this);
    }
    return orElse();
  }
}

abstract class AuthLogOutEvent implements AuthEvent {
  const factory AuthLogOutEvent() = _$AuthLogOutEvent;
}
