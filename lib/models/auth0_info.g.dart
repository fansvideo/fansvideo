// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth0_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Auth0Info _$_$_Auth0InfoFromJson(Map<String, dynamic> json) {
  return _$_Auth0Info(
    idToken: json['id_token'] as String,
    accessToken: json['access_token'] as String,
    expiresIn: json['expires_in'] as int,
  );
}

Map<String, dynamic> _$_$_Auth0InfoToJson(_$_Auth0Info instance) =>
    <String, dynamic>{
      'id_token': instance.idToken,
      'access_token': instance.accessToken,
      'expires_in': instance.expiresIn,
    };
