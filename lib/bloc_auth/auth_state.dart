
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.checkIdToken() = _AuthCheckIdToken;
  const factory AuthState.isLogin(bool isLogin, String idToken) = _AuthIsLogin;
  const factory AuthState.error() = _AuthError;
}
