import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth0_info.freezed.dart';

part 'auth0_info.g.dart';

@freezed
abstract class Auth0Info with _$Auth0Info {
  factory Auth0Info({
    @JsonKey(name: 'id_token') String idToken,
    @JsonKey(name: 'access_token') String accessToken,
    @JsonKey(name: 'expires_in') int expiresIn,
  }) = _Auth0Info;

  factory Auth0Info.fromJson(Map<String, dynamic> json) =>
      _$Auth0InfoFromJson(json);
}
