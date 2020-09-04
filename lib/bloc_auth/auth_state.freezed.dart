// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$AuthStateTearOff {
  const _$AuthStateTearOff();

// ignore: unused_element
  _AuthCheckIdToken checkIdToken() {
    return const _AuthCheckIdToken();
  }

// ignore: unused_element
  _AuthIsLogin isLogin(bool isLogin, String idToken) {
    return _AuthIsLogin(
      isLogin,
      idToken,
    );
  }

// ignore: unused_element
  _AuthError error() {
    return const _AuthError();
  }
}

// ignore: unused_element
const $AuthState = _$AuthStateTearOff();

mixin _$AuthState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result checkIdToken(),
    @required Result isLogin(bool isLogin, String idToken),
    @required Result error(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result checkIdToken(),
    Result isLogin(bool isLogin, String idToken),
    Result error(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result checkIdToken(_AuthCheckIdToken value),
    @required Result isLogin(_AuthIsLogin value),
    @required Result error(_AuthError value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result checkIdToken(_AuthCheckIdToken value),
    Result isLogin(_AuthIsLogin value),
    Result error(_AuthError value),
    @required Result orElse(),
  });
}

abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
}

class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;
}

abstract class _$AuthCheckIdTokenCopyWith<$Res> {
  factory _$AuthCheckIdTokenCopyWith(
          _AuthCheckIdToken value, $Res Function(_AuthCheckIdToken) then) =
      __$AuthCheckIdTokenCopyWithImpl<$Res>;
}

class __$AuthCheckIdTokenCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements _$AuthCheckIdTokenCopyWith<$Res> {
  __$AuthCheckIdTokenCopyWithImpl(
      _AuthCheckIdToken _value, $Res Function(_AuthCheckIdToken) _then)
      : super(_value, (v) => _then(v as _AuthCheckIdToken));

  @override
  _AuthCheckIdToken get _value => super._value as _AuthCheckIdToken;
}

class _$_AuthCheckIdToken implements _AuthCheckIdToken {
  const _$_AuthCheckIdToken();

  @override
  String toString() {
    return 'AuthState.checkIdToken()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _AuthCheckIdToken);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result checkIdToken(),
    @required Result isLogin(bool isLogin, String idToken),
    @required Result error(),
  }) {
    assert(checkIdToken != null);
    assert(isLogin != null);
    assert(error != null);
    return checkIdToken();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result checkIdToken(),
    Result isLogin(bool isLogin, String idToken),
    Result error(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (checkIdToken != null) {
      return checkIdToken();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result checkIdToken(_AuthCheckIdToken value),
    @required Result isLogin(_AuthIsLogin value),
    @required Result error(_AuthError value),
  }) {
    assert(checkIdToken != null);
    assert(isLogin != null);
    assert(error != null);
    return checkIdToken(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result checkIdToken(_AuthCheckIdToken value),
    Result isLogin(_AuthIsLogin value),
    Result error(_AuthError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (checkIdToken != null) {
      return checkIdToken(this);
    }
    return orElse();
  }
}

abstract class _AuthCheckIdToken implements AuthState {
  const factory _AuthCheckIdToken() = _$_AuthCheckIdToken;
}

abstract class _$AuthIsLoginCopyWith<$Res> {
  factory _$AuthIsLoginCopyWith(
          _AuthIsLogin value, $Res Function(_AuthIsLogin) then) =
      __$AuthIsLoginCopyWithImpl<$Res>;
  $Res call({bool isLogin, String idToken});
}

class __$AuthIsLoginCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$AuthIsLoginCopyWith<$Res> {
  __$AuthIsLoginCopyWithImpl(
      _AuthIsLogin _value, $Res Function(_AuthIsLogin) _then)
      : super(_value, (v) => _then(v as _AuthIsLogin));

  @override
  _AuthIsLogin get _value => super._value as _AuthIsLogin;

  @override
  $Res call({
    Object isLogin = freezed,
    Object idToken = freezed,
  }) {
    return _then(_AuthIsLogin(
      isLogin == freezed ? _value.isLogin : isLogin as bool,
      idToken == freezed ? _value.idToken : idToken as String,
    ));
  }
}

class _$_AuthIsLogin implements _AuthIsLogin {
  const _$_AuthIsLogin(this.isLogin, this.idToken)
      : assert(isLogin != null),
        assert(idToken != null);

  @override
  final bool isLogin;
  @override
  final String idToken;

  @override
  String toString() {
    return 'AuthState.isLogin(isLogin: $isLogin, idToken: $idToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AuthIsLogin &&
            (identical(other.isLogin, isLogin) ||
                const DeepCollectionEquality()
                    .equals(other.isLogin, isLogin)) &&
            (identical(other.idToken, idToken) ||
                const DeepCollectionEquality().equals(other.idToken, idToken)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isLogin) ^
      const DeepCollectionEquality().hash(idToken);

  @override
  _$AuthIsLoginCopyWith<_AuthIsLogin> get copyWith =>
      __$AuthIsLoginCopyWithImpl<_AuthIsLogin>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result checkIdToken(),
    @required Result isLogin(bool isLogin, String idToken),
    @required Result error(),
  }) {
    assert(checkIdToken != null);
    assert(isLogin != null);
    assert(error != null);
    return isLogin(this.isLogin, idToken);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result checkIdToken(),
    Result isLogin(bool isLogin, String idToken),
    Result error(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (isLogin != null) {
      return isLogin(this.isLogin, idToken);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result checkIdToken(_AuthCheckIdToken value),
    @required Result isLogin(_AuthIsLogin value),
    @required Result error(_AuthError value),
  }) {
    assert(checkIdToken != null);
    assert(isLogin != null);
    assert(error != null);
    return isLogin(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result checkIdToken(_AuthCheckIdToken value),
    Result isLogin(_AuthIsLogin value),
    Result error(_AuthError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (isLogin != null) {
      return isLogin(this);
    }
    return orElse();
  }
}

abstract class _AuthIsLogin implements AuthState {
  const factory _AuthIsLogin(bool isLogin, String idToken) = _$_AuthIsLogin;

  bool get isLogin;
  String get idToken;
  _$AuthIsLoginCopyWith<_AuthIsLogin> get copyWith;
}

abstract class _$AuthErrorCopyWith<$Res> {
  factory _$AuthErrorCopyWith(
          _AuthError value, $Res Function(_AuthError) then) =
      __$AuthErrorCopyWithImpl<$Res>;
}

class __$AuthErrorCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$AuthErrorCopyWith<$Res> {
  __$AuthErrorCopyWithImpl(_AuthError _value, $Res Function(_AuthError) _then)
      : super(_value, (v) => _then(v as _AuthError));

  @override
  _AuthError get _value => super._value as _AuthError;
}

class _$_AuthError implements _AuthError {
  const _$_AuthError();

  @override
  String toString() {
    return 'AuthState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _AuthError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result checkIdToken(),
    @required Result isLogin(bool isLogin, String idToken),
    @required Result error(),
  }) {
    assert(checkIdToken != null);
    assert(isLogin != null);
    assert(error != null);
    return error();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result checkIdToken(),
    Result isLogin(bool isLogin, String idToken),
    Result error(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result checkIdToken(_AuthCheckIdToken value),
    @required Result isLogin(_AuthIsLogin value),
    @required Result error(_AuthError value),
  }) {
    assert(checkIdToken != null);
    assert(isLogin != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result checkIdToken(_AuthCheckIdToken value),
    Result isLogin(_AuthIsLogin value),
    Result error(_AuthError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _AuthError implements AuthState {
  const factory _AuthError() = _$_AuthError;
}
