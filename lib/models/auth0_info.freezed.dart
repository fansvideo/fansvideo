// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'auth0_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Auth0Info _$Auth0InfoFromJson(Map<String, dynamic> json) {
  return _Auth0Info.fromJson(json);
}

class _$Auth0InfoTearOff {
  const _$Auth0InfoTearOff();

// ignore: unused_element
  _Auth0Info call(
      {@JsonKey(name: 'id_token') String idToken,
      @JsonKey(name: 'access_token') String accessToken,
      @JsonKey(name: 'expires_in') int expiresIn}) {
    return _Auth0Info(
      idToken: idToken,
      accessToken: accessToken,
      expiresIn: expiresIn,
    );
  }
}

// ignore: unused_element
const $Auth0Info = _$Auth0InfoTearOff();

mixin _$Auth0Info {
  @JsonKey(name: 'id_token')
  String get idToken;
  @JsonKey(name: 'access_token')
  String get accessToken;
  @JsonKey(name: 'expires_in')
  int get expiresIn;

  Map<String, dynamic> toJson();
  $Auth0InfoCopyWith<Auth0Info> get copyWith;
}

abstract class $Auth0InfoCopyWith<$Res> {
  factory $Auth0InfoCopyWith(Auth0Info value, $Res Function(Auth0Info) then) =
      _$Auth0InfoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id_token') String idToken,
      @JsonKey(name: 'access_token') String accessToken,
      @JsonKey(name: 'expires_in') int expiresIn});
}

class _$Auth0InfoCopyWithImpl<$Res> implements $Auth0InfoCopyWith<$Res> {
  _$Auth0InfoCopyWithImpl(this._value, this._then);

  final Auth0Info _value;
  // ignore: unused_field
  final $Res Function(Auth0Info) _then;

  @override
  $Res call({
    Object idToken = freezed,
    Object accessToken = freezed,
    Object expiresIn = freezed,
  }) {
    return _then(_value.copyWith(
      idToken: idToken == freezed ? _value.idToken : idToken as String,
      accessToken:
          accessToken == freezed ? _value.accessToken : accessToken as String,
      expiresIn: expiresIn == freezed ? _value.expiresIn : expiresIn as int,
    ));
  }
}

abstract class _$Auth0InfoCopyWith<$Res> implements $Auth0InfoCopyWith<$Res> {
  factory _$Auth0InfoCopyWith(
          _Auth0Info value, $Res Function(_Auth0Info) then) =
      __$Auth0InfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id_token') String idToken,
      @JsonKey(name: 'access_token') String accessToken,
      @JsonKey(name: 'expires_in') int expiresIn});
}

class __$Auth0InfoCopyWithImpl<$Res> extends _$Auth0InfoCopyWithImpl<$Res>
    implements _$Auth0InfoCopyWith<$Res> {
  __$Auth0InfoCopyWithImpl(_Auth0Info _value, $Res Function(_Auth0Info) _then)
      : super(_value, (v) => _then(v as _Auth0Info));

  @override
  _Auth0Info get _value => super._value as _Auth0Info;

  @override
  $Res call({
    Object idToken = freezed,
    Object accessToken = freezed,
    Object expiresIn = freezed,
  }) {
    return _then(_Auth0Info(
      idToken: idToken == freezed ? _value.idToken : idToken as String,
      accessToken:
          accessToken == freezed ? _value.accessToken : accessToken as String,
      expiresIn: expiresIn == freezed ? _value.expiresIn : expiresIn as int,
    ));
  }
}

@JsonSerializable()
class _$_Auth0Info implements _Auth0Info {
  _$_Auth0Info(
      {@JsonKey(name: 'id_token') this.idToken,
      @JsonKey(name: 'access_token') this.accessToken,
      @JsonKey(name: 'expires_in') this.expiresIn});

  factory _$_Auth0Info.fromJson(Map<String, dynamic> json) =>
      _$_$_Auth0InfoFromJson(json);

  @override
  @JsonKey(name: 'id_token')
  final String idToken;
  @override
  @JsonKey(name: 'access_token')
  final String accessToken;
  @override
  @JsonKey(name: 'expires_in')
  final int expiresIn;

  @override
  String toString() {
    return 'Auth0Info(idToken: $idToken, accessToken: $accessToken, expiresIn: $expiresIn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Auth0Info &&
            (identical(other.idToken, idToken) ||
                const DeepCollectionEquality()
                    .equals(other.idToken, idToken)) &&
            (identical(other.accessToken, accessToken) ||
                const DeepCollectionEquality()
                    .equals(other.accessToken, accessToken)) &&
            (identical(other.expiresIn, expiresIn) ||
                const DeepCollectionEquality()
                    .equals(other.expiresIn, expiresIn)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(idToken) ^
      const DeepCollectionEquality().hash(accessToken) ^
      const DeepCollectionEquality().hash(expiresIn);

  @override
  _$Auth0InfoCopyWith<_Auth0Info> get copyWith =>
      __$Auth0InfoCopyWithImpl<_Auth0Info>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_Auth0InfoToJson(this);
  }
}

abstract class _Auth0Info implements Auth0Info {
  factory _Auth0Info(
      {@JsonKey(name: 'id_token') String idToken,
      @JsonKey(name: 'access_token') String accessToken,
      @JsonKey(name: 'expires_in') int expiresIn}) = _$_Auth0Info;

  factory _Auth0Info.fromJson(Map<String, dynamic> json) =
      _$_Auth0Info.fromJson;

  @override
  @JsonKey(name: 'id_token')
  String get idToken;
  @override
  @JsonKey(name: 'access_token')
  String get accessToken;
  @override
  @JsonKey(name: 'expires_in')
  int get expiresIn;
  @override
  _$Auth0InfoCopyWith<_Auth0Info> get copyWith;
}
