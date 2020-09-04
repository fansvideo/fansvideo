import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fansvideo/bloc_auth/bloc.dart';
import 'package:fansvideo/models/auth0_info.dart';
import 'package:fansvideo/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;

  AuthBloc({this.repository})
      : assert(repository != null),
        super(AuthState.checkIdToken());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event,) async* {
    if (event is AuthEvent) {
      yield AuthState.checkIdToken();
      try {
        final Auth0Info auth0info = await repository.getAuth0Info();
        String token = auth0info.idToken;
        yield AuthState.isLogin(!JwtDecoder.isExpired(token), auth0info.idToken);
      } catch(_) {
        yield AuthState.error();
      }
    }
  }
}
